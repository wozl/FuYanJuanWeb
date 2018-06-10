package com.cn.FuYanJuan.bean;



/**@author LQ & FuYanJuan
 * 
 * 文章属性类 字段与数据库文章表字段一致
 * 
 *
 */
public class Article {

	private Integer id;//文章id
	private String Title;//文章标题
	private String Issuing_Time;//发布时间
	private Integer Author;//文章作者
	private String Content;//文章内容
	private String Commentator;//评阅老师
	private String Comment;//老师评阅内容
	private Integer Status;//文章状态
	private Users users;
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getIssuing_Time() {
		return Issuing_Time;
	}
	public void setIssuing_Time(String issuing_Time) {
		Issuing_Time = issuing_Time;
	}
	public Integer getAuthor() {
		return Author;
	}
	public void setAuthor(Integer author) {
		Author = author;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getCommentator() {
		return Commentator;
	}
	public void setCommentator(String commentator) {
		Commentator = commentator;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	public Integer getStatus() {
		return Status;
	}
	public void setStatus(Integer status) {
		Status = status;
	}
	
	
	@Override
	public String toString() {
		return "Article [id=" + id + ", Title=" + Title + ", Issuing_Time=" + Issuing_Time + ", Author=" + Author
				+ ", Content=" + Content + ", Commentator=" + Commentator + ", Comment=" + Comment + ", Status="
				+ Status + ", users=" + users + "]";
	}
			
	
	public Article(Integer id, String title, String issuing_Time, Integer author, String content, String commentator,
			String comment, Integer status, Users users) {
		super();
		this.id = id;
		Title = title;
		Issuing_Time = issuing_Time;
		Author = author;
		Content = content;
		Commentator = commentator;
		Comment = comment;
		Status = status;
		this.users = users;
	}
	public Article() {
		super();
	}
	
	
	
}
