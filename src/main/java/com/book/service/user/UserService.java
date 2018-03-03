/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.user;

import com.book.entity.PageBean;
import com.book.entity.user.User;

/**
 * @author 王忠忠
 * @著作时间 2017年12月27日 下午11:36:01
 * 本类IUserService.java是描述:是处理用户的一个业务接口
 */
public interface UserService {

	/********
	 * 用户的登陆功能的实现，通过用户名去查找是否含有这个用户，然后再跟密码进行比对
	 * @param username
	 * @return
	 */
	User login(String username);
	
	/********
	 * 注册功能
	 * @param user
	 */
	void register(User user);
	
	/*******
	 * 验证是否含有该用户
	 * @param username:标志
	 * @return
	 */
	boolean validate(String username);
	
	/*******
	 * 根据一个指定的id来查询一个用户
	 * @param id
	 * @return
	 */
	User selectUserById(Integer id);
	
	/********
	 * 更新一个用户的信息
	 * @param user
	 */
	void updateUser(User user);
	
	/*********
	 * 分页查询出所有的用户
	 * @param pageNow：当前页
	 * @param pageSize：每页显示的数据
	 * @param username：我们要查询的条件
	 * @return
	 */
	PageBean<User> selectByPage(Integer pageNow,String username,User user);
	
	/******
	 * 删除一个用户
	 * @param user_id
	 */
	void deleteUser(Integer user_id);
	
	
	
}
