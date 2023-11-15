<%@page import="java.util.List" %>
    <%@page import="com.dethrone.tb2.resources.User" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>User Management</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" type="text/css"
                    href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            </head>

            <body>
                <div class="container py-5">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h1>User Management</h1>
                        <a href="new" class="btn btn-primary">Add New User</a>
                    </div>
                    <div class="card">
                        <div class="card-body">
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
                                                    <a href="edit?id=<%= user.getId() %>"
                                                        class="btn btn-warning btn-sm">Edit</a>
                                                    <a href="delete?id=<%= user.getId() %>"
                                                        class="btn btn-danger btn-sm">Delete</a>
                                                </td>
                                            </tr>
                                            <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script type="text/javascript" charset="utf8"
                    src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $('.table').DataTable({
                            "order": [[0, "desc"]],
                            "pagingType": "numbers",
                            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                            "pageLength": 10,
                            "language": {
                                "lengthMenu": "Display _MENU_ records per page",
                                "zeroRecords": "Nothing found - sorry",
                                "info": "Showing page _PAGE_ of _PAGES_",
                                "infoEmpty": "No records available",
                                "infoFiltered": "(filtered from _MAX_ total records)"
                            },
                            "dom": '<"top"i>rt<"bottom"flp><"clear">',
                            "autoWidth": false,
                            "columns": [
                                { "width": "10%" },
                                { "width": "40%" },
                                { "width": "10%" },
                                { "width": "40%" }
                            ],
                            "columnDefs": [
                                { "searchable": false, "targets": [3] }
                            ]
                        });
                    });
                </script>
            </body>

            </html>