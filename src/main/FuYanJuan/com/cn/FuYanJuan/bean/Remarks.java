package com.cn.FuYanJuan.bean;


/**@author LQ & FuYanJuan
 * 
 *操作记录属性类字段与数据库操作记录字段一致
 *
 */
public class Remarks {
	
	private Integer id;//操作记录表id
	private String Time;//操作时间
	private String Content;//操作内容
	private Integer Objects;//对谁进行的操作
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Integer getObjects() {
		return Objects;
	}
	public void setObjects(Integer objects) {
		Objects = objects;
	}
	@Override
	public String toString() {
		return "Remarks [id=" + id + ", Time=" + Time + ", Content=" + Content + ", Objects=" + Objects + "]";
	}
	public Remarks(Integer id, String time, String content, Integer objects) {
		super();
		this.id = id;
		Time = time;
		Content = content;
		Objects = objects;
	}
	public Remarks() {
		super();
	}
	
	
	
}
