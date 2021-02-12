<%@ include file="layouts/header.jsp"%>


<%@ include file="components/navbaar.jsp"%>



<div class="container-fluid bg-img"
	style="background: url('img/bg.jpg'); background-size: cover; height: 80vh;">


	<div style="height: 100%;"
		class=" d-flex flex-column justify-content-center  align-items-center">
		

		<form action="UserServlet" method="post">

			<div class="card" style="width: 34rem;">
			
			
		<h1 class='text-center fs-1'> <i class="fa fa-universal-access"></i> Registration</h1>
		
		
	
	<%
	
	  String success= (String) session.getAttribute("regis-success");
	    if(success != null ){
	    %>
	    	
 <div class="alert-success alert-dismissible fade show" role="alert">
  <strong class="fs-3 ">Success!</strong> <%= success %> <a href='login.jsp' class='alert-link'>click to login</a>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>	x
	    	 	<%
	       }
	    
	      session.removeAttribute("regis-success");
	
	
	%>
	
	
	<%
	
	  String failed= (String) session.getAttribute("regis-failed");
	    if(failed != null ){
	    %>
	    	
 <div class="alert-danger alert-dismissible fade show" role="alert">
  <strong class="fs-3">failed!</strong> <%= failed %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	    	 	<%
	       }
 
	   session.removeAttribute("regis-failed");
	%>
	
	
	

				<div class="card-body">
					<div>

						<form>
						     <div class='row'>
						        <div class="col-md-6">
						           <div  class="form-group">
						           <label class=""> First Name</label>
						           <input type="text" required name="firstname" class="form-control">
						           </div>
						         </div>
						         
						          <div class="col-md-6">
						           <div  class="form-group">
						           <label class=""> Last Name</label>
						           <input type="text" required name="lastname" class="form-control">
						           </div>
						         </div>
						         
						     </div>
						     
						     <div class="mb-3">
								<label for="username" class="form-label">Username</label> 
									<input required name="username" type="text" class="form-control"
									id="username" aria-describedby="emailHelp">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> 
									<input  name="email" required type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label  ">Password</label>
								<input type="password" required class="form-control"
								name="password"	id="exampleInputPassword1">
							</div>
		
		                 <button type="submit"  class="btn btn-primary">Register</button>
							
						</form>
					</div>
				</div>
			</div>
		</form>

	</div>


</div>


<%@ include file="layouts/footer.jsp"%>