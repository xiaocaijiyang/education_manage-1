<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改密码</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background-color: gainsboro;">
        <div class="layui-logo" style="background-color: #000000;">首页</div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li class="layui-nav-item layui-nav-itemed" >
                    <a href="javascript:;">学员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/studentMessageServlet?pageNum=1&rows=5">学员信息</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/addstudent.jsp">新增学员</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed" >
                    <a href="javascript:;">班级管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/findClassServlet?currentPage=1&rows=3">班级信息</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/addClass.jsp">新增班级</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed" >
                    <a href="javascript:;">教师管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/teacherMessageServlet?pageNum=1&rows=5">教师信息</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/addteacher.jsp">新增教师</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed" >
                    <a href="javascript:;">课程管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/findCourseServlet?currentPage=1&rows=3">课程信息</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/addCourse.jsp">新增课程</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">财务管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/findPasswordServlet?sno=${yuangong.sno}">修改密码</a></li>
                <li class="layui-nav-item"><a href="">退出</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>修改密码</legend>
        </fieldset>
        <form class="layui-form " action="${pageContext.request.contextPath}/updatePasswordServlet">
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-block">
                    <input type="text" name="pwd1" value="${yuangong.password}" placeholder="新密码..."
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">重复新密码</label>
                <div class="layui-input-block">
                    <input type="text" name="pwd2" value="${yuangong.password}" placeholder="重复新密码..."
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>

                </div>
            </div>
        </form>
    </div>


</div>
<script src="./layui/layui.js"></script>
<script src="css/jquery-3.3.1.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
</body>
</html>

