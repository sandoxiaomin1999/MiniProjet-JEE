<%-- 
    Document   : bredCrum
    Created on : 2017/7/14, 上午 01:49:47
    Author     : OrcaR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String select = request.getParameter("select");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
    <div class="bredCrum">
        <p><a href="index.jsp"> 首頁</a>   >>   <a href="#" class="select"><%=select %> </a> </p>
    </div>
    </body>
</html>