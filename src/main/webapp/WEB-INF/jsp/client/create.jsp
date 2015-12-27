<%@ include file="../header.jsp" %>
 <script type="text/javascript">
      $(function() {  // <-- ensure form's HTML is ready

    	  jQuery.validator.addMethod("slackUrl", function(value, element) {
    		
    				if(value.substr(0,7) != 'http://'){
    					value = 'http://' + value;
    				}
    				if(value.substr(value.length-1, 1) != '/'){
    					value = value + '/';
    				}
    				return this.optional(element) || /^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i.test(value); 
    			}, "Not valid url.");
    	  
  $("#clientForm").validate({  // <-- initialize plugin on the form.
    // your rules and other options,
    rules: {
      companyName: { 
        required: true,
        minlength: 1,
        maxlength: 50
      },
      website: {
        required: true,
        slackUrl: true,
        minlength: 1,
        maxlength: 50
      },
      phone: {
        required: true,
        minlength: 10,
        maxlength: 12,
        phoneUS: true
  	
      },
      pStreetAddress: {
    	  required: true,
          minlength: 1,
          maxlength: 50
      },
      pCity: {
    	  required: true,
          minlength: 1,
          maxlength: 50
      },
      pState: {
    	  required: true,
          minlength: 2,
          maxlength: 2
      },
      pZipCode: {
    	  required: true,
    	  minlength: 5,
    	  maxlength: 5,
    	  digits: true
      },
      mStreetAddress: {
    	  required: true,
          minlength: 1,
          maxlength: 50
      },
      mCity: {
    	  required: true,
          minlength: 1,
          maxlength: 50
      },
      mState: {
    	  required: true,
          minlength: 2,
          maxlength: 2
      },
      mZipCode: {
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
        <h3>Create Client</h3>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>
        <form id="clientForm" action="${pageContext.request.contextPath}/client/create" method="POST" class="form-horizontal" role="form">
            <div class="form-group">
            	<label class="control-label col-sm-2" for="companyName">Company Name:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="companyName" value="${client.companyName}" />
            	</div>
            </div>

            <div class="form-group">
            	<label class="control-label col-sm-2" for="website">Website URL:</label>
            	<div class="col-sm-3">
            		<input class="form-control" type="text" name="website" value="${client.website}" />
            	</div>
            </div>

	         <div class="form-group">
            	<label class="control-label col-sm-2" for="phone">Phone Number:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="phone" value="${client.phone}" />
            	</div>
            </div>
   
             <div class="form-group">
            	<label class="control-label col-sm-2">Physical Address:</label>
            </div>
          	<div class="form-group">
            	<label class="control-label col-sm-2" for="pStreetAddress">Street:</label>
            	<div class="col-sm-3">
            		<input class="form-control" type="text" name="pStreetAddress" value="${client.pStreetAddress}" />
            	</div>
            </div>
          	<div class="form-group">
            	<label class="control-label col-sm-2" for="pCity">City:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="pCity" value="${client.pCity}" />
            	</div>
            	<label class="control-label col-sm-1" for="pState">State:</label>
            	<div class="col-sm-1">
            		<input class="form-control" type="text" name="pState" value="${client.pState}" />
            	</div>
            	<label class="control-label col-sm-1" for="pZipCode">Zip Code:</label>
            	<div class="col-sm-1">
            		<input class="form-control" type="text" name="pZipCode" value="${client.pZipCode}" />
            	</div>
            </div>

   			<div class="form-group">
            	<label class="control-label col-sm-2">Mailing Address:</label>
            </div>
            <br/>
            <div class="form-group">
            	<label class="control-label col-sm-2" for="mStreetAddress">Street:</label>
            	<div class="col-sm-3">
            		<input class="form-control" type="text" name="mStreetAddress" value="${client.mStreetAddress}" />
            	</div>
            </div>
               <div class="form-group">
            	<label class="control-label col-sm-2" for="mCity">City:</label>
            	<div class="col-sm-2">
            		<input class="form-control" type="text" name="mCity" value="${client.mCity}" />
            	</div>
            	<label class="control-label col-sm-1" for="mState">State:</label>
            	<div class="col-sm-1">
            		<input class="form-control" type="text" name="mState" value="${client.mState}" />
            	</div>
            	<label class="control-label col-sm-1" for="mZipCode">Zip Code:</label>
            	<div class="col-sm-1">
            		<input class="form-control" type="text" name="mZipCode" value="${client.mZipCode}" />
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
