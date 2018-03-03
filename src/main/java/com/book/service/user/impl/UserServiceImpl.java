/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.user.impl;

import java.util.List;

import com.book.entity.PageBean;
import com.book.entity.user.User;
import com.book.mapper.user.UserMapper;
import com.book.service.user.UserService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author 王忠忠
 * @著作时间 2017年12月28日 下午5:55:33 本类UserServiceImpl.java是描述
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	/********
	 * 用户的登陆功能,管理员跟普通用户共同登陆
	 * 
	 */
	@Override
	public User login(String username) {
		User user = userMapper.selectByUserName(username);
		return user;
	}

	/********
	 * 注册功能，首先我们需要先查询出来是否含有相同的用户名 如果用户名含有了，就不能进行注册
	 * 
	 * @param user
	 */
	@Override
	public void register(User user) {
		//默认的当用户去注册的时候，只能注册一个普通的用户
		user.setState(0);
		// 如果该用户名已经存在的话，那我们就不让用户继续注册
		if (validate(user.getUserName())) {
			return;
		} else {
			userMapper.addUser(user);
		}
	}

	/********
	 * 这个是验证我们的用户名是否存在
	 * 
	 * @param username
	 * @return
	 */
	@Override
	public boolean validate(String username) {
		User user = userMapper.selectByUserName(username);
		if (null != user) {
			return true;
		} else {
			return false;
		}
	}

	/******
	 * 通过一个id来查找一个用户
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public User selectUserById(Integer id) {
		User user = userMapper.selectById(id);
		return user;
	}

	/****
	 * 更新一个用户的信息
	 * 
	 * @param user
	 */
	@Override
	public void updateUser(User user) {
		// 先查询一下是否含有该用户
		User userNew = userMapper.selectById(user.getId());
		if (null != userNew) {
			// 然后就把这个用户传过来的user写到dao里面，因为我们在mapper里面验证了
			// 当user的属性!=空的时候，才进行修改
			userMapper.updateUser(user);
		}

	}

	/********
	 * 通过分页查询出用户的信息
	 * 
	 * @param pageNow
	 * @param username
	 * @return
	 */
	@Override
	public PageBean<User> selectByPage(Integer pageNow, String username, User user) {
		// 查询出该页的数据
		List<User> list = userMapper.selectByPage(pageNow, username,user);
		// 查询出所有的数据
		Integer countData = userMapper.selectByNameCount(username);
		countData=countData-1;
		// 创建一个pageBean来存放我们的数据
		PageBean<User> pageBeanUser = new PageBean<>();
		pageBeanUser.setPageDates(list);
		pageBeanUser.setPageNow(pageNow);
		pageBeanUser.setPageCount(countData % 5 == 0 ? countData / 5 : countData / 5 + 1);
		pageBeanUser.setPageSize(5);
		pageBeanUser.setPageSum(countData);
		return pageBeanUser;
	}
	
	@Override
	public void deleteUser(Integer user_id) {
		User user = userMapper.selectById(user_id);
		userMapper.deleteById(user);
		
	}

}
