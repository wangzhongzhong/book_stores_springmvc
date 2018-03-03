package com.book.controller.cart;

import com.book.entity.book.Book;
import com.book.entity.order.OrderItem;
import com.book.service.book.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * 处理我们的购物车的功能
 * Created by wangzhongzhong on 2018/1/29.
 */
@Controller
public class CartController {

    @Autowired
    private BookService bookService;

    // 创建一个map集合用来存放我们的购物车商品
    Map<Integer, OrderItem> map = null;

    /*******
     * 为了添加一个商品到购物车中
     * @param request
     * @param id
     * @param count
     * @return
     */
    @RequestMapping("/addCart")
    public String addBookToCart(HttpServletRequest request, @RequestParam(value = "bookId") Integer id, Integer count){
        // 需要创建一个session，进行放入我们的购物车集合数据
        HttpSession session = request.getSession();
        if (session.getAttribute("map") == null) {
            // 不为空的时候，我们就创建一个信息的HashMap集合
            map = new HashMap<>();
        } else {
            map = (Map<Integer, OrderItem>) session.getAttribute("map");
        }
        // 查询这本书，把这本书的信息查询出来
        Book cartBook = bookService.selectById(id);
        if(null!=map && map.size()>0){
            // 把map集合进行转换一下
            Set<Map.Entry<Integer, OrderItem>> items = map.entrySet();
            // 定义一个计数器
            Integer counts = 0;
            // 遍历这个set集合
            for (Map.Entry<Integer, OrderItem> e : items) {
                counts++;
                // 当map里面的key跟我们要添加的图书的id相等时，我们就取出这个value，把他的count进行++
                if (e.getKey() == (cartBook.getId()) ) {
                    // 获取这个value
                    OrderItem orderItem1 = e.getValue();
                    orderItem1.setCount(orderItem1.getCount()+count);
                    // 取出value
                    e.setValue(orderItem1);
                    break;
                } else if (e.getKey() != cartBook.getId() && counts == items.size()) {

                    OrderItem orderItem = new OrderItem();
                    orderItem.setBook(cartBook);
                    orderItem.setCount(count);
                    // 否则的话说明不存在该图书的信息，那么我们就进行添加一个新的购物车商品
                    map.put(cartBook.getId(), orderItem);
                }
            }
        }else{
            // 创建一个订单明细
            OrderItem orderItem = new OrderItem();
            orderItem.setBook(cartBook);
            orderItem.setCount(count);
            map.put(cartBook.getId(), orderItem);
        }
        // 最后在把这个map集合存放在session里面
        session.setAttribute("map", map);

        return "redirect:listAllCart";
    }

    /******
     * 查询出购物车里面的所有订单明细
     * @param request
     * @return
     */
    @RequestMapping("/listAllCart")
    public String listAllCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        //创建一个List集合，用来返回到页面上
        List<OrderItem> listCart = new ArrayList<>();
        //先从session里面查询出这个map集合
        Map<Integer, OrderItem> mapList = (Map<Integer, OrderItem>) session.getAttribute("map");
        if(mapList!=null){
            //把map集合转换成set集合
            Set<Map.Entry<Integer,OrderItem>> entries = mapList.entrySet();
            //循环遍历一下
            for (Map.Entry<Integer, OrderItem> e : entries) {
                System.out.println(e.getValue().getBook());
                listCart.add(e.getValue());
            }
            request.setAttribute("listCart", listCart);
            //存放一下我们的购物车里面的商品数量
            session.setAttribute("bookCount", listCart.size());
            //存放一下我们的购物车的总价
            Double sum = 0.0;
            for (OrderItem o : listCart) {
                sum+=o.getPrice();
            }
            session.setAttribute("cartTotal", sum);
        }
        return "cart/cart";
    }

    /****
     * 这个是为了更新我们的购物车里面的某个订单明细的数量
     * @param request
     * @param response
     * @param bookId
     * @param count
     */
    @RequestMapping("/updateCart")
    public void updateCart(HttpServletRequest request, HttpServletResponse response, Integer bookId, Integer count){
        System.out.println(bookId+"----->"+count);
        HttpSession session = request.getSession();
        Double zong = 0.0;
        //然后就遍历这个map集合了
        map = (Map<Integer, OrderItem>) session.getAttribute("map");
        Set<Map.Entry<Integer,OrderItem>> entrie = map.entrySet();
        for (Map.Entry<Integer, OrderItem> e : entrie) {
            if(e.getKey()==Integer.valueOf(bookId)){
                e.getValue().setCount(Integer.valueOf(count));
            }
            zong +=e.getValue().getPrice();
        }
        session.setAttribute("map", map);
        try {
            response.getWriter().print(zong);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /****
     * 删除购物车里面的订单明细
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/deleCart")
    public void deleteCart(String id,HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();

        if(session.getAttribute("map") == null){
            try {
                response.getWriter().print("error");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            map = (Map<Integer, OrderItem>) session.getAttribute("map");
            for (String s : id.split(":")) {
                //还需要创建一个map集合，用于存放我们删除过后的集合
                map.remove(Integer.valueOf(s));
            }
            session.setAttribute("map", map);
            try {
                response.getWriter().print("success");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }






}
