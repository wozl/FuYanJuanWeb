package com.cn.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;

import com.cn.FuYanJuan.bean.Article;
import com.cn.FuYanJuan.services.FuYanJuanUsersServices;


public class test {
	
	@Test
	public void test() {
		//Date day= new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String createtime = df.format(new Date());
		System.out.println(createtime);
	}

	
	
}
