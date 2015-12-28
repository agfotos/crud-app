<%@ include file="../header.jsp" %>
        <h3>Client Listing</h3>     
        <p><a href="${pageContext.request.contextPath}/client/create" class="btn btn-info" role="button">Create New Client</a></p>
        <c:choose>
            <c:when test="${fn:length(clients) gt 0}">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Company Name</th>
                            <th>Website</th>
                            <th>Phone</th>
                            <th>Physical Address</th>
                            <th>Mailing Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${clients}" var="client">
                            <tr>
                                <td>${client.companyName}</td>
                                <td>${client.website}</td>
                                <td>${client.phone}</td>
                                <td>${client.pStreetAddress }<br/>
                                	${client.pCity } ${client.pState } ${client.pZipCode }
                                </td>
                                <td>${client.mStreetAddress }<br/>
                                	${client.mCity } ${client.mState } ${client.mZipCode }
                                </td>
                                <td>
                                <a href="${pageContext.request.contextPath}/client/view/${client.clientId}" class="btn btn-info" role="button">View</a>
                                    <a href="${pageContext.request.contextPath}/client/edit/${client.clientId}" class="btn btn-info" role="button">Edit </a>
                                    <a href="${pageContext.request.contextPath}/client/delete/${client.clientId}" class="btn btn-info" role="button">Delete</a>
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
