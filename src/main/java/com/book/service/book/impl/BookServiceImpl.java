/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.service.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.entity.PageBean;
import com.book.entity.book.Book;
import com.book.entity.book.Category;
import com.book.mapper.book.BookMapper;
import com.book.mapper.book.CategoryMapper;
import com.book.service.book.BookService;

/**
 * @author 王忠忠
 * @著作时间 2017年12月28日 下午5:11:58 本类BookServiceImpl.java是描述：是处理一个图书的业务
 */
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private CategoryMapper categoryMapper;
	/*****
	 * 分页功能，并且按照类别
	 */
	@Override
	public PageBean<Book> selectByCondition(Integer pageNow, Integer pageSize, String cate) {
		Integer pageSum = bookMapper.selectBookCount(cate);
		List<Book> list = bookMapper.selectBookPage(pageNow, pageSize, cate);
		if(cate!=null){
			Category category = categoryMapper.selectByName(cate);
			//设置一下集合的第一个的对象的图书类型为
			list.get(0).setCate(category);
		}
		PageBean<Book> pageBean = new PageBean<>();
		pageBean.setPageDates(list);
		pageBean.setPageNow(pageNow);
		pageBean.setPageSize(pageSize);
		pageBean.setPageSum(pageSum);
		pageBean.setPageCount(pageSum % pageSize == 0 ? pageSum / pageSize : pageSum / pageSize + 1);
		return pageBean;
	}

	/******
	 * 查询指定id的图书
	 */
	@Override
	public Book selectById(Integer id) {
		Book book = bookMapper.selectBookById(id);
		return book;
	}

	/******
	 * 获取所有的图书类型
	 */
	@Override
	public List<Category> getAllCategories() {
		List<Category> list = categoryMapper.selectAll();
		return list;
	}

	/********
	 * 添加一个图书
	 */
	@Override
	public void addBook(Book book) {
		bookMapper.addBook(book);
	}

	/*******
	 * 更新一个图书的信息
	 */
	@Override
	public void updateBook(Book book) {
		Book bookNew = bookMapper.selectBookById(book.getId());
		if(null!=bookNew){
			bookMapper.updateBook(book);
		}
	}

	/***********
	 * 删除一个图书
	 */
	@Override
	public void deleteBook(Book book) {
		Book bookNew = bookMapper.selectBookById(book.getId());
		if(null!=bookNew){
			bookMapper.deleteBookById(book.getId());
		}
	}

	@Override
	public PageBean<Book> selectBySearchName(Integer pageNow, Integer pageSize, String searchName) {
		List<Book> list = bookMapper.selectBySearch(pageNow, pageSize, searchName);
		Integer pageSum = bookMapper.selectBookSearchCount(searchName);
		PageBean<Book> pageBean = new PageBean<>();
		pageBean.setPageDates(list);
		pageBean.setPageNow(pageNow);
		pageBean.setPageSize(pageSize);
		pageBean.setPageSum(pageSum);
		pageBean.setPageCount(pageSum % pageSize == 0 ? pageSum / pageSize : pageSum / pageSize + 1);
		return pageBean;
	}

}
