/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.mapper.book;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.entity.book.Book;;

/**
 * @author 王忠忠
 * @著作时间 2017年12月26日 下午5:41:02 本类BookMapper.java是描述:这个是对图书的一些持久性的操作
 */
public interface BookMapper {
	/****
	 * 添加一个图书
	 * 
	 * @param book:一本图书
	 */
	void addBook(Book book);

	/********
	 * 模糊查询并分页
	 * 
	 * @param pageNow：当前页
	 * @param pageSize：每页显示的记录数
	 * @param type：根据条件查询，如果为空的话，就查询所有的数据
	 * @return
	 */
	public List<Book> selectBookPage(@Param("pageNow") Integer pageNow, @Param("pageSize") Integer pageSize,
			@Param("type") String type);

	
	/******
	 * 这个方法是根据我们的图书名字进行查询，并按照分页的形式进行显示
	 * @param pageNow
	 * @param pageSize
	 * @param searchName
	 * @return
	 */
	public List<Book> selectBySearch(@Param("pageNow")Integer pageNow,@Param("pageSize")Integer pageSize,
			@Param("search")String searchName);
	
	/*******
	 * 根据一个id来找到这本图书
	 * 
	 * @param id：根据指定的id来查询图书
	 * @return
	 */
	public Book selectBookById(Integer id);

	/******
	 * 统计出数据库总共有多少本书，按照指定条件去查询出所有符合条件的图书数量
	 * 
	 * @param type：条件
	 * @return
	 */
	public Integer selectBookCount(@Param("type")String type);
	
	/****
	 * 根据指定的图书的模糊查询
	 * @param searchName
	 * @return
	 */
	public Integer selectBookSearchCount(@Param("searchName")String searchName);

	/********
	 * 根据指定的id进行删除该本图书
	 * 
	 * @param id：指定的id
	 */
	void deleteBookById(Integer id);

	/********
	 * 更新一本图书的信息
	 * 
	 * @param book
	 */
	void updateBook(Book book);
}
