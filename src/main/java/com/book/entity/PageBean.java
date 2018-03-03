/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.entity;

import java.io.Serializable;
import java.util.List;


/**
 * @author 王忠忠
 * @著作时间 2017年8月5日 下午9:52:23 本类PageBean.java是描述:
 */
public class PageBean<T> implements Serializable {

	private static final long serialVersionUID = 6999001874058423647L;

	private Integer pageNow;//当前是多少页
	private Integer pageSize;//每页要显示的条数
	private Integer pageCount;//总共有多少页数
	private Integer pageSum;//总共有多少条记录
	
	private List<T> pageDates;//// 这个用来保存每页的数据的集合


	/**
	 * @return the pageNow
	 */
	public Integer getPageNow() {
		return pageNow;
	}


	/**
	 * @param pageNow the pageNow to set
	 */
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}


	/**
	 * @return the pageSize
	 */
	public Integer getPageSize() {
		return pageSize;
	}


	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	/**
	 * @return the pageCount
	 */
	public Integer getPageCount() {
		return pageCount;
	}


	/**
	 * @return the pageSum
	 */
	public Integer getPageSum() {
		return pageSum;
	}


	/**
	 * @param pageSum the pageSum to set
	 */
	public void setPageSum(Integer pageSum) {
		this.pageSum = pageSum;
	}


	/**
	 * @return the pageDates
	 */
	public List<T> getPageDates() {
		return pageDates;
	}


	/**
	 * @param pageDates the pageDates to set
	 */
	public void setPageDates(List<T> pageDates) {
		this.pageDates = pageDates;
	}

	

	/**
	 * @param pageCount the pageCount to set
	 */
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}


	/**
	 * 
	 */
	public PageBean() {
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PageBean [pageNow=");
		builder.append(pageNow);
		builder.append(", pageSize=");
		builder.append(pageSize);
		builder.append(", pageCount=");
		builder.append(pageCount);
		builder.append(", pageSum=");
		builder.append(pageSum);
		builder.append("]");
		return builder.toString();
	}



}
