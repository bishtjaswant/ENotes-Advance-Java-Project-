<%@page import="com.DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ include file="layouts/header.jsp" %>


<%@ include file="components/navbaar.jsp" %>

 <%
	User currentUserDetail = (User) session.getAttribute("userdetails");

	if(currentUserDetail==null){
		response.sendRedirect("login.jsp");
		return ;
	}
	
	%>
	
	
<div class="container"  >

   
   <div  class='card my-3   p-3 shadow-lg'>
   
   	<%
	
	  String note= (String) session.getAttribute("note-add");
	    if(note != null ){
	    %>
	    	
 <div class="alert-success fs-4 alert-dismissible fade show" role="alert">
  <strong >Saved!</strong> <%= note %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	    	 	<%
	       }
 
	   session.removeAttribute("note-add");
	%>
	
	
	
	
		<%
	
	  String failed= (String) session.getAttribute("note-failed");
	    if(failed != null ){
	    %>
	    	
 <div class="alert-success fs-4 alert-dismissible fade show" role="alert">
  <strong >OOP!</strong> <%= failed %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	    	 	<%
	       }
 
	   session.removeAttribute("note-failed");
	%>
	
	
	
	
	
	
	
	
	
	
	
   <h1 class="text-uppercase">add note</h1>
      <form action="NoteServlet" method="post">
      
  <div class="mb-3">
    <label for="title" class="form-label fs-4">Note title</label>
    <input type="text" name="title" required="required" class="form-control" id="title" aria-describedby="emailHelp">
  </div>

<input type="hidden" name="userid" value="<%= currentUserDetail.getId() %>">
  <div class="mb-3">
    <label for="content" class="form-label fs-4">Note content</label>
    <input type="text" required="required"  name="content" class="form-control" id="content">
  </div>
  
  <button type="submit" class="btn btn-primary">Save note</button>

      </form>
   </div>
   
   
</div>


<%@ include file="layouts/footer.jsp" %>