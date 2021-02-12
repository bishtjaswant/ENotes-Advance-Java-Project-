
  

<%@page import="com.User.User"%>

<%@ include file="../profile.jsp"%>


<% 
User userdetails= (User)  session.getAttribute("userdetails");
%> 
<nav class="navbar navbar-expand-lg navbar-light bg-color">
   <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">ENoteJavaWebApp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"> <i class="fa fa-home"></i> Home</a>
        </li>
     
     
      <% 
         if( userdetails != null  ){
    	  
    	  %>
        
       
        
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Notes
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
             <li class="nav-item">
          <a  class="nav-link" href="addnote.jsp">  <i class="fa fa-plus-circle"></i> Add note</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link" href="allnotes.jsp"><i class="fa fa-address-book-o"></i>  Show all notes</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="mynotes.jsp"><i class="fa fa-address-book-o"></i>  Show my notes</a>
        </li>

          </ul>
        </li>
        
        
        
        
        
        
        
        <% } %>
        
      </ul>
     
     
      <div class="d-flex">
       
      <% 
      if( userdetails != null  ){
    	  
    	  %>
    	  	 <a href='profile.jsp'  data-bs-toggle="modal" data-bs-target="#profileModal" class="btn mx-1"> <i class="fa fa-user-circle-o"></i> <%= userdetails.getUsername() %> </a>
       <a href='LogoutServlet' class="btn mx-1 "> <i class="fa fa-rocket"></i> Logout</a>
      
      	  <%
      }else {
    	
    	  
    	  %>
    	      <a href='login.jsp' class="btn mx-1"> <i class="fa fa-user-circle-o"></i> Login</a>
       <a href='register.jsp' class="btn mx-1 "> <i class="fa fa-user-plus"></i> Register</a>
     
    	  
    	  <%
      }
      
      %>
      
      
     
      </div>
    </div>
  </div>
</nav>


 



