/**
 * 此代码归版权人所有，抄袭者追究版权
 */
package com.book.controller.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.entity.PageBean;
import com.book.entity.book.Book;
import com.book.service.book.BookService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @ClassName: BookController
 * @Description: 处理图书的业务功能
 * @author zhongwang
 * @date 2018年1月26日 下午1:19:51
 *
 */
@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	/**
	 * 这个为了查询出我们的首页的数据信息
	 * @return
	 */
	@RequestMapping("/listAll")
	public String getAllBookList() {
		return "book/index";
	}
	
	/***
	 * 查看图书的详细信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/moreBookMes")
	public String getBookDetails(Integer id,Model model){
		
		Book book = bookService.selectById(id);
		
		model.addAttribute("book", book);
		
		return "book/details";
	}


	/*****
	 * 这个是显示出用户登录后的页面
	 * @return
	 */
	@RequestMapping("/userLoginView")
	public String  userLoginView(){
		return "book/list_book";
	}

	@RequestMapping("/findPageBean")
	public String pageBean(@RequestParam(defaultValue = "1") Integer pageNow, String obj, Model model){
		PageBean<Book> pageBean = bookService.selectByCondition(pageNow,4,obj);
		model.addAttribute("pageBean",pageBean);
		if(obj.equals("精选图书")){
			return "book/page/pageData";
		}else if(obj.equals("推荐图书")){
			return "book/page/pageData1";
		}else{
			return "book/page/pageData2";
		}
	}

	/****
	 * 为了显示出我们的登陆过后的页面图书数据
	 * @param pageNow
	 * @param model
	 * @return
	 */
	@RequestMapping("/listAllBookPageBean")
	public String listAllBookPageBean(@RequestParam(defaultValue = "1") Integer pageNow,Model model){

		PageBean<Book> pageBean = bookService.selectByCondition(pageNow,12,"");
		model.addAttribute("pageBean",pageBean);
		return "book/page/pageData3";
	}

	/*****
	 * 这个是为了通过模糊查询出图书的信息
	 * @param likeName
	 * @param model
	 * @return
	 */
	@RequestMapping("/searchBook")
	public String findByLikeName(@RequestParam(defaultValue = "12") Integer pageSize,
								 @RequestParam(defaultValue = "1") Integer pageNow,
								 String likeName,Model model){

//		System.out.print(likeName);

		PageBean<Book> bookPageBean = bookService.selectBySearchName(pageNow,pageSize,likeName);

		model.addAttribute("pageBean",bookPageBean);

		return "book/page/pageData3";
	}

	/**
	 * 显示出搜索的页面
	 * @return
	 */
	@RequestMapping("/searchBookView")
	public String findByLikeNameView(String likeName,HttpSession session){
		session.setAttribute("likeName",likeName);
		return "book/SearchBook";
	}

	//=================================下面都是管理员的功能需求==========================================

	/***
	 * 这个是管理员对于图书的分页操作
	 * @param pageNow
	 * @param model
	 * @return
	 */
	@RequestMapping("/bookPage")
	public String adminPageBook(@RequestParam(defaultValue = "1") Integer pageNow,Model model){
		PageBean<Book> pageBean = bookService.selectByCondition(pageNow,4,"");
		model.addAttribute("pageBean",pageBean);
		return "book/admin/page/BookPageData";
	}


	/*****
	 * 这个是为了把我们要修改的图书的数据查询出来，并且把这条数据放到作用域里面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/getUpdateBook/{id}")
	public String getUpdateAdminBook(@PathVariable(value = "id") Integer id, Model model){
		Book book = bookService.selectById(id);
		model.addAttribute("updateBook",book);
		return "book/admin/book/updateBook";
	}

	/****
	 * 提交我们的更新的数据信息
	 * @param book
	 * @return
	 */
	@RequestMapping("/updateBookSubmit")
	public String getUpdateAdminBookSubmit(Book book,MultipartFile multipartFile)throws  Exception{

		System.out.println(multipartFile.getOriginalFilename());

		if(multipartFile.getOriginalFilename() !=null &&
				multipartFile.getOriginalFilename().length() > 0 ){
			//把图书的图片地址赋值
			book.setImgurl(multipartFile.getOriginalFilename());
		}else{
			book.setImgurl(null);
		}


		bookService.updateBook(book);
		return "book/admin/book/adminListBook";
	}


	/****
	 * 删除一个图书的信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteBook/{id}")
	public String deleteAdminBook(@PathVariable(value = "id") Integer id){
		Book book = bookService.selectById(id);
		if(null != book){
			bookService.deleteBook(book);
		}
		return "book/admin/book/adminListBook";
	}

	/******
	 * 这个只是为了先异步上传图书的图片的功能
	 * @param multipartFile
	 * @return
	 */
	@RequestMapping("/uploadFile")
	@ResponseBody
	public String uploadBookImg(MultipartFile multipartFile){

		//创建一个流
		File file = new File("src/main/webapp/images/"+multipartFile.getOriginalFilename());

		try {
			multipartFile.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "success";
	}

}
