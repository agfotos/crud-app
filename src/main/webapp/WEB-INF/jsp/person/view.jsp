<%-- 
    Document   : create
    Created on : Apr 22, 2011, 3:24:13 PM
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
        <title>View Person</title>
        
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
        <h4>View Person</h4>
        <div class="row">
        	<div class="col-sm-4">
        		<span class="col-sm-4">First Name:</span><span class="col-sm-2">  ${person.firstName}</span> <br/>
				<span class="col-sm-4">Last Name: </span><span class="col-sm-2">  ${person.lastName}</span> <br/>
				<span class="col-sm-4">Email Address: </span><span class="col-sm-4">  ${person.emailAddress}</span> <br/>
				<span class="col-sm-4">Street Address: </span><span class="col-sm-4">  ${person.streetAddress}</span> <br/>
				<span class="col-sm-4">City: </span><span class="col-sm-2">  ${person.city}</span> <br/>
				<span class="col-sm-4">State: </span><span class="col-sm-2">  ${person.state}</span> <br/>
				<span class="col-sm-4">Zip Code: </span><span class="col-sm-2">  ${person.zipCode}</span> <br/>
				<span class="col-sm-4">Client: </span><span class="col-sm-2">
				 <c:if test="${not empty currentClient}">
					${currentClient.companyName }
				 </c:if> 
        	</div>
        	<div class="col-sm-4">

        	</div>
        	
        </div>
        	
	 <a href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit Person</a>
	  <a href="${pageContext.request.contextPath}/person/list">Back</a>
    </body>
</html>
