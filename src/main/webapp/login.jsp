<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css">
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
                    //email: {
                    //    required: true,
                    //    email: true
                    //},
                    email: "required",
                    password: "required",
                },

                messages: {
                    //email: {
                    //    required: "Please enter email",
                    //    email: "Please enter a valid email address"
                    //},
                    email: "Please enter email",
                    password: "Please enter password"
                }
            });

        });
    </script>
    </head>
    <body>
        <div class="links">

        </div>
        <div class="heading">
            
            <div class="hotel_logo">
                <a href="index.jsp">
                <span>Hotel <br> Dreamers</span>
                </a>
            </div>
            
            <div class="services">
                <a href="index.jsp"> Homepage </a>
                <a href="draft.html">Create a Booking</a>
                <a href="draft.html">Manage my Booking</a>
                <a href="draft.html">Information</a>
                <a href="draft.html">Contacts</a>
            </div>
        </div>

        <div class="login">
            <span class="title">Login</span>
            <form method="POST" id="loginForm" action="login">
                <label for="email" class="required">Email: </label><input type="text"  name="email" id="email" /> <br>
                <label for="password" class="required">Password: </label><input type="password" name="password" id="password" /> <br>
                <button type="submit">Log In</button>
                <p>New user? Register <a href="register.jsp">here</a></p>
            </form>
        </div>

   
    </body>
</html> 
