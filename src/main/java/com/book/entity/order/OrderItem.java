/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.entity.order;

import java.io.Serializable;

import com.book.entity.book.Book;

/**
 * @author 王忠忠
 * @著作时间 2017年12月17日 下午8:48:57
 * 本类OrderItem.java是描述
 */
public class OrderItem implements Serializable {

	private static final long serialVersionUID = 2685861262669904889L;

	private Integer id;//订单明细id
	private Book book;//订单明细里面存放一本图书
	private Integer count;//购买的数量
	private Double price;//该订单明细的价格
	private Order order;//每个订单明细对应着一个订单
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
	 * @return the order
	 */
	public Order getOrder() {
		return order;
	}
	/**
	 * @param order the order to set
	 */
	public void setOrder(Order order) {
		this.order = order;
	}
	/**
	 * @return the book
	 */
	public Book getBook() {
		return book;
	}
	/**
	 * @param book the book to set
	 */
	public void setBook(Book book) {
		this.book = book;
	}
	/**
	 * 
	 */
	public OrderItem() {
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getPrice() {
		if(this.getBook().getPrice()!=null){
			Double p = this.count * this.getBook().getPrice();
			String pn = String.format("%.1f", p);
			return Double.valueOf(pn);
		}else{
			return price;
		}
	}

	
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((count == null) ? 0 : count.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
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
		OrderItem other = (OrderItem) obj;
		if (count == null) {
			if (other.count != null)
				return false;
		} else if (!count.equals(other.count))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		return true;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderItem [id=");
		builder.append(id);
		builder.append(", count=");
		builder.append(count);
		builder.append(", price=");
		if(this.getBook().getPrice()!=null){
			Double p = this.count * this.getBook().getPrice();
			String pn = String.format("%.1f", p);
			builder.append(pn);
		}else{
			builder.append(price);
		}
		builder.append("]");
		return builder.toString();
	}
	@SuppressWarnings("unused")
	private void setPrice(Double price) {
		this.price = price;
	}
	
	
	
}
