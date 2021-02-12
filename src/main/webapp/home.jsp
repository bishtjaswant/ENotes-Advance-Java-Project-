<%@page import="com.User.User"%>
<%@ include file="layouts/header.jsp"%>


<%@ include file="components/navbaar.jsp"%>



<div class="container-fluid bg-img">


	<%
	User userdetail = (User) session.getAttribute("userdetails");
	
	
	if(userdetail==null){
		response.sendRedirect("login.jsp");
		return ;
	}
	
	%>

	<div class='d-flex justify-content-center align-items-center'>
		<img alt="taking notte" style="width: 400px; height: 400px;"
			src="img/note.png">
		<div>
			 
			<span class='text-uppercase d-block fs-3'>welcome <%=userdetail.getUsername()%> to note taking app</span>
			<a href="addnote.jsp" class='btn btn-primary'>click to  start </a>
		</div>
	</div>

</div>


<%@ include file="layouts/footer.jsp"%>