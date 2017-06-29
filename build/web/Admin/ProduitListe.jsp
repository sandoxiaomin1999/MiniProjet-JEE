<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Article"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.ArticleDao"%>
<% 
    //henry 判斷是否登入 否則跳轉到 login.jsp頁面
        if(session.getAttribute("user") == null)
        {
            response.sendRedirect("login.jsp");
        }
%>

<!--henry 引入 header.jsp-->
<%@include file="_header.jsp" %>

<!-- start content-outer ........................................................................................................................START -->
<div id="content-outer">
<!-- start content -->
<div id="content">

	<!--  start page-heading -->
	<div id="page-heading">
		<h1>Article</h1>
	</div>
	<!-- end page-heading -->

	<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
	<tr>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
		<th class="topleft"></th>
		<td id="tbl-border-top">&nbsp;</td>
		<th class="topright"></th>
		<th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
	</tr>
	<tr>
		<td id="tbl-border-left"></td>
		<td>
		<!--  start content-table-inner ...................................................................... START -->
		<div id="content-table-inner">
		
			<!--  start table-content  -->
			<div id="table-content">
                            
                            <!--  start message-green -->
                            <%
                                if(request.getParameter("add") != null && request.getParameter("add").equals("success"))
                                {
                            %>
				<div id="message-green">
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
                                    <td class="green-left">Mise a jour effectu� avec succes ! :D <a href="FilmAjouter.jsp">Ajouter un Film ? </a></td>
					<td class="green-right"><a class="close-green"><img src="images/table/icon_close_green.gif"   alt="" /></a></td>
				</tr>
				</table>
				</div>
                                <% } %>
				<!--  end message-green -->
                                
                                <!--  start message-Red -->
                            <%
                                if(request.getParameter("add") != null &&request.getParameter("add").equals("fail"))
                                {
                            %>
				<div id="message-red">
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
                                    <td class="red-left">Error. <a href="FilmAjouter.jsp">Veillez r�essayer !</a></td>
					<td class="red-right"><a class="close-red"><img src="images/table/icon_close_red.gif"   alt="" /></a></td>
				</tr>
				</table>
				</div>
                                <% } %>
				<!--  end message-Red -->
                                
			
				<!--  start product-table ..................................................................................... -->
				<form id="mainform" action="">
				<table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
				<tr>
                                    <th  class="table-header-check"><a id="toggle-all" ></a></th>
					<th style="width: 50px" class="table-header-repeat line-left "><a>ID</a>	</th>
                                        <th style="max-width: 100px; width: 100px"  class="table-header-repeat line-left">
                                            <a >Img</a>
                                        </th>
					<th class="table-header-repeat line-left"><a >libelle</a></th>
					<th style="width: 120px" class="table-header-repeat line-left"><a >Date ajout</a></th>
					<th style="width: 120px"  class="table-header-repeat line-left"><a >quantte</a></th>
					<th style="width: 120px"  class="table-header-repeat line-left"><a >prix</a></th>
                                        
                                        <th style="width: 90px" class="table-header-options line-left"><a >Options</a></th>
				</tr>
				
                                
                                <% 
                                    ArticleDao dao = new ArticleDao();
                                    
                                    Vector<Article> list = dao.findAll();
                                    //for(int j = 0; j< 50; j++)//Test liste longue :p 
                                    for(int i = 0; i< list.size(); i++)
                                    {
                                %>
                                
                                <tr style="font-weight: bold">
				 	<td><input type="checkbox"/></td>
                                        <td> <%= list.get(i).getIdArticle() %> </td>
                                        <td>
                                            <center>
                                                <img height="30"  src="../<%= list.get(i).getImg() %>"/>
                                            </center>
                                        </td>
                                
                                        <td><%= list.get(i).getLibelle() %></td>
                                        <td><%= list.get(i).getDateAjout()%></td>
					<td><%= list.get(i).getQte() %></td>
					<td><%= list.get(i).getPrix() %> </td>
                                        
					<td class="options-width">
                                            <a href="ArticleModifier.jsp?id=<%= list.get(i).getIdArticle() %>" title="Modifier" class="icon-1 info-tooltip"></a>
                                            <a href="../SupprimerArticleServlet?id=<%= list.get(i).getIdArticle() %>" title="Supprimer" class="icon-2 info-tooltip"></a>
					</td>
                                				
                                </tr>
                                <% }
                                    
                                    %>
                                
				</table>
				<!--  end product-table................................... --> 
				</form>
			</div>
			<!--  end content-table  -->
		
                        
			<!--  start actions-box ............................................... -->
                        <!-- ACTION BOX + PAGINATION 
                        
			<div id="actions-box">
				<a href="" class="action-slider"></a>
				<div id="actions-box-slider">
					<a href="" class="action-edit">Edit</a>
					<a href="" class="action-delete">Delete</a>
				</div>
				<div class="clear"></div>
			</div>
			<!-- end actions-box........... -->
			
			<!--  start paging..................................................... -->
                        <!-- ACTION BOX + PAGINATION 
                        
			<table border="0" cellpadding="0" cellspacing="0" id="paging-table">
			<tr>
			<td>
				<a href="" class="page-far-left"></a>
				<a href="" class="page-left"></a>
				<div id="page-info">Page <strong>1</strong> / 15</div>
				<a href="" class="page-right"></a>
				<a href="" class="page-far-right"></a>
			</td>
			<td>
			<select  class="styledselect_pages">
				<option value="">Number of rows</option>
				<option value="">1</option>
				<option value="">2</option>
				<option value="">3</option>
			</select>
			</td>
			</tr>
			</table>
			<!--  end paging................ -->
			
			<div class="clear"></div>
		 
		</div>
		<!--  end content-table-inner ............................................END  -->
		</td>
		<td id="tbl-border-right"></td>
	</tr>
	<tr>
		<th class="sized bottomleft"></th>
		<td id="tbl-border-bottom">&nbsp;</td>
		<th class="sized bottomright"></th>
	</tr>
	</table>
	<div class="clear">&nbsp;</div>

</div>
<!--  end content -->
<div class="clear">&nbsp;</div>
</div>
<!--  end content-outer........................................................END -->


<%@include file="_footer.jsp" %>
