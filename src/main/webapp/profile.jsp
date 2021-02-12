

<%@page import="com.User.User"%>

<%
User profileUser = (User) session.getAttribute("userdetails");

 

%>

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">My profile</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="table-responsive">
					<table class="table table-bordered ">
						<thead>
							<tr>
								<th scope="col" class="fs-2">Email</th>
								<th scope="col" class="fs-2">Username</th>
								<th scope="col" class="fs-2">User ID</th>
							</tr>
						</thead>
						<tbody>


							<%
							if (profileUser != null) {
							%>

							<tr>
								<th scope="row" class='fs-5'><%=profileUser.getEmail()%>
								</th>
								<th scope="row" class='fs-5'><%=profileUser.getUsername()%>
								</th>
								<th scope="row" class='fs-5'><%=profileUser.getId()%>
								</th>

							</tr>

							<%
							}
							%>


						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary "
					data-bs-dismiss="modal">It's ok</button>
				<!--         <button type="button" class="btn btn-primary">Save changes</button>  -->
			</div>
		</div>
	</div>
</div>