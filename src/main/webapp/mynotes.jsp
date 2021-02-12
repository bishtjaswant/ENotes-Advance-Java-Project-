<%@page import="com.notes.NoteDetail"%>
<%@page import="com.DAO.UserNoteDAO"%>
<%@page import="com.DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>


<%@ include file="layouts/header.jsp"%>


<%@ include file="components/navbaar.jsp"%>

<%
User currentUserDetail = (User) session.getAttribute("userdetails");

if(currentUserDetail==null){
	response.sendRedirect("login.jsp");
	return ;
}
%>


<div class="container">

	<div class='card shadow-lg'>
	
	       <h2  class="card-title text-center text-capitalize py-2"> my notes </h2>
	       
	       
	       <%
	
	  String msg = (String) session.getAttribute("note-msg");
	    if(msg != null ){
	    %>
	    	
 <div class="alert-info fs-4 alert-dismissible fade show" role="alert">
  <strong >Info!</strong> <%= msg %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	    	 	<%
	       }
 
	   session.removeAttribute("note-msg");
	%>
	       
	       
	       
	       
	       
	       <%
	       
			UserNoteDAO noteDAO = new UserNoteDAO();

	       if(noteDAO.countUserNote(currentUserDetail.getId())  > 0     ){
	    	   %>
	    	   
	    	   	       
	       
	       
	       
		<table class="table">
			<thead>
				<tr class="fs-2">
					<th scope="col">#</th>
					<th scope="col">Title</th>
					<th scope="col">Content</th>
					<th scope="col">Author</th>
					<th scope="col">Added</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>


				<%

				for (NoteDetail noteDetail :  noteDAO.getNotesOfLoggedInUser(   currentUserDetail.getId()  )  ) {

					%>


				<tr class="fs-4">
					<th scope="row"> <img alt="my note" src="img/note.png" style="width: 55px;height: 55px;" class="img-fluid"> </th>
					<td><%=noteDetail.getTitle()%></td>
					<td><%=noteDetail.getContent()%></td>
					<td>You</td>
					<td><%=noteDetail.getDate().substring(0, 11)%></td>
					<td><a
						style="background-color: red; text-transform: capitalize;"
						class=" btn 	 btn-outline-danger" href="DeleteNoteServlet?deleteID=<%= noteDetail.getNoteId() %>">delete it</a></td>
			      	</tr>

 
				
					<%
				}
				%>



			</tbody>
		</table>
	    	   
	    	   <%
	       }else{
	    	   
	    	   %>
	    	   
	    	   
	    	   
	    	   
	    	   <div class="d-flex justify-content-center align-items-center" style="height: 400px;">
	    	   
                        <p class="fs-3">	    	    You don't have any note yet. </p>
                        <br/>	
                        <a href="addnote.jsp"  class="btn btn-primary btn-lg ">make new note</a>    	    
	    	     </div>
	    	   
	    	   
	    	   
	    	   <%
	       }
	       %>

	</div>


</div>


<%@ include file="layouts/footer.jsp"%>