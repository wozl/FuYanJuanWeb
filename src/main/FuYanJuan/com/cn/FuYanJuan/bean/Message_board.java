package com.cn.FuYanJuan.bean;


/**@author LQ & FuYanJuan
 * 
 * 留言板属性类 字段与数据库留言板字段一致
 *
 */
public class Message_board {
	private Integer id;//留言表id
	private String Commenter;//留言人
	private String Content;//留言内容
	private String Time;//留言时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCommenter() {
		return Commenter;
	}
	public void setCommenter(String commenter) {
		Commenter = commenter;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	@Override
	public String toString() {
		return "Message_board [id=" + id + ", Commenter=" + Commenter + ", Content=" + Content + ", Time=" + Time + "]";
	}
	public Message_board(Integer id, String commenter, String content, String time) {
		super();
		this.id = id;
		Commenter = commenter;
		Content = content;
		Time = time;
	}
	public Message_board() {
		super();
	}
	
	
	
}