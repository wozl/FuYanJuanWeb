package com.cn.FuYanJuan.bean;

/**
 * 
 * @author LQ &FuYanJuan
 *照片墙管理类  与数据库字段一致
 */
public class Photo_wall {
 
	private Integer id;//照片表id
	private String FileUrl;//照片保存路径
	private String Photo_Description;//照片描述
	private String Uploader;//照片上传者
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFileUrl() {
		return FileUrl;
	}
	public void setFileUrl(String fileUrl) {
		FileUrl = fileUrl;
	}
	public String getPhoto_Description() {
		return Photo_Description;
	}
	public void setPhoto_Description(String photo_Description) {
		Photo_Description = photo_Description;
	}
	public String getUploader() {
		return Uploader;
	}
	public void setUploader(String uploader) {
		Uploader = uploader;
	}
	@Override
	public String toString() {
		return "Photo_wall [id=" + id + ", FileUrl=" + FileUrl + ", Photo_Description=" + Photo_Description
				+ ", Uploader=" + Uploader + "]";
	}
	public Photo_wall(Integer id, String fileUrl, String photo_Description, String uploader) {
		super();
		this.id = id;
		FileUrl = fileUrl;
		Photo_Description = photo_Description;
		Uploader = uploader;
	}
	public Photo_wall() {
		super();
	}
	
	
}
