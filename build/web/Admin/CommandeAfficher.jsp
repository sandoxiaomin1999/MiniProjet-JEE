<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.LigneCommande"%>
<%@page import="dao.LigneCommandeDao"%>
<%@page import="entities.Client"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.ClientDao"%>
<%@page import="dao.ArticleDao"%>
<%
    try{
    if (session.getAttribute("user") == null)
    {
        response.sendRedirect("login.jsp");
        return ;
    }
%>


<%@include file="_header.jsp" %>

<!-- start content-outer ........................................................................................................................START -->
<div id="content-outer">
    <!-- start content -->
    <div id="content">

        <!--  start page-heading -->
        <div id="page-heading">
            <h1> 詳細訊息 <%= request.getParameter("login") %></h1>
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
                                if (request.getParameter("add") != null && request.getParameter("add").equals("success"))
                                {
                            %>
                            <div id="message-green">
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="green-left">更新成功 ! :D </td>
                                        <td class="green-right"><a class="close-green"><img src="images/table/icon_close_green.gif"   alt="" /></a></td>
                                    </tr>
                                </table>
                            </div>
                            <% } %>
                            <!--  end message-green -->

                            <!--  start message-Red -->
                            <%
                                if (request.getParameter("add") != null && request.getParameter("add").equals("fail"))
                                {
                            %>
                            <div id="message-red">
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="red-left">錯誤. <a href="FilmAjouter.jsp">請再試一次 !</a></td>
                                        <td class="red-right"><a class="close-red"><img src="images/table/icon_close_red.gif"   alt="" /></a></td>
                                    </tr>
                                </table>
                            </div>
                            <% } %>
                            <!--  end message-Red -->

                            <%
                            int id = -1 ;    
                            
                            if(request.getParameter("id") != null)
                                id = Integer.parseInt(request.getParameter("id"));
                            %>
                                
                            <!--  start product-table ..................................................................................... -->
                            
                                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                    <tr>



                                        <th style="width: 120px" class="table-header-repeat line-left"><a >libelle</a></th>
                                        <th style="width: 120px"  class="table-header-repeat line-left"><a >prix unitaire</a></th>
                                        <th style="width: 120px"  class="table-header-repeat line-left"><a >nombre</a></th>

                                    </tr>


                                    <%
                            
                            try{
                               
                            
                                        LigneCommandeDao dao = new LigneCommandeDao();
                                        Vector<LigneCommande> list = dao.findById(id);
                                        //for(int j = 0; j< 50; j++)//Test liste longue :p 
                                        
                                        String etat;
                                    if(list != null)
                                        for (int i = 0; i < list.size(); i++)
                                        {
                                            String libelle = (new ArticleDao()).findByID(list.get(i).getIdArticle()).getLibelle();
                                            double prix = (new ArticleDao()).findByID(list.get(i).getIdArticle()).getPrix();
                                    %>

                                    <tr style="font-weight: bold">

                                        <td><%= libelle%></td>
                                        <td><%= prix%></td>
                                        <td><%= list.get(i).getNbr()%></td>


                                    </tr>
                                    <% }

                                     
                            }catch(Exception ex){
                                
                            }
                            
                                    %>
                                    <tr>

                                    <td colspan="3" valign="top" >
                                    
                                        <form id="mainform" method="GET"  action="../ValiderCommandeServelet">
                                        <input name="id" type="hidden" value="<%= id %>"/>
                                        <input type="submit" value="" class="form-submit" style="text-align: center" />
                                        </form>
                                        
                                        <form id="mainform" method="GET"  action="../RefuserCommandeServlet">
                                        <input name="id" type="hidden" value="<%= id%>"/>
                                        <input type="submit" value="" class="form-reset"  style="text-align: center"/>
                                        </form>
                                        
                                    </td>
                                    

                                    </tr>

                                </table>
                                <!--  end product-table................................... --> 
                            
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
<%
        
    }catch(Exception ex){ 
        
    }%>

<%@include file="_footer.jsp" %>


