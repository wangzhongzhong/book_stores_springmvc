package com.book.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/****
 * 这个是我们实现了异常的处理接口，进行处理接受我们的异常
 */
public class MyExceptionResovler implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        //创建我们自己的异常类
        MyException myException = null;

        //进行判断一下该异常的类型是否是系统的异常
        if(ex instanceof MyException){
            //如果是的话，就进行强制转换一下
            myException = (MyException) ex;
        }else{
            //否则的话就进行创建我们自己的自定义异常
            myException = new MyException("悟空你又调皮了");
        }

//        System.out.println(ex.getMessage());

        ModelAndView modelAndView = new ModelAndView();
        //把异常信息放在页面上
        modelAndView.addObject("message",myException.getMessage());

        //返回一个error页面
        modelAndView.setViewName("error");

        return modelAndView;
    }
}
