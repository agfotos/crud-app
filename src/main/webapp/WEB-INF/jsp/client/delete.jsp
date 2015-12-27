<%@ include file="../header.jsp" %>
        <h3>Delete Client</h3>
        <p>You are about to delete the client ${client.companyName}:  Are you sure?</p>
        <form action="${pageContext.request.contextPath}/client/delete" method="post" class="form-horizontal" role="form">
            <input type="hidden" name="clientId" value="${client.clientId}"/>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-2">
					<button type="submit" class="btn btn-default" name="command" value="Cancel">Cancel</button>
					<button type="submit" class="btn btn-default" name="command" value="Delete">Delete</button>

           		</div>
           </div>
        </form>
    </body>
</html>
