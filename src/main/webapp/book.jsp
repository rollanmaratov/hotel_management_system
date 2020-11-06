<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Dreamers</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
    <script src="scripts/jquery.min.js"></script>
    <script src="scripts/lodash.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#searchForm").validate({
                rules: {
                    email: "required",
                    password: "required",
                },

                messages: {
                    email: "Please enter email",
                    password: "Please enter password"
                }
            });

        });
    </script>
</head>
<body>
<div class="links">
    <a href="login.jsp">Log In or Register</a>
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

<form method="POST" id="bookForm" action="search">
    <!--  General -->
    <div class="form-group">
        <h2 class="heading">Search rooms</h2>

        <!--  Details -->
        <div class="form-group">
            <h2 class="heading">Details</h2>
            <div class="grid">
                    <div class="controls">
                        <input type="date" id="arrive" class="floatLabel" name="arrive" value="<?php echo date('Y-m-d'); ?>">
                        <label for="arrive" class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Arrive</label>
                        <input type="date" id="depart" class="floatLabel" name="depart" value="<?php echo date('Y-m-d'); ?>" />
                        <label for="depart" class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Depart</label>
                        <select class="floatLabel">
                            <option value="blank"></option>
                            <option value="1">1</option>
                            <option value="2" selected>2</option>
                            <option value="3">3</option>
                        </select>
                        <label id="fruit"><i class="fa fa-male"></i>&nbsp;&nbsp;People</label>
                        <select class="floatLabel">
                            <option value="blank"></option>
                            <option value="deluxe" selected>1</option>
                        </select>
                        <label for="fruit">Room</label>
                <button type="submit">Search</button>
            </div>
        </div>
    </div>
</form>

</body>
</html>