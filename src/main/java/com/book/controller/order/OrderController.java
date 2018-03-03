package com.book.controller.order;

import com.book.entity.PageBean;
import com.book.entity.book.Book;
import com.book.entity.order.Order;
import com.book.entity.order.OrderItem;
import com.book.entity.user.Address;
import com.book.entity.user.User;
import com.book.service.book.BookService;
import com.book.service.order.OrderService;
import com.book.service.user.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * author:wangzhongzhong
 * time:  2018/2/1
 * 处理订单的业务功能
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private BookService bookService;



    //=========================管理员的业务功能=============================

    /*****
     * 查询出所有的订单信息,只是把订单的数据全部都显示出来
     * @param model
     * @return
     */
    @RequestMapping("/orderPage")
    public String listAllOrder(@RequestParam(defaultValue = "1") Integer pageNow,@RequestParam(defaultValue = "8") Integer pageSize, Model model){

        PageBean<Order> pageBean = orderService.queryByPage(null,pageNow,pageSize);
        model.addAttribute("orderPageBean",pageBean);

        return "book/admin/page/OrderPageData";
    }


    /*******
     * 通过多条件来进行查询出客户的订单信息
     * @param province
     * @param area
     * @param city
     * @param select
     * @param pageSize
     * @param pageNow
     * @param model
     * @return
     */
    @RequestMapping("/orderPageByArea")
    public String listAllOrderByProvince(String province,String area,String city,String select,
                                         @RequestParam(defaultValue = "8") Integer pageSize,
                                         @RequestParam(defaultValue = "1") Integer pageNow,Model model){
        //这个是为了把我们的多条件进行处理一下，因为管理员可能不是按照全部的条件进行查询的
        switch (select){
            case "zero":
                province = null;
                area = null;
                city = null;
                break;
            case "one":
                area = null;
                city = null;
                break;
            case "two":
                city = null;
                break;
        }

        PageBean<Order> orderPageBean = orderService.searchOrderByAddress(province,city,area,pageNow,pageSize);

        model.addAttribute("orderPageBean",orderPageBean);
        return "book/admin/page/OrderPageData";
    }

    //============================普通用户的顶顶那操作=====================================

    /*****
     * 添加一个新的订单详情
     * @return
     */
    @RequestMapping("/saveOrder")
    public String saveOrder(HttpSession session,String address){

        System.out.println(address);

        //先查询出现在登陆的是哪一个用户
        User loginUser = (User) session.getAttribute("loginUser");

        //获取一下我们的购物车的session
        Map<Integer,OrderItem> orderItemMap = (Map<Integer, OrderItem>) session.getAttribute("map");

        Set<Map.Entry<Integer,OrderItem>> set = orderItemMap.entrySet();

        orderService.save(orderItemMap,loginUser,Integer.valueOf(address));

        //保存过后，就把我们的购物车清空
        //为了取出所有的key
        String ids = "";

        for (Map.Entry<Integer, OrderItem> en : set) {
            ids+=en.getKey()+";";
        }

        if(null!=ids&&ids.length()>0){
            //进行清空购物车
            for(String s:ids.split(";")){
                orderItemMap.remove(Integer.valueOf(s));
            }
        }

        //重定向一下我们的页面，查询出自己的所有的订单的信息
        return "redirect:myOrder";
    }

    /****
     * 这个是为了把我们的购物车里面的订单明细，转到我们的预准备的订单的页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/getCartToOrderView")
    public String getCartToOrderView(HttpSession session,Model model){

        //先获取到我们的session里面的map集合对象
        Map<Integer,OrderItem> map = (Map<Integer, OrderItem>) session.getAttribute("map");
        //进行判断一下我们的map集合是否有数据，是否为空
        if(null != map && map.size()>0){
            //然后我们就获取这个map集合里面的数据
            Set<Map.Entry<Integer,OrderItem>> set = map.entrySet();
            //把数据放在作用域里面
            model.addAttribute("set",set);
            //创建我们的总价的
            Double sum = 0.0;
            //循环一下，然后把这个数字累加一下
            for (Map.Entry<Integer, OrderItem> en : set) {
                sum += en.getValue().getPrice();
            }
            //然后把这个总价放在作用域里面
            model.addAttribute("sum",sum);
        }

        //把该用户的所有的收获地址放在作用域里面
        List<Address> list = addressService.selectAddByUser((User) session.getAttribute("loginUser"));
        model.addAttribute("listAdd",list);

        return "order/confirm_order";
    }

    /***
     * 这个方法主要就是为了中间转发一下的功能
     * @return
     */
    @RequestMapping("/myOrder")
    public String orderListView(){

        return "order/order_list";
    }

    /***
     * 查询出指定用户的所有的订单信息
     * @param session
     * @param model
     * @param pageNow:当前页
     * @param pageSize:煤业显示多少条数据
     * @param likeOrder:这个是我们的根据订单号来查询订单信息的参数
     * @return
     */
    @RequestMapping("/orderByUserPage")
    public String getAllOrderByUser(HttpSession session,Model model,
                                    @RequestParam(defaultValue = "1") Integer pageNow,
                                    @RequestParam(defaultValue = "4") Integer pageSize,
                                    String likeOrder,
                                    String startDate,
                                    String endDate){

        PageBean<Order> orderPageBean = new PageBean<>();

        //先获取到现在登陆的是哪一个用户
        User user = (User) session.getAttribute("loginUser");

        if(null != likeOrder && likeOrder.length() > 0 ){
            //按照单号查询
            List<Order> orderList = orderService.searchOrderByOrderNo(likeOrder);
            orderPageBean.setPageDates(orderList);
        }else if(null != startDate && startDate.length() > 0 && null != endDate && endDate.length() > 0 ){
            //按照日期进行查询
            orderPageBean = orderService.searchOrderByDate(user,startDate,endDate,pageNow,pageSize);
        }else{
            //普通的
            orderPageBean = orderService.queryByPage(user,pageNow,pageSize);
        }

        model.addAttribute("orderList",orderPageBean);

        return "order/page/orderPageData";
    }


    /****
     * 删除指定id的订单详情
     * @param ids
     * @return
     */
    @RequestMapping("/deleteOrder")
    public String deleteOrderById(String ids){
        if(null != ids && ids.length() > 0){
            for(String s:ids.split(";")){
                Order deleOrder = orderService.findById(Integer.valueOf(s));
                orderService.delete(deleOrder);
            }
        }
        return "redirect:myOrder";
    }

    /******
     * 立即购买的功能
     * @param bookid
     * @param bookCount
     * @return
     */
    @RequestMapping("/nowBuyBook")
    public String nowBuyBook(Integer bookid,Integer bookCount,Model model,HttpSession session){

        //先把用户查询出来，看看是哪一个用户的
        User user = (User) session.getAttribute("loginUser");

        List<Address> list = null;

        if(null != user){
            //在查询出该用户的所有的地址信息
            list = addressService.selectAddByUser(user);
        }

        Map<Integer, OrderItem> mapNow = new HashMap<>();

        if(null!=bookid && bookid > 0){
            //查询出该图书的信息
            Book book = bookService.selectById(Integer.valueOf(bookid));
            OrderItem orderItem = new OrderItem();
            orderItem.setBook(book);
            orderItem.setCount(Integer.valueOf(bookCount));

            mapNow.put(book.getId(), orderItem);
        }
        Set<Map.Entry<Integer,OrderItem>> nowSet = mapNow.entrySet();

        model.addAttribute("set", nowSet);

        Double sum = 0.0;

        for (Map.Entry<Integer, OrderItem> en : nowSet) {
            sum += en.getValue().getPrice();
        }

        model.addAttribute("sum", sum);

        //把用户的地址添加进来
        model.addAttribute("listAdd", list);

        session.setAttribute("map", mapNow);

        return "order/confirm_order";
    }


}
