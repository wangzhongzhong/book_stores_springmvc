/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.mapper.book;

import java.util.List;

import com.book.entity.book.Category;


/**
 * @author 王忠忠
 * @著作时间 2017年12月28日 下午9:44:51
 * 本类CategoryMapper.java是描述
 */
public interface CategoryMapper {
	
	/********
	 * 查询出所有的图书类型
	 * @return
	 */
	List<Category> selectAll();
	
	/****
	 * 根据指定的类型名字，进行查询出该图书的类型
	 * @param name
	 * @return
	 */
	Category selectByName(String name);
	
	/*****
	 * 通过指定的id来进行查询出图书的类型
	 * @param id
	 * @return
	 */
	Category selectById(Integer id);
	
	

}
