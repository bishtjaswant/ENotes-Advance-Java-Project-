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
				UserNoteDAO noteDAO = new UserNoteDAO();

				for (NoteDetail noteDetail : noteDAO.allNotes()) {
				%>


				<tr class="fs-4">
					<th scope="row"><img alt="my note" src="img/note.png" style="width: 55px;height: 55px;" class="img-fluid"> </th>
					<td><%=noteDetail.getTitle()%></td>
					<td><%=noteDetail.getContent()%></td>
					<td><%=noteDetail.getUsername()%></td>
					<td><%=noteDetail.getDate().substring(0, 11)%></td>

					<%
					if (currentUserDetail.getId() == noteDetail.getUserId()) {
					%>
					<td><a
						style="background-color: red; text-transform: capitalize;"
						class=" btn 	 btn-outline-danger" href="DeleteNoteServlet?deleteID=<%= noteDetail.getNoteId() %>">delete it</a></td>
				</tr>


				<%
				}
				%>

				<%
				}
				%>



			</tbody>
		</table>
	</div>


</div>


<%@ include file="layouts/footer.jsp"%>