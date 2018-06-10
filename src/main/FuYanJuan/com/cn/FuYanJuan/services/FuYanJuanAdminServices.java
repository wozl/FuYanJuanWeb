package com.cn.FuYanJuan.services;

import java.util.HashMap;
import java.util.List;

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
 *
 *管理员业务层
 */
@Service
public class FuYanJuanAdminServices {

	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private ArticleDAO articleDAO;
	
	@Autowired
	private Message_boardDAO message_boardDAO;
	
	@Autowired
	private Photo_wallDAO photo_wallDAO;
	
	/**
	 * 查询所有用户并分页
	 * @param currentPage
	 * @return
	 */
	public PageUtil<Users> users(int currentPage){
		HashMap<String, Object>map=new HashMap<String,Object>();
		PageUtil<Users> pageUtil= new PageUtil<Users>();
		//封装当前页数
		pageUtil.setCurrPage(currentPage);
		//每页显示多少条数据
		int pageSize=6;
		pageUtil.setPageSize(pageSize);
		
		//总记录数
		int totalCount =usersDAO.contUsers();
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
		List<Users>lists=usersDAO.selectAll(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}
	
	/**
	 * 更新用户密码
	 * @param users
	 * @return
	 */
	public boolean updataPass(Users users){
		if(usersDAO.updateUserPwd(users)>0){
			return true;
		}
		return false;
	}
	
	public boolean updatepass(Users users){
		if(usersDAO.updatepass(users)>0){
			return true;
		}
		return false;
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
	 * 根据文章标题查询文章的详细信息，不包含作者名字
	 * @param title
	 * @return
	 */
	public Article article(String title){
		return articleDAO.selectByTitle(title);
	}
	
	/**
	 * 根据文章标题查询文章的详细信息,包含作者信息
	 * @param title
	 * @return
	 */
	public List<Article> articles(String title){
		return articleDAO.selectBytitle(title);
	}
	
	/**
	 * 通过姓名查找用户，模糊搜索方式
	 * @param name
	 * @return
	 */
	public List<Users>SearchByName(String name){
		return usersDAO.SearchByName(name);
	}
	
	/**
	 * 通过姓名查找用户信息，精确查找
	 * @param name
	 * @return
	 */
	public Users SelectByName(String name){
		return usersDAO.selectByName(name);
	}
	
	/**
	 * 查找文章标题，模糊搜索方式
	 * @param title
	 * @return
	 */
	public List<Article>SearchByTitle(String title){
		return articleDAO.SearchByTitle(title);
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
	
	
}
