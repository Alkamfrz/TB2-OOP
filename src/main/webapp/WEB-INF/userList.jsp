<%-- Document : userList Created on : Nov 14, 2023, 11:23:11 AM Author : alkamfrz --%>

    <%@page import="java.util.List" %>
        <%@page import="com.dethrone.tb2.resources.User" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>User Management</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                        crossorigin="anonymous">
                </head>

                <body>
                    <div class="container">
                        <h1>User Management</h1>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Age</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<User> list = (List<User>) request.getAttribute("listUser");
                                        for (User user : list) {
                                        %>
                                        <tr>
                                            <td>
                                                <%= user.getId() %>
                                            </td>
                                            <td>
                                                <%= user.getName() %>
                                            </td>
                                            <td>
                                                <%= user.getAge() %>
                                            </td>
                                            <td>
                                                <a href="edit?id=<%= user.getId() %>">Edit</a>
                                                <a href="delete?id=<%= user.getId() %>">Delete</a>
                                            </td>
                                        </tr>
                                        <% } %>
                            </tbody>
                        </table>
                        <a href="new">Add New User</a>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
                        <script>
                            $(document).ready(function () {
                                $("form").submit(function (event) {
                                    event.preventDefault();
                                    var formAction = $(this).attr("action");
                                    var formMethod = $(this).attr("method");
                                    var formData = $(this).serialize();
                                    $.ajax({
                                        url: formAction,
                                        type: formMethod,
                                        data: formData,
                                        success: function (response) {
                                            alert(response);
                                        }
                                    });
                                });
                            });
                        </script>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                        crossorigin="anonymous"></script>
                </body>

                </html>