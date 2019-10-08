<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="saveAppointmentModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">预约界面</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="usernameInput" class="col-sm-2 control-label">userName</label>
                        <div class="col-sm-10">
                            <input type="text"  name="username" class="form-control" id="usernameInput" placeholder="your_username">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="department_name"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="date_input" class="col-sm-2 control-label">Date</label>
                        <div class="col-sm-10">
                            <input type="text" name="date" class="form-control" id="date_input" placeholder="date">
                            <span class="help-block"></span>
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="saveAppointmentModel_btn" class="btn btn-primary">预约</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>预约信息</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <a href="isLogin_in?username=${cookie.username.value}">
                <button class="btn btn-primary" >
                    <span class="glyphicon glyphicon-align-left" aria-hidden="true">返回主界面</span>
                </button>
            </a>
        </div>
    </div>
    <!--表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="appointment_table">
                <thead>
                <tr>
                    <th>username</th>
                    <th>department_name</th>
                    <th>date</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!--分页信息栏-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>
<div style="text-align: right">
<button type="button" id="saveAppointmentModel_btn_static"class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    预约
</button>
<button class="btn btn-primary btn-lg" id="delete_Appointment">
    <span aria-hidden="true">取消预约</span>
</button>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;
    //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
    $(function(){
        //去首页
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/getAppointment",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //console.log(result);
                //1、解析并显示员工数据
                build_Appointment_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }
    $(function () {
        $.ajax({
            url:"${APP_PATH}/Appointment",
            data:"pn=1",
            type:"POST",
            success:function (result) {
                build_Appointment_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        })
    })
    function build_Appointment_table(result) {
        $("#appointment_table tbody").empty();
        //console.log(result.extend.pageInfo.list);
        var appointments = result.extend.pageInfo.list;
        $.each(appointments,function (index,item) {
            var username = $("<td></td>").append(item.username);
            var department_name =$("<td></td>").append(item.department_name);
            var date =$("<td></td>").append(item.date);
            $("<tr></tr>")
                .append(username)
                .append(department_name)
                .append(date)
                .appendTo("#appointment_table tbody");
        });
    }
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }
        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    $("#saveAppointmentModel_btn_static").click(function () {
        getDepts("#saveAppointmentModel select");
        $("#saveAppointmentModel").modal({
            backdrop:"static"
        })
    });
    function getDepts(ele){
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/getDepartment",
            type:"GET",
            success:function(result){
                $.each(result.extend.depts,function(){
                    var optionEle = $("<option></option>").append(this.department_name);
                    optionEle.appendTo(ele);
                });
            }
        });

    }
    $("#usernameInput").change(function () {
       var username = this.value;
       $.ajax({
           url:"${APP_PATH}/checkUser",
           data:"username="+username,
           type:"POST",
           success:function (result) {
               if(result.code == 100){
                    show_validate_msg("#usernameInput","success","用户名可用");
               }else{
                    show_validate_msg("#usernameInput","error","用户已预约");
               }
           }
       });
    });
    $("#delete_Appointment").click(function () {
        $.ajax({
            url:"${APP_PATH}/deleteAppointment?username=${cookie.username.value}",
            type:"GET",
            success:function (result) {
                if(result.code == 100){
                    alert("取消预约成功");
                }else{
                    alert("此用户未预约");
                }
            }
        });
    });
    function show_validate_msg(ele,status,msg){
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    function validate_add_form(){
        var username = $("#usernameInput").val();
        var regDate = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/;
        var date = $("#date_input").val();
        if(!regDate.test(date)){
            //alert("时间格式不正确,正确格式为: 2014-01-01 12:00:00");
            show_validate_msg("#date_input","error","时间格式不正确,正确格式为: 2014-01-01 12:00:00");
            return false;
        }else {
            show_validate_msg("#date_input","success","");
        };
        return true;
    }
    $("#saveAppointmentModel_btn").click(function () {
        if(!validate_add_form()){
            return false;
        };
        $.ajax({
            url:"${APP_PATH}/saveAppointment",
            type:"POST",
            data:$("#saveAppointmentModel form").serialize(),
            success:function(result){
                alert(result.msg);
                $("#saveAppointmentModel").modal('hide');
                location.reload()
            }
        });
    });
</script>
</body>
</html>
