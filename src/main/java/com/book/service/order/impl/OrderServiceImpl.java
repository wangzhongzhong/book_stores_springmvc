/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.order.impl;

import java.util.*;

import com.book.entity.PageBean;
import com.book.entity.book.Book;
import com.book.entity.order.Order;
import com.book.entity.order.OrderItem;
import com.book.entity.order.OrderStatus;
import com.book.entity.user.Address;
import com.book.entity.user.User;
import com.book.mapper.book.BookMapper;
import com.book.mapper.order.OrderItemMapper;
import com.book.mapper.order.OrderMapper;
import com.book.mapper.user.AddressMapper;
import com.book.mapper.user.UserMapper;
import com.book.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author 王忠忠
 * @著作时间 2017年12月28日 下午11:01:25 本类OrderServiceImpl.java是描述
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private OrderItemMapper orderItemMapper;

	@Autowired
	private BookMapper bookMapper;

	@Autowired
	private AddressMapper addressMapper;

	@Autowired
	private UserMapper userMapper;

	/******
	 * 添加一个订单的信息
	 *
	 */
	@Override
	public void save(Map<Integer,OrderItem> orderItemMap,User user,Integer addressId) {
		//创建一个order对象
		Order order = new Order();
		//遍历我们的订单明细的map集合
		Set<Map.Entry<Integer, OrderItem>> orderItems = orderItemMap.entrySet();
		//定义一个存放总金额的变量
		Double orderTotal = 0.0;
		//计算该订单的总金额
		for (Map.Entry<Integer,OrderItem> entry:orderItems ) {
			orderTotal+=entry.getValue().getPrice();
		}

		//查询出该订单的收货地址
		Address add = addressMapper.selectById(addressId);
		order.setAddress(add);
		order.setCreateDate(new Date());
		String no = new Date().getTime()+"";
		order.setOrderNo("HZZH"+no.substring(no.length()-6, no.length()));
		order.setOrderStatus(OrderStatus.交易成功);
		order.setTotal(orderTotal);
		order.setUser(user);

		//保存订单信息
		orderMapper.addOrder(order);

		//循环取出我们所有的订单明细，该购物车里面的所有的订单明细
		for (Map.Entry<Integer,OrderItem> entry:orderItems ) {
			//还需要把该订单明细的图书查询出来，然后绑定在一下
			Book book = bookMapper.selectBookById(entry.getKey());
			OrderItem orderItem = entry.getValue();
			//需要给这个订单明细绑定一本书
			orderItem.setBook(book);
			//然后把该订单绑定到订单明细中
			orderItem.setOrder(order);
			//然后把每个订单明细保存进去
			 orderItemMapper.addOrderItem(orderItem);
		}


	}

	/******
	 * 删除一个订单的信息
	 * 
	 * @param o
	 */
	@Override
	public void delete(Order o) {

		Order orderNew = orderMapper.selectById(o.getId());
		if (null != orderNew) {
			orderMapper.deleteOrder(orderNew);
		}

	}

	/*******
	 * 根据指定的id来查询出订单
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public Order findById(Integer id) {
		Order order = orderMapper.selectById(id);
		return order;
	}

	/*********
	 * 根据分页进行查询订单
	 * 
	 * @param user
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@Override
	public PageBean<Order> queryByPage(User user, int pageNow, int pageSize) {
		// 查询出该用户的所有订单信息
		List<Order> list = orderMapper.selectByPage(user, pageNow, pageSize);

		// 遍历这个订单集合
		for (Order o : list) {
			if (null == user) {
				User orderUser = userMapper.selectById(o.getUser().getId());
				o.setUser(orderUser);
			}
			// 绑定地址
			Address add = addressMapper.selectById(o.getAddress().getId());
			// 绑定到订单里面
			o.setAddress(add);

			Set<OrderItem> orderSet = new HashSet<>();
			// 然后根据订单来查询出该订单的订单明细
			List<OrderItem> orderItem = orderItemMapper.selectAllOrderItem(o);
			// 遍历这个订单明细
			for (OrderItem item : orderItem) {
				// 查询出该订单明细中的图书
				Book book = bookMapper.selectBookById(item.getBook().getId());
				// 查询出来后，把这个book对象添加到这个顶顶那明细对象中去
				item.setBook(book);
				// 最后把一个订单明细添加到一个集合中
				orderSet.add(item);
			}
			// 把这个订单的所有的明细添加到该订单中去
			o.setItems(orderSet);
		}
		Integer pageSum = orderMapper.selectCount(user);
		PageBean<Order> pageBean = new PageBean<>();
		pageBean.setPageDates(list);
		pageBean.setPageNow(pageNow);
		pageBean.setPageSize(pageSize);
		pageBean.setPageSum(pageSum);
		pageBean.setPageCount(pageSum % pageSize == 0 ? pageSum / pageSize : pageSum / pageSize + 1);
		return pageBean;
	}

	/*******
	 * 查询一个订单的信息，通过一个订单号
	 */
	@Override
	public List<Order> searchOrderByOrderNo(String orderNo) {
		// 查询出指定订单号的订单信息
		Order order = orderMapper.searchOrderByOrderNo(orderNo);
		if (null != order) {
			// 根据订单的id来查询出该订单的收货对象
			Address address = addressMapper.selectById(order.getId());
			// 把查询出来的收获地址详细的信息绑定到该订单中去
			order.setAddress(address);
			// 根据订单的信息来查询出该订单的订单明细
			List<OrderItem> listOrderItem = orderItemMapper.selectAllOrderItem(order);
			// 创建一个set集合
			Set<OrderItem> set = new HashSet<>();
			// 遍历整个集合，把list放在set中去
			for (OrderItem or : listOrderItem) {
				// 还需要我们查询一下指定订单明细的图书的信息
				Book book = bookMapper.selectBookById(or.getBook().getId());
				// 把新查出来的图书的信息，绑定到该订单明细上
				or.setBook(book);
				set.add(or);
			}
			// 把查询出来的订单的明细绑定到该订单中
			order.setItems(set);
		}
		// 最后创建一个list集合，是为了方面我们的jsp页面上取值，因为页面上的是集合，所以我们就创建一个集合
		List<Order> list = new ArrayList<>();
		// 最后把这个订单的对象绑定到该创建的集合中去
		list.add(order);
		return list;
	}

	@Override
	public List<Order> searchOrderByUser(User user) {
		List<Order> list = orderMapper.searchOrderByUser(user);
		return list;
	}

	@Override
	public PageBean<Order> searchOrderByDate(User user, String minTime, String maxTime, Integer pageNow,
			Integer pageSize) {
		PageBean<Order> pageBean = new PageBean<>();
		List<Order> list = orderMapper.searchOrderByDate(user, minTime, maxTime, pageNow, pageSize);
		// 遍历这个订单集合
		for (Order o : list) {
			// 根据订单的id来查询出该订单的收货对象
			Address address = addressMapper.selectById(o.getId());
			// 把查询出来的收获地址详细的信息绑定到该订单中去
			o.setAddress(address);
			Set<OrderItem> orderSet = new HashSet<>();
			// 然后根据订单来查询出该订单的订单明细
			List<OrderItem> orderItem = orderItemMapper.selectAllOrderItem(o);
			// 遍历这个订单明细
			for (OrderItem item : orderItem) {
				// 查询出该订单明细中的图书
				Book book = bookMapper.selectBookById(item.getBook().getId());
				// 查询出来后，把这个book对象添加到这个顶顶那明细对象中去
				item.setBook(book);
				// 最后把一个订单明细添加到一个集合中
				orderSet.add(item);
			}
			// 把这个订单的所有的明细添加到该订单中去
			o.setItems(orderSet);
		}

		// 查询出指定日期范围的订单个数
		Integer count = orderMapper.searchOrderCountByDate(user, minTime, maxTime);
		pageBean.setPageDates(list);
		pageBean.setPageNow(pageNow);
		pageBean.setPageSum(count);
		pageBean.setPageSize(pageSize);
		Integer orderCount = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pageBean.setPageCount(orderCount);
		return pageBean;
	}

	@Override
	public PageBean<Order> searchOrderByAddress(String province, String city, String area, Integer pageNow,
			Integer pageSize) {
		PageBean<Order> pageBean = new PageBean<>();
		List<Order> list = orderMapper.searchByAddress(province, city, area, pageNow, pageSize);
		// 遍历这个订单集合
		for (Order o : list) {
			User orderUser = userMapper.selectById(o.getUser().getId());
			o.setUser(orderUser);
			// 绑定地址
			Address add = addressMapper.selectById(o.getAddress().getId());
			// 绑定到订单里面
			o.setAddress(add);

			Set<OrderItem> orderSet = new HashSet<>();
			// 然后根据订单来查询出该订单的订单明细
			List<OrderItem> orderItem = orderItemMapper.selectAllOrderItem(o);
			// 遍历这个订单明细
			for (OrderItem item : orderItem) {
				// 查询出该订单明细中的图书
				Book book = bookMapper.selectBookById(item.getBook().getId());
				// 查询出来后，把这个book对象添加到这个顶顶那明细对象中去
				item.setBook(book);
				// 最后把一个订单明细添加到一个集合中
				orderSet.add(item);
			}
			// 把这个订单的所有的明细添加到该订单中去
			o.setItems(orderSet);
		}
		Integer count = orderMapper.searchByAddressCount(province, city, area);
		pageBean.setPageDates(list);
		pageBean.setPageNow(pageNow);
		pageBean.setPageSize(pageSize);
		pageBean.setPageSum(count);
		pageBean.setPageCount(count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
		return pageBean;
	}

}
