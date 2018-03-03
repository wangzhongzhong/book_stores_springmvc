/**
 * Created by wangzhongzhong on 2018/1/31.
 */
$(function () {
    $("#username").blur(function () {
        $.ajax({
            url:"/book_stores_springmvc/checkAdmin",
            type:"post",
            data:"userName="+$("#username").val(),
            success:function (msg) {
                if(msg=="success"){
                    $("#name").html("* 用户名正确")
                    $("#name").removeClass("alert-danger")
                    $("#name").addClass("alert-success")
                }else{
                    $("#name").html("* 用户名不存在")
                    $("#name").addClass("alert-danger")
                    $("#name").removeClass("alert-success")
                }
            }
        })
    })
    //验证密码，通过焦点验证
    $("#password").blur(function () {
        $.ajax({
            url:"/book_stores_springmvc/checkAdmin",
            type:"post",
            data:"userName="+$("#username").val()+"&password="+$("#password").val(),
            success:function (msg) {
                if(msg=="success"){
                    //这个是我们的用户名正确
                    $("#name").html("* 用户名正确")
                    $("#name").removeClass("alert-danger")
                    $("#name").addClass("alert-success")
                    $("#pwd").html("* 密码错误")
                    $("#pwd").removeClass("alert-success")
                    $("#pwd").addClass("alert-danger")
                    $("#btn").addClass("disabled")
                }else if(msg=="error"){
                    $("#name").html("* 用户名不存在")
                    $("#name").addClass("alert-danger")
                    $("#name").removeClass("alert-success")
                    $("#btn").addClass("disabled")
                }else if(msg=="true"){
                    $("#name").html("* 用户名正确")
                    $("#name").removeClass("alert-danger")
                    $("#name").addClass("alert-success")
                    $("#pwd").html("* 密码正确")
                    $("#pwd").removeClass("alert-danger")
                    $("#pwd").addClass("alert-success")
                    //如果都正确的话，那么我们就把原来那个按钮恢复正常
                    $("#btn").removeClass("disabled")
                }
            }
        })
    })
})