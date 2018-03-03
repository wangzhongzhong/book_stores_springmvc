/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.user.impl;

import java.util.List;

import com.book.entity.user.Address;
import com.book.entity.user.User;
import com.book.mapper.user.AddressMapper;
import com.book.service.user.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author 王忠忠
 * @著作时间 2017年12月28日 下午5:52:56
 * 本类AddressServiceImpl.java是描述
 */
@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressMapper addressMapper;
	
	/*****
	 * 保存一个新的地址信息
	 */
	@Override
	public void addAddress(Address address) {
		//需要进行判断一下如果用户勾选了默认地址的话，那么我们就需要进行处理一下
		//先获取一下该用户的所有的地址集合
		List<Address> list = selectAddByUser(address.getUser());
		if(address.getIsDefault().equals("1")){
			//遍历一下这个集合
			for (Address a : list) {
				if(a.getIsDefault().equals("1")){
					a.setIsDefault("0");
					updateAddress(a);
				}
			}
		}
		addressMapper.addAddress(address);
	}

	/*****
	 * 删除一个地址
	 */
	@Override
	public void deleteAddress(Address address) {
		Address addressNew = addressMapper.selectById(address.getId());
		if(null!=addressNew){
			addressMapper.deleteAddress(address);
		}
	}

	/********
	 * 更新一个地址
	 */
	@Override
	public void updateAddress(Address address) {
		Address addressNew = addressMapper.selectById(address.getId());
		if(null!=addressNew){
			addressMapper.updateAddress(address);
		}
	}

	/**********
	 * 查询出某个用户的所有的收货地址
	 */
	@Override
	public List<Address> selectAddByUser(User user) {
		List<Address> list = addressMapper.selectByUserId(user.getId());
		return list;
	}

	/**********
	 * 根据指定id来查询出这个地址
	 */
	@Override
	public Address getAddById(Integer id) {
		Address address = addressMapper.selectById(id);
		return address;
	}

}




