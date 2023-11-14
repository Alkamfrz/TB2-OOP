<%-- Document : userForm Created on : Nov 14, 2023, 11:29:31 AM Author :
alkamfrz --%> <%@page import="com.dethrone.tb2.resources.User"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>User Management</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container">
      <% User user = null; if (request.getAttribute("user") != null) { user =
      (User) request.getAttribute("user"); %>
      <form action="update" method="POST">
        <input type="hidden" name="id" value="<%= user.getId() %>" />
        <table class="table table-striped">
          <thead>
            <tr>
              <th colspan="2">Edit User</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Name</td>
              <td>
                <input
                  type="text"
                  name="name"
                  value="<%= user.getName() %>"
                  required="required"
                />
              </td>
            </tr>
            <tr>
              <td>Age</td>
              <td>
                <input
                  type="number"
                  name="age"
                  value="<%= user.getAge() %>"
                  required="required"
                />
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <button type="submit">Update</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
      <% } else { %>
      <form action="insert" method="POST">
        <table class="table table-striped">
          <thead>
            <tr>
              <th colspan="2">Add New User</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Name</td>
              <td>
                <input
                  type="text"
                  name="name"
                  required="required"
                  placeholder="Your Name"
                />
              </td>
            </tr>
            <tr>
              <td>Age</td>
              <td>
                <input
                  type="number"
                  name="age"
                  required="required"
                  placeholder="Your Age"
                />
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <button type="submit">Save User</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
      <% } %>

      <a href="list">User List</a>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script>
      $(document).ready(function () {
        // Handle form submission
        $("#userForm").submit(function (event) {
          event.preventDefault(); // Prevent default form submission

          // Get form data
          var formData = {
            id: $("#id").val(),
            name: $("#name").val(),
            age: $("#age").val(),
          };

          // Determine URL based on whether we're updating or inserting
          var url = "insert";
          if (formData.id) {
            url = "update";
          }

          // Send AJAX request
          $.ajax({
            type: "POST",
            url: url,
            data: formData,
            success: function (response) {
              // Handle success response
              console.log(response);
              alert("User saved successfully!");
              window.location.href = "list"; // Redirect to user list page
            },
            error: function (xhr, status, error) {
              // Handle error response
              console.log(xhr.responseText);
              alert("Error saving user!");
            },
          });
        });
      });
    </script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
