<%--
  Created by IntelliJ IDEA.
  User: ZLM
  Date: 2020/3/8
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>课程信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" href="css/style.css" />
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin" >
    <div class="layui-header"style="background-color: gainsboro;">
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
        <div class="layui-row">
            <div class="layui-col-lg7" style="margin-top: 10px;margin-left: 20px;">
                <a href="${pageContext.request.contextPath}/addCourse.jsp?currentPage=1&rows=3" class="layui-btn">添加课程</a>
            </div>
            <form action="${pageContext.request.contextPath}/findCourseServlet" method="post">
                <div  class="layui-col-lg4" style="text-align: right" >

                    <div class="layui-input-inline" style="width: 300px;margin-top: 10px;">
                        <input type="text" name="k" value="   " placeholder="手机/用户名/邮箱/昵称" class="layui-input key">
                    </div>
                    <button type="button" class="layui-btn sou" style="margin-top: 10px;">搜索</button>
                </div>
            </form>

        </div>
        <form action="${pageContext.request.contextPath}/deleteCourseServlet" method="post">
            <table class="layui-table layui-form">
                <thead>
                <tr>
                    <th>课程编号</th>
                    <th>课程名称</th>
                    <th>课程简介</th>
                    <th>开课时间</th>
                    <th>结课时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <c:forEach items="${page.list}" var="course">
                    <tbody>
                    <tr>
                        <td>${course.cno}</td>
                        <td>${course.cname}</td>
                        <td>${course.introduce}</td>
                        <td>${course.stime}</td>
                        <td>${course.etime}</td>
                        <td>
                            <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/FindCourseBycnoServlet?cno=${course.cno}&currentPage=1&rows=3">修改</a>&nbsp;&nbsp;&nbsp;
                            <a class="btn btn-default btn-sm" href="javascript:void (0)" onclick="showDeleteModal(${course.cno})">删除</a>
                        </td>
                    </tr>

                    </tbody>
                </c:forEach>
            </table>
        </form>

        <div class="page">
            <ul class="pagination">
                <c:if test="${page.currentPage <= 1}">
                <li class="disabled">
                    <span>&laquo;</span>
                    </c:if>
                    <c:if test="${page.currentPage > 1}">
                <li>
                    <a href="${pageContext.request.contextPath}/findClassServlet?currentPage=${page.currentPage - 1}&rows=3&cname=${search.cname[0]}" aria-label="Previous">
                        &laquo;
                    </a>
                    </c:if>
                </li>

                <c:forEach begin="1" end="${page.totalPage}" var="i">
                    <c:if test="${page.currentPage == i}">
                        <li class="active"><a href="javascript:void (0)">${i}</a></li>
                    </c:if>
                    <c:if test="${page.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/findClassServlet?currentPage=${i}&rows=3&cname=${search.cname[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${page.currentPage >= page.totalPage}">
                <li class="disabled">
                    <span>&raquo;</span>
                    </c:if>
                    <c:if test="${page.currentPage < page.totalPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/findClassServlet?currentPage=${page.currentPage + 1}&rows=3&cname=${search.cname[0]}" aria-label="Previous">
                        &raquo;
                    </a>
                    </c:if>
                </li>

                <span style="font-size: 20px; margin-left: 10px">共${page.totalCount}条记录，共${page.totalPage}页</span>
            </ul>
        </div>

    </div>

<!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        提示
                    </h4>
                </div>
                <input id="uid" name="uid" type="hidden" >
                <div class="modal-body">
                    <div>确定删除吗？</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="deleteUserBtn">
                        确定删除
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
<script src="./layui/layui.js"></script>
<script src="css/jquery-3.3.1.min.js"></script>
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    function showDeleteModal(obj) {
        $("#uid").val(obj);
        $("#myModal").modal({
                            backdrop : 'static',
                            keyboard : false
        });
    }
    $(function() {
// 删除模态框的确定按钮的点击事件
        $("#deleteUserBtn").click(function() {
            location.href="${pageContext.request.contextPath}/deleteClassServlet?ccid="+$("#uid").val()
        });
    });
</script>
</body>
</html>
