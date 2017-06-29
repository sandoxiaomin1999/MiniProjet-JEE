<%@page import="admin.LoginServelet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    //henry 判斷是否登入 (session是否有user值)
        if(session.getAttribute("user") != null)
        {
            //henry登入後直接跳轉到產品列表頁 
            response.sendRedirect("ProduitListe.jsp");
        }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Internet Dreams</title>
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
<!--  jquery core -->
<!--henry 引入 jquery-->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

<!-- Custom jquery scripts -->
<!--henry 引入 自訂義 custom_jquery.js-->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<!--henry 引入 pngFix框架 jquery.pngFix.js對IE6的PNG圖片處理插件-->
<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
<script type="text/javascript">
<!--henry 頁面載入完成後-->
$(document).ready(function(){
//執行pngFix()
$(document).pngFix( );
});
</script>
</head>
    
    
<body id="login-bg"> 
 
    
    
    
<!-- Start: login-holder -->
<div id="login-holder">

	<!-- start logo -->
        <div id="logo-login" >
            <a href="index.html"><img style="margin-top: -20px" src="../images/logo-big-shopping.png" width="" height="75" alt="" /></a>
	</div>
	<!-- end logo -->
	
	<div class="clear"></div>
	
	<!--  start loginbox ................................................................................. -->
        <!--henry 表單送出後給 LoginServlet處理類處理 路徑對應可參考 專案中web.xml檔-->
        <form method="GET" action="../LoginServelet">
        <div id="loginbox">
	
	<!--  start login-inner -->
	<div id="login-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Login </th>
                        <td><input name="login" type="text"  class="login-inp" /></td>
		</tr>
		<tr>
			<th>Mot de passe </th>
                        <td><input name="pass" type="password" value="************"  onfocus="this.value=''" class="login-inp" /></td>
		</tr>
		<tr>
			<th></th>
			<td valign="top"><input type="checkbox" class="checkbox-size" id="login-check" /><label for="login-check">Se rappeler de moi</label></td>
		</tr>
		<tr>
			<th></th>
                        <td><input type="submit" class="submit-login" /></td>
		</tr>
		</table>
	</div>
 	<!--  end login-inner -->
	<div class="clear"></div>
	<a href="" class="forgot-pwd">Mot de passe oubliÃ© ? </a>
 </div>
            </form>
 <!--  end loginbox -->
 
	<!--  start forgotbox ................................................................................... -->
	<div id="forgotbox">
		<div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
		<!--  start forgot-inner -->
		<div id="forgot-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Email address:</th>
			<td><input type="text" value=""   class="login-inp" /></td>
		</tr>
		<tr>
			<th> </th>
			<td><input type="button" class="submit-login"  /></td>
		</tr>
		</table>
		</div>
		<!--  end forgot-inner -->
		<div class="clear"></div>
		<a href="" class="back-login">Back to login</a>
	</div>
	<!--  end forgotbox -->

</div>
<!-- End: login-holder -->
</body>
</html>