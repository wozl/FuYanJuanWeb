package com.cn.FuYanJuan.controller;






import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cn.FuYanJuan.bean.Article;
import com.cn.FuYanJuan.bean.Message_board;
import com.cn.FuYanJuan.bean.Photo_wall;
import com.cn.FuYanJuan.bean.Users;
import com.cn.FuYanJuan.services.FuYanJuanAdminServices;
import com.cn.FuYanJuan.services.FuYanJuanUsersServices;
import com.cn.FuYanJuan.util.MD5;
import com.cn.FuYanJuan.util.PageUtil;


/**
 * @author LQ & FuYanJuan
 *用户行为控制层
 */
@Controller
@RequestMapping("/FuYanJuan")
public class FuYanJuanUsersController {

	@Autowired
	private FuYanJuanUsersServices FuYanJuanUsersServices;
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping(value="/index.do")
	public String index(){
		return "index";
	}
	/**
	 * 注册页
	 * @return
	 */
	@RequestMapping(value="/regindex.do")
	public String regindex(){
		return "sign-up";
	}
	
	/**
	 * 登录页
	 * @return
	 */
	@RequestMapping(value="/loginIndex.do")
	public String loginIndex(){
	return "login";
	}
	
	/**
	 * 文章提交页
	 * @return
	 */
	@RequestMapping(value="/form.do")
	public String form(){
		return "/student/form";
	}
	
	/**
	 * 照片墙页面
	 * @return
	 */
	@RequestMapping(value="/photo_wall.do")
	public String photo_wall(){
		return "/student/table-list-img";
	}
	
	/**
	 * 用户注册
	 * @param users
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/reg.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer reg(Users users,HttpServletRequest request,HttpServletResponse response){
		Integer code=-1;
		if(FuYanJuanUsersServices.selectByName(users.getUserName())){
			MD5 md5= new MD5();
			//对用户密码进行加密,考虑到会被破解的问题，这里加密两次防止被破解s
			users.setPassWord(md5.getMD5(md5.getMD5(users.getPassWord())));
			if(FuYanJuanUsersServices.reg(users)){
				code=0;
			}
		}
		return code;
	}
	
	/**
	 * 用户登录处理
	 * @param users
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer Login(Users users,HttpServletRequest request,HttpSession session){
		Integer code=-1;
		MD5 md5=new MD5();
		users.setPassWord(md5.getMD5(md5.getMD5(users.getPassWord())));
		if(FuYanJuanUsersServices.Login(users)){
			code=1;
			session.setAttribute("username", users.getUserName());//session中储存用户名
		}
		return code;
	}
	/**登录检查
	 * 检查权限
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/checkadmin.do")
	public String CheckAdmin(HttpSession session){
		String url="login";
		if(session.getAttribute("username")!=null){
			if(FuYanJuanUsersServices.CheckAdmin(session.getAttribute("username").toString())){
			
				url="/admin/index";
			}else{
				url="/student/index";
			}
		}
		return url;
	}
	
	/**
	 * 发表文章
	 * @param article
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/publish_article.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer publish_article(Article article,HttpServletRequest request,HttpSession session){
		Integer code=-1;
		
		//FuYanJuanUsersServices.selectByNames(session.getAttribute("username").toString());
		
		article.setAuthor(FuYanJuanUsersServices.selectByNames(session.getAttribute("username").toString()).getId());
		if(FuYanJuanUsersServices.publish_article(article)){
			code=0;
		}
		return code;
	}
	
	/**
	 * 查询登录所有用户文章，并分页
	 * @param currentPage
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/Article.do",method=RequestMethod.POST)
	@ResponseBody
	public PageUtil<Article> main(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,HttpServletRequest request,HttpSession session){
		return FuYanJuanUsersServices.findById(currentPage, session);
	}
	
	/**
	 * 查询所有文章
	 * @param currentPage
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ArticleAll.do",method=RequestMethod.POST)
	@ResponseBody
	public PageUtil<Article>all(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,HttpServletRequest request){
		return FuYanJuanUsersServices.findAll(currentPage);
	}
	
	
	/**
	 * 根据文章标题查询文章详细信息
	 * @param title
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/ArticleEdit.do")
	public String ArticleEdit(String title,Model model){
		System.out.println(title);
		Article article=FuYanJuanUsersServices.article(title);
		model.addAttribute("Title", article.getTitle());
		model.addAttribute("time",article.getIssuing_Time());
		model.addAttribute("content", article.getContent());
		System.out.println(model);
		return "/student/form";
	}
	
	/**
	 * 点击标题跳转文章详情页
	 * @param title
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Articles.do")
	public String Articles(String title,Model model){
		Article article=FuYanJuanUsersServices.article(title);
		Users users=FuYanJuanUsersServices.selectById(article.getAuthor());
		model.addAttribute("Title", article.getTitle());
		model.addAttribute("time",article.getIssuing_Time());
		model.addAttribute("Author", users.getUserName());
		model.addAttribute("Content", article.getContent());
		model.addAttribute("Commentator", article.getCommentator());
		model.addAttribute("Comment", article.getComment());
		return "article";
	}
	
	/**
	 * 添加留言
	 * @param message_board
	 * @param request
	 * @param session
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/AddMessage.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer AddMessage(Message_board message_board,HttpServletRequest request,HttpSession session,HttpServletResponse response){
		Integer code=-1;
		SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		message_board.setCommenter(session.getAttribute("username").toString());
		String createtime = df.format(new Date());
		message_board.setTime(createtime);
		if(FuYanJuanUsersServices.addmessage(message_board)){
			code=0;
		}
		return code;
	}
	
	/**
	 * 查询所有留言
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/allmessage.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Message_board> allmessage(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		
		return FuYanJuanUsersServices.allmessage();
	}
	
	
	/**
	 * 文件上传
	 * @param file
	 * @param photo_wall
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="addPhoto.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer addPhoto(MultipartFile file,Photo_wall photo_wall,HttpSession session,HttpServletRequest request,HttpServletResponse response)throws IOException{
		Integer code=-1;	
		//System.out.println(photo_wall.getFileUrl()+"\n"+photo_wall.getPhoto_Description()+"\n"+photo_wall.getUploader());
		//String filePath="E:\\uploadimg";//图片上传成功后将图片地址写入数据库
		String filePath=request.getSession().getServletContext().getRealPath("file");
		 filePath="/home/file";
		String originalFilename = file.getOriginalFilename();//获取图片原始名称
		//转换为新的文件名字
		String newFileName=UUID.randomUUID()+originalFilename;
		//封装上传文件位置的全路径
		File targetFile= new File(filePath,newFileName);
		
			if(!targetFile.exists()){//检查文件存放路劲下是否存在该文件夹，如果不存在就创建该文件夹
				
				targetFile.mkdirs();//创建文件夹
			}
		//把本地文件上传到封装上传文件位置的全路径
		file.transferTo(targetFile);
		photo_wall.setFileUrl(newFileName);
		if(FuYanJuanUsersServices.AddPhoto(photo_wall)){
			code=0;
		}
		return code;
	}
	
	/**
	 * 所有照片信息
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value="allphotos.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Photo_wall> allPhoto(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		return FuYanJuanUsersServices.allPhoto();
	}
	
	
	
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/loginout.do")
	public String LoginOut(HttpServletRequest request){
		request.getSession().invalidate();//销毁session
		return "index";
	}
	
}
