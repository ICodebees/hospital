<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<div class="page-header">
    <h1>你好${cookie.username.value}</h1>
</div>
<br/>
<ul class="nav nav-pills">
    <li role="presentation"><a href="personal?username=${cookie.username.value}">个人信息中心</a></li>
    <li role="presentation"><a href="Appointment">预约</a></li>
    <li role="presentation"><a href="queryOperative">手术种类查询</a></li>
    <li role="presentation"><a href="queryMedicine">药物查询</a></li>
    <li role="presentation"><a href="queryDoctor">医生信息查询</a></li>
</ul>
</body>
</html>
