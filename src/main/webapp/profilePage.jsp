<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile Page</title>
        <link rel="stylesheet" href="style.css">
        <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
        <script src="scripts/lodash.min.js"></script>
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
            <a href="logout.jsp"><b>Logout</b></a>
        </div>
        <div class="heading">
            
            <div class="hotel_logo">
                <a href="index.jsp">
                <span>Hotel <br> Dreamers</span>
                </a>
            </div>
            
            <div class="services">
                <a href="index.jsp"> Homepage </a>
                <a href="book.jsp">Create a Booking</a>
                <a href="draft.html">Manage my Booking</a>
                <a href="draft.html">Information</a>
                <a href="draft.html">Contacts</a>
            </div>
        </div>

        <div class="title_section">
            <span class="title"> User Profile </span>
        </div>

        <div class="info_section">
            <span>First Name: ${user.firstname} </span> <br />
            <span>Last Name: ${user.lastname}</span> <br />
            <span>Email: ${user.email}</span>
        </div>
        <br />
        <br />
        <div class="title_section">
            <span class="title"> My bookings </span>
        </div>

        <div class="booking_section"></div>

    </body>
</html> 
