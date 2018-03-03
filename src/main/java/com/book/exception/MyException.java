package com.book.exception;

/**
 * Created by wangzhongzhong on 2018/2/1.
 * 定义一个异常类，防止把我们的堆栈信息直接反馈到用户的页面上
 */
public class MyException extends Exception {

    private static final long serialVersionUID = 4637606855966946845L;

    private String message;

    public MyException(String message) {
        super();
        this.message = message;
    }

    public MyException() {
        super();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
