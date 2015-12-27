<%@ include file="../header.jsp" %>
        <h3>Delete Person</h3>
        <p>You are about to delete the person ${person.firstName} ${person.lastName}:  Are you sure?</p>
        <form action="${pageContext.request.contextPath}/person/delete" method="post">
            <input type="hidden" name="personId" value="${person.personId}"/>
            <input type="submit" name="command" value="Cancel"/>
            <input type="submit" name="command" value="Delete"/>
        </form>
    </body>
</html>
