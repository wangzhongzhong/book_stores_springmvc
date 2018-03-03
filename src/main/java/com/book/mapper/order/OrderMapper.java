/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.mapper.order;


import com.book.entity.order.Order;
import com.book.entity.user.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author 王忠忠
 * @著作时间 2017年12月27日 下午10:25:54
 * 本类OrderMapper.java是描述:处理订单的的mapper文件
 */
public interface OrderMapper {
	
	/********
	 * 保存一个订单
	 * @param order
	 */
	void addOrder(Order order);
	
	/********
	 * 通过一个指定的主键id，来查询出该订单
	 * @param id
	 * @return
	 */
	Order selectById(Integer id);
	
	/******
	 * 删除一个订单
	 * @param order
	 */
	void deleteOrder(Order order);
	
	/********
	 * 分页查询订单
	 * @param user:我们通过id来查找一下该用户的所有的订单
	 * @param pageNow：当前页
	 * @param pageSize：每页显示的数据
	 * @return
	 */
	List<Order> selectByPage(@Param("user") User user, @Param("pageNow") Integer pageNow, @Param("pageSize") Integer pageSize);
	
	/*******
	 * 查询出指定用户的订单个数
	 * @param user
	 * @return
	 */
	Integer selectCount(@Param("use") User user);
	
	/****
	 * 根据指定的订单号来进行查询出该订单
	 * @param orderNo
	 * @return
	 */
	Order searchOrderByOrderNo(String orderNo);
	
	/*****
	 * 根据指定的用户去查询该用户的所有的订单信息
	 * @param user
	 * @return
	 */
	List<Order> searchOrderByUser(User user);
	
	/*****
	 * 查询出指定用户的，并且订单日期在该范围之间的订单信息
	 * @param user
	 * @param minDate
	 * @param maxDate
	 * @return
	 */
	List<Order> searchOrderByDate(@Param("user") User user, @Param("minDate") String minDate, @Param("maxDate") String maxDate
            , @Param("pageNow") Integer pageNow, @Param("pageSize") Integer pageSize);
	
	Integer searchOrderCountByDate(@Param("user") User user, @Param("minDate") String minDate, @Param("maxDate") String maxDate);
	
	/******
	 * 通过省市区来查询出该地区的订单信息
	 * @param province
	 * @param city
	 * @param area
	 * @return
	 */
	List<Order> searchByAddress(@Param("province") String province,
                                @Param("city") String city,
                                @Param("area") String area,
                                @Param("pageNow") Integer pageNow,
                                @Param("pageSize") Integer pageSize);
	
	/***
	 * 通过省市区查询订单的个数
	 * @param province
	 * @param city
	 * @param area
	 * @return
	 */
	Integer searchByAddressCount(@Param("province") String province,
                                 @Param("city") String city,
                                 @Param("area") String area);
	
}
