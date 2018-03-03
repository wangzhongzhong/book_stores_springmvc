/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.entity.user.User;


/**
 * @author 王忠忠
 * @著作时间 2017年12月26日 下午9:00:29 本类UserBook.java是描述:处理user的一个接口
 */
public interface UserMapper {

	/********
	 * 添加一个新的用户
	 * 
	 * @param user
	 */
	void addUser(User user);

	/*******
	 * 根据一个指定的用户名来查询该用户,这个是以后可以做登录验证用的
	 * 
	 * @param userName：用户名
	 * @return
	 */
	User selectByUserName(String userName);

	/*********
	 * 根据指定的id进行查询出user
	 * 
	 * @param id
	 * @return
	 */
	User selectById(Integer id);

	/*********
	 * 更新用户的信息
	 * 
	 * @param user
	 */
	void updateUser(User user);

	/******
	 * 根据指定的id来删除一个用户
	 * 
	 * @param id
	 */
	void deleteUser(Integer id);

	/*********
	 * 分页进行查询用户的信息
	 * 
	 * @param pageNow
	 * @param pageSize
	 * @param name：可以为真实姓名或者用户名
	 * @return
	 */
	List<User> selectByPage(@Param("pageNow") Integer pageNow, 
			@Param("name") String name,@Param("user")User user);
	
	/********
	 * 查询出该限定条件下的总记录数
	 * @param name
	 * @return
	 */
	Integer selectByNameCount(String name);
	
	/**
	 * 删除一个指定id的用户
	 * @param user
	 */
	void deleteById(User user);
	

}
