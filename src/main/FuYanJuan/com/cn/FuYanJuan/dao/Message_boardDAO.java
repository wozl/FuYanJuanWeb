package com.cn.FuYanJuan.dao;

import java.util.List;
import com.cn.FuYanJuan.bean.Message_board;;
/**
 * @author LQ
 *留言板数据访问层
 */
public interface Message_boardDAO {

	List<Message_board> AllMessage();//查询所有留言
	int AddMessage(Message_board board);//添加留言
}
