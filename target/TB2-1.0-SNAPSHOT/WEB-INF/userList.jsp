<%@page import="java.util.List"%>
<%@page import="com.dethrone.tb2.resources.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>User Management</h1>
            <a href="new" class="btn btn-primary">Add New User</a>
        </div>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% List<User> list = (List<User>) request.getAttribute("listUser");
                for (User user : list) { %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getAge() %></td>
                        <td>
                            <a href="edit?id=<%= user.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="delete?id=<%= user.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>