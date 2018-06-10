package com.cn.FuYanJuan.util;

import java.util.List;

/**
 * 分页工具类
 * @author LQ & FuYanJuan
 *
 * @param <T>
 */
public class PageUtil<T> {

	private int CurrPage;//当前页数
	private int PageSize;//每页显示的记录数
	private int totalCount;//总记录数
	private int totalPage;//总页数
	private List<T> lists;//每页显示的数据
	public PageUtil() {
		super();
	}
	public int getCurrPage() {
		return CurrPage;
	}
	public void setCurrPage(int currPage) {
		CurrPage = currPage;
	}
	public int getPageSize() {
		return PageSize;
	}
	public void setPageSize(int pageSize) {
		PageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getLists() {
		return lists;
	}
	public void setLists(List<T> lists) {
		this.lists = lists;
	}
	
}
