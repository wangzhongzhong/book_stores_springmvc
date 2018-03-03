/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.entity.order;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import com.book.entity.user.Address;
import com.book.entity.user.User;

/**
 * @author 王忠忠
 * @著作时间 2017年12月17日 下午8:48:35
 * 本类Order.java是描述
 */
public class Order implements Serializable {

	private static final long serialVersionUID = -333220608870542393L;

	private Integer id;
	private Date createDate;//订单创建时间
	private String orderNo;//订单号
	private Double total;//总费用
	private OrderStatus orderStatus;//订单状态
//	private String addr;//收货地址，省市区
	private Integer logo;//订单的删除标志，【0，删除;1，存在】
	private Address address;//订单的收货地址
	private User user;//每个订单对应着一个用户
	private Set<OrderItem> items;//订单明细
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * @return the orderNo
	 */
	public String getOrderNo() {
		return orderNo;
	}
	/**
	 * @param orderNo the orderNo to set
	 */
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	/**
	 * @return the total
	 */
	public Double getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(Double total) {
		this.total = total;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((orderNo == null) ? 0 : orderNo.hashCode());
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (orderNo == null) {
			if (other.orderNo != null)
				return false;
		} else if (!orderNo.equals(other.orderNo))
			return false;
		return true;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Order [id=");
		builder.append(id);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", orderNo=");
		builder.append(orderNo);
		builder.append(", total=");
		builder.append(total);
		builder.append(", orderStatus=");
		builder.append(orderStatus);
		builder.append("]");
		return builder.toString();
	}
	/**
	 * @param createDate
	 * @param orderNo
	 * @param total
	 * @param orderStatus
	 * @param provice
	 * @param city
	 * @param area
	 * @param detail
	 */
	public Order(Date createDate, Double total, OrderStatus orderStatus, String provice, String city,
			String area, String detail) {
		this.createDate = createDate;
		//要处理一下我们的订单号，我们的订单
		Long time = new Date().getTime();
		String times = time+"";
		SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
		String simples = simple.format(new Date());
		this.orderNo = "H"+times.substring(times.length()-5, times.length())+simples;
		this.total = total;
		this.orderStatus = orderStatus;
	}
	/**
	 * 
	 */
	public Order() {
	}
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Set<OrderItem> getItems() {
		return items;
	}
	public void setItems(Set<OrderItem> items) {
		this.items = items;
	}
	public Integer getLogo() {
		return logo;
	}
	public void setLogo(Integer logo) {
		this.logo = logo;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
}
