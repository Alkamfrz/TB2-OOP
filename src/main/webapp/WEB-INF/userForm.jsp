<%@page import="com.dethrone.tb2.resources.User"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>User Management</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container mt-5">
      <% User user = (User) request.getAttribute("user"); %>
      <div class="card">
        <div class="card-header">
          ${user != null ? 'Edit User' : 'Add New User'}
        </div>
        <div class="card-body">
          <form
            id="userForm"
            action="${user != null ? 'update' : 'insert'}"
            method="POST"
          >
            <input
              type="hidden"
              name="id"
              value="${user != null ? user.getId() : ''}"
            />
            <div class="mb-3">
              <label for="name" class="form-label">Name</label>
              <input
                type="text"
                id="name"
                name="name"
                class="form-control"
                value="${user != null ? user.getName() : ''}"
                required
                placeholder="Your Name"
              />
            </div>
            <div class="mb-3">
              <label for="age" class="form-label">Age</label>
              <input
                type="number"
                id="age"
                name="age"
                class="form-control"
                value="${user != null ? user.getAge() : ''}"
                required
                placeholder="Your Age"
              />
            </div>
            <button type="submit" class="btn btn-primary">
              ${user != null ? 'Update' : 'Save User'}
            </button>
          </form>
        </div>
      </div>
      <a href="list" class="btn btn-link mt-3">User List</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      $(document).ready(function () {
        $("form").submit(function (event) {
          event.preventDefault();
          var form = $(this);
          var url = form.attr("action");
          $.ajax({
            type: "POST",
            url: url,
            data: form.serialize(),
            success: function (data) {
              alert("Success!");
              window.location.href = "list";
            },
            error: function (data) {
              alert("Error!");
            },
          });
        });
      });
    </script>
  </body>
</html>
