/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.book;

import java.util.List;

import com.book.entity.PageBean;
import com.book.entity.book.Book;
import com.book.entity.book.Category;

/**
 * @author 王忠忠
 * @著作时间 2017年12月27日 下午11:34:36
 * 本类IBookService.java是描述
 */
public interface BookService{
	
	/*********
	 * 根据类别进行查询图书，并且进行分页
	 * @param pageNow：当前页
	 * @param pageSize：每页显示的数据
	 * @param cate：图书的类别
	 * @return
	 */
	public PageBean<Book> selectByCondition(Integer pageNow,Integer pageSize,String cate);
	
	/*****
	 * 根据指定的图书名来查询含有该字样的图书的信息
	 * @param pageNow
	 * @param pageSize
	 * @param searchName
	 * @return
	 */
	public PageBean<Book> selectBySearchName(Integer pageNow,Integer pageSize,String searchName);
	
	/*******
	 * 根据指定的id来进行查询图书
	 * @param id：图书的id
	 * @return
	 */
	public Book selectById(Integer id);
	
	/******
	 * 获取图书的所有类别
	 * @return
	 */
	List<Category> getAllCategories();
	
	/********
	 * 添加一个图书
	 * @param book
	 */
	void addBook(Book book);
	
	/*******
	 * 更新一个图书的信息
	 * @param book
	 */
	void updateBook(Book book);
	
	/********
	 * 删除一个图书的信息
	 * @param book
	 */
	void deleteBook(Book book);
	

}
