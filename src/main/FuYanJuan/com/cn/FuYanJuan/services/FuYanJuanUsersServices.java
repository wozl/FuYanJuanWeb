package com.cn.FuYanJuan.services;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.FuYanJuan.bean.Article;
import com.cn.FuYanJuan.bean.Message_board;
import com.cn.FuYanJuan.bean.Photo_wall;
import com.cn.FuYanJuan.bean.Users;
import com.cn.FuYanJuan.dao.ArticleDAO;
import com.cn.FuYanJuan.dao.Message_boardDAO;
import com.cn.FuYanJuan.dao.Photo_wallDAO;
import com.cn.FuYanJuan.dao.UsersDAO;
import com.cn.FuYanJuan.util.PageUtil;
/**
 * 
 * @author LQ & FuYanJuan
 *用户业务层
 */
@Service
public class FuYanJuanUsersServices {



	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private ArticleDAO articleDAO;
	
	@Autowired
	private Message_boardDAO message_boardDAO;
	
	@Autowired
	private Photo_wallDAO photo_wallDAO;
	
	/**
	 * 检查注册的用户名是否已经被注册
	 * @return
	 */
	public boolean selectByName(String name){
		if(usersDAO.selectByName(name)!=null){
			return false;
		}
		return true;
	}
	
	/**
	 * 通过用户名查找指定用户信息
	 * @param name
	 * @return
	 */
	public Users selectByNames(String name){
		return usersDAO.selectByNames(name);
	}
	
	/**
	 * 通过id查找用户
	 * @param id
	 * @return
	 */
	public Users selectById(Integer id){
		return usersDAO.selectById(id);
	}
	
	
	/**
	 * 用户注册
	 * @param users
	 * @return
	 */
	public boolean reg(Users users){
		if(usersDAO.addUser(users)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 登录
	 * @param users
	 * @return
	 */
	public boolean Login(Users users){
		if(usersDAO.selectLogin(users.getUserName(), users.getPassWord())!=null){
			return true;
		}
		return false;
	}
	
	/**
	 * 检查是否是管理员
	 * @param name
	 * @return
	 */
	public boolean CheckAdmin(String name){
		if(usersDAO.checkAdmin(name)!=null){
			return true;
		}
		return false;
	}
	
	/**
	 * 发表文章
	 * @param article
	 * @return
	 */
	public boolean publish_article(Article article){
		if(articleDAO.InsertArticle(article)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 分页
	 * @param currentPage
	 * @return
	 */
	public PageUtil<Article>findByPage(int currentPage,HttpSession session){
		HashMap<String, Object>map=new HashMap<String,Object>();
		PageUtil<Article> pageUtil= new PageUtil<Article>();
		//封装当前页数
		pageUtil.setCurrPage(currentPage);
		//每页显示多少条数据
		int pageSize=6;
		pageUtil.setPageSize(pageSize);
		
		//总记录数
		int totalCount =articleDAO.contArticle();
		System.out.println(totalCount);
		pageUtil.setTotalCount(totalCount);
		
		//总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);//向上取整
		System.out.println(num);
		pageUtil.setTotalPage(num.intValue());
		
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", pageUtil.getPageSize());
		
		map.put("id",usersDAO.selectByNames(session.getAttribute("username").toString()).getId());
		//封装每页显示的数据
		List<Article>lists=articleDAO.findByPage(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}
	
	/***
	 * 查询登录用户的所有文章并分页
	 * @param currentPage
	 * @param session
	 * @return
	 */
	public PageUtil<Article>findById(int currentPage,HttpSession session){
		HashMap<String, Object>map=new HashMap<String,Object>();
		PageUtil<Article> pageUtil= new PageUtil<Article>();
		//封装当前页数
		pageUtil.setCurrPage(currentPage);
		//每页显示多少条数据
		int pageSize=6;
		pageUtil.setPageSize(pageSize);
		
		//总记录数
		int totalCount =articleDAO.contArticle();
		System.out.println(totalCount);
		pageUtil.setTotalCount(totalCount);
		
		//总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);//向上取整
		System.out.println(num);
		pageUtil.setTotalPage(num.intValue());
		
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", pageUtil.getPageSize());
		
		map.put("id",usersDAO.selectByNames(session.getAttribute("username").toString()).getId());
		//封装每页显示的数据
		List<Article>lists=articleDAO.findById(map);
		
		System.out.println(lists);
		pageUtil.setLists(lists);
		return pageUtil;
	}
	
	/**
	 * 不区分用户查询总文章并分页
	 * @param currentPage
	 * @return
	 */
	public PageUtil<Article>findAll(int currentPage){
		HashMap<String, Object>map=new HashMap<String,Object>();
		PageUtil<Article> pageUtil= new PageUtil<Article>();
		//封装当前页数
		pageUtil.setCurrPage(currentPage);
		//每页显示多少条数据
		int pageSize=6;
		pageUtil.setPageSize(pageSize);
		
		//总记录数
		int totalCount =articleDAO.contArticle();
		System.out.println(totalCount);
		pageUtil.setTotalCount(totalCount);
		
		//总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);//向上取整
		System.out.println(num);
		pageUtil.setTotalPage(num.intValue());
		
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", pageUtil.getPageSize());
		//封装每页显示的数据
		List<Article>lists=articleDAO.findAll(map);
		
		System.out.println(lists);
		pageUtil.setLists(lists);
		return pageUtil;
	}
	
	
	/**
	 * 根据标题查询文章信息
	 * @param title
	 * @return
	 */
	public Article article(String title){
		return articleDAO.selectByTitle(title);
	}
	
	/**
	 * 添加留言
	 * @param message_board
	 * @return
	 */
	public boolean addmessage(Message_board message_board){
		if(message_boardDAO.AddMessage(message_board)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 查询所有留言板信息
	 * @return
	 */
	public List<Message_board>allmessage(){
		return message_boardDAO.AllMessage();
	}
	
	/**
	 * 添加照片墙信息
	 * @param photo_wall
	 * @return
	 */
	public boolean AddPhoto(Photo_wall photo_wall){
		if(photo_wallDAO.addPhoto(photo_wall)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 所有照片墙的照片信息
	 * @return
	 */
	public List<Photo_wall> allPhoto(){
		return photo_wallDAO.allPhoto();
	}
	
}
