<%@ include file="../header.jsp" %>
        <h3>Person Listing</h3>     
        <p><a href="${pageContext.request.contextPath}/person/create">Create New Person</a></p>
        <c:choose>
            <c:when test="${fn:length(persons) gt 0}">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${persons}" var="person">
                            <tr>
                                <td>${person.firstName}</td>
                                <td>${person.lastName}</td>
                                <td>${person.emailAddress}</td>
                                <td>
                                <a href="${pageContext.request.contextPath}/person/view/${person.personId}">View </a>
                                    <a href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit </a>
                                    <a href="${pageContext.request.contextPath}/person/delete/${person.personId}">Delete </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>
            </c:when>
            <c:otherwise>
                <p>No results found.</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>
