package com.book.controller.user;

import com.book.entity.PageBean;
import com.book.entity.user.User;
import com.book.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/****
 * 这个是我为了处理我们的用户的登录的处理
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /*****
     * 这个是用户的登录处理+记住密码的功能
     * @param user
     * @return
     */
    @RequestMapping("/userLogin")
    public String userLogin(User user, HttpSession session, String cookie, HttpServletResponse response){

        //处理一下记住密码的功能
        Cookie userCookie = null;
        Cookie pwdCookie = null;
        if(null != cookie && cookie.equals("f")){
            userCookie = new Cookie("userCookie", user.getUserName());
            pwdCookie = new Cookie("pwdCookie", user.getPassword());
        }else{
            userCookie = new Cookie("userCookie", "");
            pwdCookie = new Cookie("pwdCookie", "");
        }
        //设置一下cookie的保存的时间
        userCookie.setMaxAge(60*60*24*30);
        userCookie.setPath("/");
        pwdCookie.setMaxAge(60*60*24*30);
        pwdCookie.setPath("/");

        //还有一个记住密码
        //把这个cookie添加到响应中去
        response.addCookie(userCookie);
        response.addCookie(pwdCookie);

        //进行判断一下我们的用户名密码是否正确
        User user1 = userService.login(user.getUserName());
        if(null!=user1){
            if(user1.getPassword().equals(user.getPassword())){
                session.setAttribute("loginUser",user1);
//                System.out.print("用户正确");
                return "redirect:userLoginView";
            }else{
//                System.out.print("密码错误");
                return "redirect:listAll";
            }
        }else{
//            System.out.print("用户名不存在");
            return "redirect:listAll";
        }
    }

    /*****
     * 这个是为了处理一下我们的验证账号密码的功能
     * @return
     */
    @RequestMapping("/checkUser")
    @ResponseBody
    public String checkUser(String username,String password,HttpSession session){

        //进行判断一下我们的用户名密码是否正确
        User user1 = userService.login(username);
        System.out.println(user1);
        if(null!=user1){
            if(user1.getPassword().equals(password)){
//                System.out.print("用户正确");
                session.setAttribute("user_head_img",user1.getImg_path());
                return "2";
            }else{
//                System.out.print("密码错误");
                return "0";
            }
        }else{
//            System.out.print("用户名不存在");
            return "1";
        }

    }

    /****
     * 安全退出功能
     * @param session
     * @return
     */
    @RequestMapping("/exit")
    public String exitUserLogin(HttpSession session,Integer state){

        if(session.getAttribute("loginUser")!=null){
            session.invalidate();
        }
        if(state==0){
            return "redirect:listAll";
        }else{
            return "redirect:adminLoginView";
        }
    }

    /******
     * 这个是普通用户的注册功能
     * @param user
     * @return
     */
    @RequestMapping("/regUser")
    public String regUser(User user){

        user.setImg_path("company.jpg");

        userService.register(user);

        return "redirect:listAll";
    }

    /****
     * 这个是为了查询出指定id的用户的信息，然后返回一个修改数据的页面
     * @param user_id
     * @return
     */
    @RequestMapping("/findUserView")
    public String findUserById(Integer user_id,Model model){

        User user = userService.selectUserById(user_id);

        model.addAttribute("update_user",user);

        return "user/updateUser";

    }


    /**
     * 提交更新的方法
     * @param user
     * @param multipartFile
     * @return
     */
    @RequestMapping("/updateUserSubmit")
    public String updateUserSubmit(User user,MultipartFile multipartFile,HttpSession session){

        String newFileName = null;

        if(multipartFile.getOriginalFilename() != null &&
                multipartFile.getOriginalFilename().length() > 0 ){

            //获取一下后缀名
            String fileName = multipartFile.getOriginalFilename().substring
                    (multipartFile.getOriginalFilename().lastIndexOf("."));

            System.out.println(fileName);

            //组成一下我们的新的文件名称
            newFileName = UUID.randomUUID() + fileName;

            //上传我们的头像
            File file = new File("src/main/webapp/images/head/"+ newFileName);

            try {
                multipartFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }

            user.setImg_path(newFileName);

        }else{
            user.setImg_path(null);
        }

        session.setAttribute("user_head_img",newFileName);

        userService.updateUser(user);

        return "redirect:listAll";
    }



    //===================================下面都是管理员的功能需求========================================

    /**
     * 管理员的登陆界面
     * @return
     */
    @RequestMapping("/adminLoginView")
    public String adminLoginView(){
        return "book/admin/adminLogin";
    }

    /****
     * 检查管理员登陆的用户名是否正确
     * @param user
     * @return
     */
    @RequestMapping("/checkAdmin")
    @ResponseBody
    public String checkAdmin(User user){
        User user1 = userService.login(user.getUserName());
        if(null!=user1 && user1.getState()==1){
            if(null!=user.getPassword()){
                if(user.getPassword().equals(user1.getPassword()) && user1.getState()==1){
                    return "true";
                }
            }
            return "success";
        }else{
            return "error";
        }
    }

    /****
     * 用户名密码都正确后的提交表单
     * @return
     */
    @RequestMapping("/adminLogin")
    public String adminLogin(String userName,String password, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user1 = userService.login(userName);
        if(null!=user1 && user1.getPassword().equals(password) && user1.getState()==1){
            session.setAttribute("loginUser",user1);
            return "book/admin/book/adminListBook";
        }
        return "";
    }

    /***
     * 通过ajax来异步进行分页显示所有用户的信息
     * @param pageNow
     * @param model
     * @return
     */
    @RequestMapping("/userPage")
    public String findUserPage(@RequestParam(defaultValue = "1") Integer pageNow, Model model){
        PageBean<User> pageBean = userService.selectByPage(pageNow,"",null);
        model.addAttribute("userPageBean",pageBean);
        return "book/admin/page/UserPageData";
    }


    /******
     * 获取我们要修改的用户的详细信息
     * @param user_id
     * @param model
     * @return
     */
    @RequestMapping("getUpdateUser")
    public String getUpdateView(Integer user_id,Model model){
        User user = userService.selectUserById(user_id);
        model.addAttribute("update_user",user);
        return "book/admin/user/updateUser";
    }

    /******
     * 提交我们的更新操作
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUserSubmit(User user){
        userService.updateUser(user);
        return "book/admin/book/adminListBook";
    }

    /****
     * 删除一个指定id的用户信息
     * @param user_id
     * @return
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(Integer user_id){
        userService.deleteUser(user_id);
        return "book/admin/book/adminListBook";
    }


    /***
     * 新增一个用户的信息
     * @param user
     * @return
     */
    @RequestMapping("/saveUser")
    public String saveUser(User user){
        user.setImg_path("company.jpg");
        userService.register(user);
        return "book/admin/book/adminListBook";
    }

    /****
     * 检查我们要注册的用户名是否存在
     * @param username
     * @return
     */
    @RequestMapping("/checkReg")
    @ResponseBody
    public String checkRegUser(String username){

        User user = userService.login(username);
        if(null!=user){
            return "0";
        }else{
            return "1";
        }
    }

}
