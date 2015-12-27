<%@ include file="../header.jsp" %>
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
  				<a href="${pageContext.request.contextPath}/client/list">&lt;Back</a>
           		<a href="${pageContext.request.contextPath}/client/edit/${client.clientId}">Edit </a>
 
		
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
