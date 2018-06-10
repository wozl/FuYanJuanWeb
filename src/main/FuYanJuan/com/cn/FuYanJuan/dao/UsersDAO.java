package com.cn.FuYanJuan.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.cn.FuYanJuan.bean.Users;

/**
 * @author LQ & FuYanJuan
 *
 *用户表数据访问层
 */
public interface UsersDAO {
	
	List<Users>selectAll(HashMap<String, Object> map);//查询所有用户
	List<Users>SearchByName(String name);//通过姓名查找用户（模糊搜索）
	Users selectByName(String username);//通过姓名查找用户
	Users selectByNames(String username);//通过姓名查找用户
	Users selectById(int id);//通过Id查找用户
	Users selectLogin(String name,String pass);//登录检查
	Users checkAdmin(String name);//检查是否是 管理员
	int addUser(Users users);//添加用户
	int updateUserPwd(Users users);//更新用户密码
	int updatepass(Users users);//更新密码
	int deleteUser(Integer id);//删除用户
	@Select("SELECT COUNT(1) FROM users where isadmin='0';")
	int contUsers();//查询系统中所有的用户
	
	
	
}
