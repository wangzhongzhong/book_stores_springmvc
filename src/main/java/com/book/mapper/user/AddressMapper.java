/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.mapper.user;

import java.util.List;

import com.book.entity.user.Address;

/**
 * @author 王忠忠
 * @著作时间 2017年12月27日 上午10:17:47
 * 本类AddressMapper.java是描述:这个接口是为了处理用户的地址的持久层的方法
 */
public interface AddressMapper {

	/********
	 * 添加一个新的地址
	 * @param address
	 */
	void addAddress(Address address);
	
	/******
	 * 根据一个id来删除一个地址
	 * @param id
	 */
	void deleteAddress(Address address);
	
	/********
	 * 根据一个用户的id来查询出该用户的所有的地址
	 * @param id
	 * @return
	 */
	List<Address> selectByUserId(Integer id);
	
	/********
	 * 根据指定的id来查询出一个地址
	 * @param id
	 * @return
	 */
	Address selectById(Integer id);
	
	/**********
	 * 更新一个地址的信息
	 * @param address
	 */
	void updateAddress(Address address);
	
}
