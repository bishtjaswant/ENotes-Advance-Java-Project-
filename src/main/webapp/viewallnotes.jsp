








<!-- Modal -->
<%@page import="com.notes.NoteDetail"%>
<%@page import="com.DAO.UserNoteDAO"%>




<div class="modal fade" id="viewAllNoteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">All saved notes</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         
	<div class='card shadow-lg' style="min-height: 500px;overflow: scroll;">
		<table class="table">
			<thead>
				<tr class="fs-2">
					<th scope="col">#</th>
					<th scope="col">Title</th>
					<th scope="col">Content</th>
					<th scope="col">Author</th>
					<th scope="col">Added</th>
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
				}
				%>



			</tbody>
		</table>
	</div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close Detail</button>
      </div>
    </div>
  </div>
</div>