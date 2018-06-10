package com.cn.FuYanJuan.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
public class Files {

	

	/**
	 * 文件上传
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/upload.do", method=RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartFile file,HttpServletRequest request,@RequestParam(required=false)String currentPage) throws IOException{
		//保存文件到指定路径
		System.out.println(currentPage);
		String path=request.getSession().getServletContext().getRealPath("file");
		System.out.println(path);
		String fileName=file.getOriginalFilename();
		File dir= new File(path,fileName);
		if(!dir.exists()){//检查文件存放路劲下是否存在该文件夹，如果不存在就创建该文件夹
			
			dir.mkdirs();//创建文件夹
		}
		//MultipartFile自带解析方法
		file.transferTo(dir);
		return "ok";
	}
	
	/**
	 * 文件下载
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/dowmload.do")
	public ResponseEntity<byte[]> download() throws IOException{
		File file=new File("E:\\Tomcat\\webapps\\FuYanJuanWeb\\file\\武汉宏鹏231班-JavaOOP第10章-1.exe");
		HttpHeaders headers=new HttpHeaders();
		String fileName= new String("a.exe".getBytes("UTF-8"),"iso-8859-1");  //解决中文乱码
		//通知浏览器以文件下载方式打开(attachment)文件
		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
	}
	
}
