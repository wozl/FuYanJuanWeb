package com.cn.FuYanJuan.dao;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.cn.FuYanJuan.bean.Article;;

/**@author LQ  & FuYanJuan
 * 
 * 文章表数据访问层
 *
 */
public interface ArticleDAO {
	List<Article>selectNormal();//查询所有正常状态的文章
	List<Article>findByPage(HashMap<String, Object> map);//分页数据
	List<Article>findById(HashMap<String, Object> map);//通过id查询文章
	List<Article>findAll(HashMap<String, Object> map);//查询所有用户的文章
	List<Article>selectByAuthorId(HashMap<String, Object> map);//通过作者ID查询该作者的所有文章
	List<Article>SearchByTitle(String title);//通过文章标题查找文章(模糊搜索)
	Article selectByTitle(String title);//通过标题查询文章详细信息
	List<Article>selectBytitle(String title);
	int InsertArticle(Article article);//发布文章
	int DeleteArticle(Integer id);//删除文章
	int UpdateArticle(Article article);//更新文章
	@Select("SELECT COUNT(1) FROM article;")
	int contArticle();
}
