/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.user;

import java.util.List;

import com.book.entity.user.Address;
import com.book.entity.user.User;

/**
 * @author 王忠忠
 * @著作时间 2017年12月28日 下午5:41:24
 * 本类AddressService.java是描述
 */
public interface AddressService {
	
	/******
	 * 用户添加一个收货地址
	 * @param address
	 */
	void addAddress(Address address);
	
	/******
	 * 删除一个收货地址
	 * @param address
	 */
	void deleteAddress(Address address);
	
	/******
	 * 更新一个收货地址
	 * @param address
	 */
	void updateAddress(Address address);
	
	/*******
	 * 查询出该用户的所有的地址信息
	 * @param user
	 * @return
	 */
	List<Address> selectAddByUser(User user);
	
	/******
	 * 根据一个指定的id来查询一个地址
	 * @param id
	 * @return
	 */
	Address getAddById(Integer id);

}
