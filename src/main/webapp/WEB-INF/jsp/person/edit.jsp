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
        <title>Edit Person</title>
                         <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
 <script type="text/javascript">
      $(function() {  // <-- ensure form's HTML is ready

  $("#personForm").validate({  // <-- initialize plugin on the form.
    // your rules and other options,
    rules: {
      firstName: { 
        required: true,
        minlength: 1,
        maxlength: 50
      },
      lastName: {
        required: true,
        minlength: 1,
        maxlength: 50
      },
      emailAddress: {
        required: true,
        minlength: 5,
        maxlength: 50,
  		email: true
      },
      streetAddress: {
    	  required: true,
          minlength: 1,
          maxlength: 50
      },
      city: {
    	  required: true,
          minlength: 1,
          maxlength: 50
      },
      state: {
    	  required: true,
          minlength: 2,
          maxlength: 2
      },
      zipCode: {
    	  required: true,
    	  minlength: 5,
    	  maxlength: 5,
    	  digits: true
      }
    }
  });

});
        </script>
    </head>
    <body>
        <h4>Edit Person</h4>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>
        <form id="personForm" action="${pageContext.request.contextPath}/person/edit" method="POST" class="form-horizontal" role="form">
            <input type="hidden" name="personId" value="${person.personId}"/>
            <br/>
            <div class="form-group">
            	<label class="control-label col-sm-2" for="firstName">First Name:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="firstName" value="${person.firstName}" />
            	</div>
            </div>
            
            <div class="form-group">
            	<label class="control-label col-sm-2" for="flastName">Last Name:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="lastName" value="${person.lastName}" />
            	</div>
            </div>
            
	        <div class="form-group">
            	<label class="control-label col-sm-2" for="emailAddress">Email Address:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="emailAddress" value="${person.emailAddress}" />
            	</div>
            </div>
            
           	<div class="form-group">
            	<label class="control-label col-sm-2" for="streetAddress">Street Address:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="streetAddress" value="${person.streetAddress}" />
            	</div>
            </div>
            
            <div class="form-group">
            	<label class="control-label col-sm-2" for="city">City:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="city" value="${person.city}" />
            	</div>
            </div>

            <div class="form-group">
            	<label class="control-label col-sm-2" for="state">State:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="state" value="${person.state}" />
            	</div>
            </div>

            <div class="form-group">
            	<label class="control-label col-sm-2" for="zipCode">Zip Code:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="zipCode" value="${person.zipCode}" />
            	</div>
            </div>
  
			<div class="form-group">
				<label class="control-label col-sm-2" for="clientId">Client:</label>
				<div class="col-sm-2">
					<select class="form-control" name="clientId" id="clientId">
						<option value="">Remove Client</option>
            	 		<c:forEach items="${clients}" var="client" >
            	 			<option value="${client.clientId }" <c:if test="${person.clientId eq client.clientId}"> SELECTED</c:if>>${client.companyName }</option>
            	 		</c:forEach>
            		 </select>
            	</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-2">
					<button type="submit" class="btn btn-default" name="command" value="Cancel" formnovalidate>Cancel</button>
					<button type="submit" class="btn btn-default" name="command" value="Submit">Submit</button>

           		</div>
           </div>
        </form>

    </body>
</html>
