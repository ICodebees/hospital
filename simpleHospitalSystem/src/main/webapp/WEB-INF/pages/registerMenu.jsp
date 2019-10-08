<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<div class="page-header">
    <h1>用户注册界面 <small>请使用真实姓名注册</small></h1>
</div>
<form action="Register" class="form-horizontal">
    <div class="form-group">
        <label for="username" class="col-sm-2 control-label">Username</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="username" name="username" placeholder="Username">
        </div>
    </div>
    <div class="form-group">
        <label for="password1" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="password1" name="password" placeholder="Password">
        </div>
    </div>
    <div class="form-group">
        <label for="password2" class="col-sm-2 control-label">确认Password</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="password2" placeholder="确认Password">
        </div>
    </div>
    <div class="form-group">
        <label for="age" class="col-sm-2 control-label">Age</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="age" name="age" placeholder="Age">
        </div>
    </div>
    <div class="form-group">
        <label for="sex" class="col-sm-2 control-label">Sex</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="sex" name="sex" placeholder="Sex">
        </div>
    </div>
    <div class="form-group">
        <label for="identity_card" class="col-sm-2 control-label">Identity_card</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="identity_card" name="identity_card" placeholder="identity_card">
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="col-sm-2 control-label">Address</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="address" name="address" placeholder="Address">
        </div>
    </div>
    <div style="text-align: center">
    <td colspan="2" >
        <input  class="btn btn-success" type="submit" style="width:20%" value="注册" onclick="return doCheck()" onsubmit=""  />
    </td>
    </div>
</form>
<div  style="display:none" class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" onClick="doCheck();">注册</button>
    </div>
</div>
<script>
    function doCheck() {
        var username = $("#username").val();
        var password1 = $("#password1").val();
        var password2 = $("#password2").val();
        var age = $("#age").val();
        var sex = $("#sex").val();
        var identity_card = $("#identity_card").val();
        var address = $("#address").val();

        if(username==null || username.trim()==""){
            alert("请填写用户名");
            return false;
        }

        if(password1==null || password1.trim()==""){
            alert("请输入正确的密码");
            return false;
        }
        if(password2==null || password2.trim()==""){
            alert("请输入正确的密码");
            return false;
        }
        if (password1!=password2){
            alert("两次密码输入不一样")
            return false;
        }

        if(age==null || age.trim()==""){
            alert("请输入正确的年龄");
            return false;
        }
        if(sex==null || sex.trim()==""){
            alert("请输入正确的性别");
            return false;
        }
        if(identity_card==null || identity_card.trim()==""){
            alert("请输入正确的身份证");
            return false;
        }
        if(address==null || address.trim()==""){
            alert("请输入正确的地址");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
