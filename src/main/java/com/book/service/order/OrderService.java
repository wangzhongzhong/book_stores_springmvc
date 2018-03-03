/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.order;


import com.book.entity.PageBean;
import com.book.entity.order.Order;
import com.book.entity.order.OrderItem;
import com.book.entity.user.User;

import java.util.List;
import java.util.Map;

/**
 * @author 王忠忠
 * @著作时间 2017年12月27日 下午11:35:45
 * 本类IOrderService.java是描述:处理订单的业务方法
 */
public interface OrderService {
	
	/*******
	 * 添加一个订单信息
	 */
	public void save(Map<Integer,OrderItem> orderItemMap,User user,Integer addressId);
	
	/*****
	 * 删除一个订单信息
	 * @param o
	 */
	public void delete(Order o);
	
	/******
	 * 查询一个指定id的订单的信息
	 * @param id
	 * @return
	 */
	public Order findById(Integer id);
	
	/********
	 * 分页查询出该用户的订单的信息
	 * @param user
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public PageBean<Order> queryByPage(User user, int pageNow, int pageSize);
	
	/******
	 * 查询一个订单的信息，通过一个订单号
	 * @param orderNo
	 * @return
	 */
	List<Order> searchOrderByOrderNo(String orderNo);
	
	/****
	 * 根据指定的用户来查询该用户的所有的订单
	 * @param user
	 * @return
	 */
	List<Order> searchOrderByUser(User user);
	
	/******
	 * 跟据指定日期范围，查询出改日期范围的订单信息
	 * @param user
	 * @param minDate
	 * @param maxDate
	 * @return
	 */
	PageBean<Order>  searchOrderByDate(User user, String minDate, String maxDate,
                                       Integer pageNow, Integer pageSize);
	
	/*****
	 * 根据指定的地址进行查询
	 * @param province
	 * @param city
	 * @param area
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	PageBean<Order> searchOrderByAddress(String province, String city, String area,
                                         Integer pageNow, Integer pageSize);
	
	
}
