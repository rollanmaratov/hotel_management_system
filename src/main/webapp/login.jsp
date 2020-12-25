<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style3.css">
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>

    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
    <script type="text/javascript">
        //here goes my script

        $(document).ready(function() {
            $("#loginForm").validate({ //from JQuery validate library
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: "required",
                },

                messages: {
                    email: {
                        required: "Please enter email",
                        email: "Please enter a valid email address"
                    },
                    password: "Please enter password"
                }

            });

        });
    </script>
</head>
<body>
<div class="links"></div>
<div class="heading">

    <div class="hotel_logo">
        <a href="index.jsp">
            <span>Hotel <br> Dreamers</span>
        </a>
    </div>

    <div class="services">
        <a href="index.jsp"> Homepage </a>
        <a href="login.jsp">Create a Booking</a>
        <a href="login.jsp">Manage my Booking</a>
        <a href="draft.html">Information</a>
        <a href="draft.html">Contacts</a>
    </div>
</div>
<div class="container">
    <div class="row text-center alert">
        <div class="row col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading text-center">

                    <div class="login">
                        <div class="panel-heading">
                            <span class="title">Login</span>
                        </div>
                        <div class=" panel-body">

                            <form method="POST" id="loginForm" action="login">
                                <div class="form-group">
                                    <label for="email"  class="required">Email: </label><input type="email" class="form-control" name="email" id="email" /> <br>
                                </div>
                                <div class="form-group">
                                    <label for="password"  class="required">Password: </label><input type="password" class="form-control" name="password" id="password" /> <br>
                                </div>
                                <button type="submit" class="btn btn-primary">Log In</button>
                                <div class="message">${message}</div>
                                <p>New user? Register <a href="register.jsp" class="text-danger">here</a></p>
                            </form>
                        </div>
                    </div>
                    <div class="footer text-right">
                        <small>  &copy; Hotel Dreamers </small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
<%--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>--%>
</body>
</html> 
