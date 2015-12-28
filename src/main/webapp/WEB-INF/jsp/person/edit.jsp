<%@ include file="../header.jsp" %>
 <script type="text/javascript">
      $(function() {  
    		 $.validator.addMethod("customemail", 
    				    function(value, element) {
    				        return /^([\w-\.]+@([\w-]+\.)+[\w-]{2,6})?$/.test(value);
    				    }, 
    				    "Invalid email format"
    				);
  $("#personForm").validate({ 
   
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
  		customemail: true
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
            	<label class="control-label col-sm-2" for="lastName">Last Name:</label>
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
						<c:choose>
							<c:when test="${person.clientId ne null}">
								<option value="">Remove Client</option>
							</c:when>
							<c:otherwise>
								<option value="">Select Client</option>
							</c:otherwise>
						</c:choose>
					
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
