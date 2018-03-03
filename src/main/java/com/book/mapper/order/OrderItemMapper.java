/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.mapper.order;


import com.book.entity.order.Order;
import com.book.entity.order.OrderItem;

import java.util.List;

/**
 * @author 王忠忠
 * @著作时间 2017年12月28日 下午11:15:22
 * 本类OrderItem.java是描述:是处理订单明细的一个mapper接口
 */
public interface OrderItemMapper {
	
	/********
	 * 添加一个订单的明细
	 * @param orderItem
	 */
	void addOrderItem(OrderItem orderItem);
	
	/*******
	 * 删除一个订单的明细
	 * @param orderItem
	 */
	void deleteOrderItem(OrderItem orderItem);
	
	/*******
	 * 查询出指定订单id的订单明细
	 * @param order
	 * @return
	 */
	List<OrderItem> selectAllOrderItem(Order order);
	
	

}
