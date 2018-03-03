/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.entity.book;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 王忠忠
 * @著作时间 2017年12月17日 下午8:47:46
 * 本类Book.java是描述
 */
public class Book implements Serializable {

	private static final long serialVersionUID = 3431636930416393872L;

	private Integer id;
	private String bookName;//
	private String author;//
	private String imgurl;//
	private String instrduce;//图书简介
	private String moreMes;//图书的详细介绍
	private Double price;//单价
	private String publish;//出版社
	private Date publishDate;//出版日期
	//【0，代表删除;1，代表存在】
	private Integer logo;//图书的标识符，当我们要删除的时候就把这个标识符进行修改
	private Category cate;//图书类型
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
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * @return the price
	 */
	public Double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(Double price) {
		this.price = price;
	}
	/**
	 * @return the publish
	 */
	public String getPublish() {
		return publish;
	}
	/**
	 * @param publish the publish to set
	 */
	public void setPublish(String publish) {
		this.publish = publish;
	}
	/**
	 * @return the cate
	 */
	public Category getCate() {
		return cate;
	}
	/**
	 * @param cate the cate to set
	 */
	public void setCate(Category cate) {
		this.cate = cate;
	}
	/**
	 * 
	 */
	public Book() {
	}
	
	
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Book [id=");
		builder.append(id);
		builder.append(", bookName=");
		builder.append(bookName);
		builder.append(", author=");
		builder.append(author);
		builder.append(", imgurl=");
		builder.append(imgurl);
		builder.append(", instrduce=");
		builder.append(instrduce);
		builder.append(", price=");
		builder.append(price);
		builder.append(", publish=");
		builder.append(publish);
		builder.append(", publishDate=");
		builder.append(publishDate);
		builder.append("]");
		return builder.toString();
	}
	/**
	 * @param bookName
	 * @param author
	 * @param imgurl
	 * @param instrduce
	 * @param price
	 * @param publish
	 * @param publishDate
	 */
	public Book(String bookName, String author, String imgurl, String instrduce, Double price, String publish,
			Date publishDate) {
		this.bookName = bookName;
		this.author = author;
		this.imgurl = imgurl;
		this.instrduce = instrduce;
		this.price = price;
		this.publish = publish;
		this.publishDate = publishDate;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Book other = (Book) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	/**
	 * @return the bookName
	 */
	public String getBookName() {
		return bookName;
	}
	/**
	 * @param bookName the bookName to set
	 */
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getInstrduce() {
		return instrduce;
	}
	public void setInstrduce(String instrduce) {
		this.instrduce = instrduce;
	}
	public Integer getLogo() {
		return logo;
	}
	public void setLogo(Integer logo) {
		this.logo = logo;
	}
	public String getMoreMes() {
		return moreMes;
	}
	public void setMoreMes(String moreMes) {
		this.moreMes = moreMes;
	}
	
	
	
	
}
