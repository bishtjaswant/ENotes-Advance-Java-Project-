<%@page import="com.DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ include file="layouts/header.jsp" %>


<%@ include file="components/navbaar.jsp" %>

<%@ include file="viewallnotes.jsp" %>

 
<div class="container-fluid bg-img" 	style="background: url('img/bg.jpg'); background-size: cover; height: 80vh;" >   


<div style="height: 100%;" class=" d-flex flex-column justify-content-center  align-items-center">
    <h1 class='text-white fs-1'> <i  class="fa fa-book"></i> Save your E- note</h1>
    <div>
    
    
    <% 
    
    User currentUserDetail = (User) session.getAttribute("userdetails");

    
    if( currentUserDetail == null ){
    	
    	%>
    
    <a href="login.jsp" class="btn btn-light text-capitalize fs-4" > <i  class="fa fa-user-o"></i> login</a>   
     <a href="register.jsp" class="btn btn-light text-capitalize fs-4" > <i  class="fa fa-user-plus"></i> register</a>
    
    	<%
    }else{
    	%>
    	
    <a href="addnote.jsp" class='btn text-capitalize '>start from here</a>	
    <a href="addnote.jsp" data-bs-toggle="modal" data-bs-target="#viewAllNoteModal" class='btn text-capitalize '>view all notes</a>	
     
    	<%
    }
    
    %>
   
     </div> 
</div> 


</div>


<%@ include file="layouts/footer.jsp" %>