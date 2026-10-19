
    
  <%@page import="com.project.model.UserModel" %>

<%
    UserModel user =(UserModel) session.getAttribute("user");

    if(user==null){
    	response.sendRedirect("login.jsp");
    	return;
    }
%>
