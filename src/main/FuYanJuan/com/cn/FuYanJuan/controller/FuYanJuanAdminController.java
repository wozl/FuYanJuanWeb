package com.cn.FuYanJuan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cn.FuYanJuan.bean.Article;
import com.cn.FuYanJuan.bean.Photo_wall;
import com.cn.FuYanJuan.bean.TempUsers;
import com.cn.FuYanJuan.bean.Users;
import com.cn.FuYanJuan.services.FuYanJuanAdminServices;
import com.cn.FuYanJuan.util.MD5;
import com.cn.FuYanJuan.util.MailUtils;
import com.cn.FuYanJuan.util.PageUtil;

/**
 * @author LQ & FuYanJuan
 *
 *管理员行为控制层
 */
@Controller
@RequestMapping("/Admin")
public class FuYanJuanAdminController {

	@Autowired
	private FuYanJuanAdminServices FuYanJuanAdminServices;
	
	/**
	 * 去首页
	 * @return
	 */
	@RequestMapping(value="/index.do")
	public String index(){
		return "index";
	}
	
	/**
	 * 管理员后台首页
	 * @return
	 */
	@RequestMapping(value="/adminIndex.do")
	public String adminIndex(){
		return "/admin/index";
	}
	
	/**
	 * 忘记密码页
	 * @return
	 */
	@RequestMapping(value="/reqpass.do")
	public String reqpass(){
		return "/reqpass";
	}
	
	/**
	 * 密码重置
	 * @return
	 */
	@RequestMapping(value="/restpass.do")
	public String restpass(){
		return "/restpass";
	}
	
	/**
	 * 管理员文章发布页
	 * @return
	 */
	@RequestMapping(value="/adminForm.do")
	public String adminForm(){
		return "/admin/form";
	}
	
	/**
	 * 管理员学生管理页
	 * @return
	 */
	@RequestMapping(value="/adminchart.do")
	public String adminchart(){
		return "/admin/chart";
	}
	
	/**
	 * 管理员照片墙
	 * @return
	 */
	@RequestMapping(value="/adminPhoto_wall.do")
	public String adminPhoto_wall(){
		return "/admin/table-list-img";
	}
	
	/**
	 * 管理员文章评阅页面
	 * @return
	 */
	@RequestMapping(value="/admintables.do")
	public String admintables(){
		return "/admin/tables";
	}
	
	/**
	 * 查询所有学生
	 * @param currentPage
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/alluser.do",method=RequestMethod.POST)
	@ResponseBody
	public PageUtil<Users> alluser(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,HttpServletRequest request,HttpServletResponse response){
		return FuYanJuanAdminServices.users(currentPage);
	}
	
	/**
	 * 更新学生密码
	 * @param users
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/updataPass.do")
	@ResponseBody
	public Integer updataPass(Users users ,HttpServletRequest request,HttpServletResponse response){
		Integer code=-1;
		MD5 md5= new MD5();
		users.setPassWord(md5.getMD5(md5.getMD5(users.getPassWord())));
		if(FuYanJuanAdminServices.updataPass(users)){
			code=0;
		}
		return code;
	}
	
	/**
	 * 查询系统中所有用户的文章信息
	 * @param currentPage
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ArticleAll.do",method=RequestMethod.POST)
	@ResponseBody
	public PageUtil<Article>all(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,HttpServletRequest request){
		return FuYanJuanAdminServices.findAll(currentPage);
	}
	
	/**
	 * 根据文章标题查询文章详细信息
	 * @param title
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/ArticleEdit.do")
	public String ArticleEdit(String title,Model model){
		//System.out.println(title);
		List<Article> article=FuYanJuanAdminServices.articles(title);
		System.out.println(article);
		model.addAttribute("Title", article.get(0).getTitle());
		model.addAttribute("time",article.get(0).getIssuing_Time());
		model.addAttribute("content", article.get(0).getContent());
		model.addAttribute("Author", article.get(0).getUsers().getUserName());
		return "/admin/tables";
	}
	
	/**
	 * 通过姓名查找用户，模糊搜索
	 * @param name
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/SearchByName.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Users>SearchByName(@RequestParam String name,HttpServletRequest request){
		return FuYanJuanAdminServices.SearchByName(name);
	}
	
	/**
	 * 通过姓名精确查找用户资料
	 * @param name
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/UsersInfo.do",method=RequestMethod.POST)
	@ResponseBody
	public TempUsers tempUsers(@RequestParam String name,HttpServletRequest request){
		Users users=FuYanJuanAdminServices.SelectByName(name);
		TempUsers tempUsers= new TempUsers();
		BeanUtils.copyProperties(users,tempUsers);
		return tempUsers;
	}
	
	/**
	 * 查找文章标题，模糊搜索
	 * @param title
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/SearchByTitle.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Article>SearchByTitle(@RequestParam String title,HttpServletRequest request){
		return FuYanJuanAdminServices.SearchByTitle(title);
	}
	
	/**
	 * 通过文章标题查找文章，精确查找
	 * @param title
	 * @param request
	 * @return
	 */
	@RequestMapping(value="TitleInfo.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Article>SearchTitle(@RequestParam String title,HttpServletRequest request){
		List<Article> articles=FuYanJuanAdminServices.articles(title);
		return articles;
	}
	
	/**
	 * 发送重置密码连接的邮件
	 * @param email
	 * @param request
	 * @return
	 */
	@RequestMapping(value="email.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer code(@RequestParam String email,HttpServletRequest request){
		Integer code=0;
		MailUtils utils = new MailUtils("liangquanjob.cn");
		utils.setFrom("root@liangquanjob.cn");  
        utils.setSubject("test");  
        utils.setNamePass("xxx","xxx");  
        utils.setBody("尊敬的用户，您的密码重置地址：www.liangquanjob.cn/Admin/restpass.do，请您通过此地址重置您的密码。");  
        utils.setTo(email);  
        utils.sendout(); 
		return code;
	}
	
	/**
	 * 外置连接更新密码
	 * @param users
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="upps.do",method=RequestMethod.POST)
	@ResponseBody
	public Integer code(@RequestParam String name,@RequestParam String pass,HttpServletRequest request,HttpServletResponse response){
		Integer code=0;
		MD5 md5= new MD5();
		System.out.println(name);
		if(FuYanJuanAdminServices.SelectByName(name)!=null){
			Users users= new Users();
			users.setUserName(name);
			users.setPassWord(md5.getMD5(md5.getMD5(pass)));
			if(FuYanJuanAdminServices.updatepass(users)){
				code=1;
			}
		}
		return code;
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
	@RequestMapping(value="/addPhoto.do",method=RequestMethod.POST)
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
		if(FuYanJuanAdminServices.AddPhoto(photo_wall)){
			code=0;
		}
		return code;
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
