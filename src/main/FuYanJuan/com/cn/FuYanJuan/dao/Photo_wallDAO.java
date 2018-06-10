package com.cn.FuYanJuan.dao;

import java.util.List;

import com.cn.FuYanJuan.bean.Photo_wall;

public interface Photo_wallDAO {
	List<Photo_wall> allPhoto();//查询所有照片

	int addPhoto(Photo_wall photo_wall);//添加图片
}
