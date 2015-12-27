<%@ include file="../header.jsp" %>
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
        	
	  <a href="${pageContext.request.contextPath}/person/list">&lt;Back</a>
	  <a href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit</a>
    </body>
</html>
