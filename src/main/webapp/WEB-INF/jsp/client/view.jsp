<%-- 
    Document   : edit
    Created on : Apr 22, 2011, 3:04:46 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Client</title>
                         <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </head>
    <body>
        <h3>View Client</h3>
        <div class="row">
			<div class="col-sm-6">
				<span class="col-sm-4">Company Name:</span><span class="col-sm-4">  ${client.companyName}</span> <br/>
		       	<span class="col-sm-4">Website: </span><span class="col-sm-4">  ${client.website}</span> <br/>
            	<span class="col-sm-4">Phone Number: </span><span class="col-sm-4">  ${client.phone}</span> <br/>
				<span class="col-sm-4">Physical Address: </span><span class="col-sm-6">  ${client.pStreetAddress}<br/>${client.pCity}, ${client.pState} ${client.pZipCode }</span> <br/>
				<br/>
				<span class="col-sm-4">Mailing Address: </span><span class="col-sm-6">  ${client.mStreetAddress}<br/>${client.mCity}, ${client.mState} ${client.mZipCode }</span> <br/>
          		
          		<br/>
  				<br/>
           		<a href="${pageContext.request.contextPath}/client/edit/${client.clientId}">Edit Client</a>
             	<a href="${pageContext.request.contextPath}/client/list">Client List</a>
		
			</div>
			<div class="col-sm-4">
				<h6>Contacts:</h6>
				    <c:if test="${fn:length(client.contacts) eq 0}">
            			<p>Client has no Contacts</p>
        			</c:if>
				
			    <ul class="list-group">
          			<c:forEach items="${client.contacts}" var="contact">
                    	<li class="list-group-item">${contact.firstName} ${contact.lastName }</li>
                	</c:forEach>
        		</ul>
			</div>
		</div>


        
    </body>
</html>
