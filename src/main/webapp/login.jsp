<%@ include file="layouts/header.jsp"%>


<%@ include file="components/navbaar.jsp"%>



<div class="container-fluid bg-img"
	style="background: url('img/bg.jpg'); background-size: cover; height: 80vh;">


	<div style="height: 100%;"
		class=" d-flex flex-column justify-content-center  align-items-center">
		<h1 class='text-white fs-1'>
			<i class="fa fa-user-secret"></i> Login
		</h1>
	
	 
	
	<%
	
	  String loggin= (String) session.getAttribute("login-err");
	    if(loggin != null ){
	    %>
	    	
 <div class="alert-danger fs-4 alert-dismissible fade show" role="alert">
  <strong >login-err!</strong> <%= loggin %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	    	 	<%
	       }
 
	   session.removeAttribute("login-err");
	%>
	
	
	

		<form action="LoginServlet" method="post">

			<div class="card" style="width: 34rem;">
				<div class="card-body">
					<div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label fs-3">Email
									address</label> <input type="email" name='email' class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label  fs-3">Password</label>
								<input type="password" name='password' class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							
							 <button type="submit"  class="btn btn-primary">Login</button>
							
						 
					</div>
					
				</div>
			</div>
		</form>

	</div>


</div>


<%@ include file="layouts/footer.jsp"%>