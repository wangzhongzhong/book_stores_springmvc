package com.book.controller.address;

import com.book.entity.user.Address;
import com.book.entity.user.User;
import com.book.service.user.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * author:wangzhongzhong
 * time:  2018/2/9
 * 这个类是为了处理我们的收货地址
 */
@Controller
public class AddressController {

    @Autowired
    private AddressService addressService;

    /****
     * 这个是保存一个新的收货地址
     * @param address
     * @param session
     * @return
     */
    @RequestMapping("/insertAddress")
    public String saveAddress(Address address, HttpSession session){

        if(address.getIsDefault().equals("f")){
            address.setIsDefault("1");
        }else{
            address.setIsDefault("0");
        }

        User user = (User) session.getAttribute("loginUser");

        address.setUser(user);

        //然后保存进数据库中
        addressService.addAddress(address);

        return "redirect:getCartToOrderView";
    }

}
