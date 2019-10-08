<%--
  Created by IntelliJ IDEA.
  User: 71923
  Date: 2019/9/24
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <title>Title</title>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="modal fade" id="updateAddressModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">地址修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="usernameInput" class="col-sm-2 control-label">userName</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="usernameInput" placeholder="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address_input" class="col-sm-2 control-label">NewAddress</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="address_input" placeholder="address">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="update_address_model_btn" class="btn btn-primary">修改</button>
        </div>
        </div>
    </div>
</div>
<div class="modal fade" id="updatePasswordModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">密码修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="userName_input" class="col-sm-2 control-label">userName</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="userName_input" placeholder="userName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Password_input" class="col-sm-2 control-label">NewPassword</label>
                        <div class="col-sm-10">
                            <input type="text" name="password" class="form-control" id="Password_input" placeholder="Password">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="update_password_model_btn" class="btn btn-primary">修改</button>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4 col-md-offset-10">
        <a href="isLogin_in?username=${cookie.username.value}">
            <button class="btn btn-primary" >
                <span class="glyphicon glyphicon-align-left" aria-hidden="true">返回主界面</span>
            </button>
        </a>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        真实姓名
    </div>
    <div class="panel-footer">${user.username}</div>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        年龄
    </div>
    <div class="panel-footer">${user.age}</div>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        性别
    </div>
    <div class="panel-footer">${user.sex}</div>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        身份证号码
    </div>
    <div class="panel-footer">${user.identity_card}</div>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        地址
    </div>
    <div class="panel-footer">${user.address}</div>
</div><div class="panel panel-default">
    <div class="panel-body">
        密码
    </div>
    <div class="panel-footer">${user.password}</div>
</div>
<button type="button" id="update_password_model_btn_static" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#update_password">
    修改密码
</button>
<button type="button" id="update_address_model_btn_static" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#update_address">
    修改地址
</button>

<script>
    $("#update_password_model_btn_static").click(function () {
        $("#updatePasswordModel").modal({
            backdrop:"static"
        })
    });
    $("#update_address_model_btn_static").click(function () {
        $("#updateAddressModel").modal({
            backdrop:"static"
        })
    });
    $("#update_address_model_btn").click(function () {
        $.ajax({
            url:"${APP_PATH}/updateAddress",
            type:"POST",
            data:$("#updateAddressModel form").serialize(),
            success:function(result){
                $("#updateAddressModel").modal("hide")
                location.reload()
            }
        })
    });
    $("#update_password_model_btn").click(function () {
        $.ajax({
            url:"${APP_PATH}/updatePassword",
            type:"POST",
            data:$("#updatePasswordModel form").serialize(),
            success:function(result){
                $("#updatePasswordModel").modal("hide")
                location.reload()
            }
        })
    });
</script>
</body>
</html>
