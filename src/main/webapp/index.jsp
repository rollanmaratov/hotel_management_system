<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hotel Dreamers</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="scripts/lodash.min.js"></script>
        <script type="text/javascript">

            //this function gets cookie by name
            function getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for(var i = 0; i <ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) === ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) === 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }

            function checkCookie() {
                var email = getCookie("userEmail");
                var userType = getCookie("userType");
                if (email === "") {
                    $("#link").html('<a href="login.jsp"><b>Login or Register</b></a>');
                    $("#create_booking").attr("href", "login.jsp")
                    $("#manage_booking").attr("href", "login.jsp")
                }
                else if (email !== "" && userType === 'guest') {
                    //gets all data about guest from login servlet
                    $.get('login', email, function(data) {
                        const name = data['firstname'] + ' ' + data['lastname'];
                        $("#link").html('<span class="profile_name"> Welcome, <a href="profilePage.jsp">' + name + '</a></span>' + ' <a href="logout.jsp"><b>Logout</b></a> </span>') ;
                        $("#create_booking").attr("href", "book.jsp")
                        $("#manage_booking").attr("href", "profilePage.jsp")
                    })
                }
                else if (email !== "" && userType === 'deskClerk') {
                    $.get('login', email, function(data) {
                        const name = data['firstname'] + ' ' + data['lastname'];
                        $("#link").html('<span class="profile_name"> Welcome, <a href="clerkPage.jsp">' + name + '</a></span>' + ' <a href="logout.jsp"><b>Logout</b></a> </span>') ;
                        $("#create_booking").html("");
                        $("#manage_booking").attr("href", "clerkPage.jsp")
                    })
                }
                else if (email !== "" && userType === 'manager') {
                    $.get('login', email, function(data) {
                        const name = data['firstname'] + ' ' + data['lastname'];
                        $("#link").html('<span class="profile_name"> Welcome, <a href="managerPage.jsp">' + name + '</a></span>' + ' <a href="logout.jsp"><b>Logout</b></a> </span>') ;
                        $("#create_booking").html("");
                        $("#manage_booking").attr("href", "managerPage.jsp");
                        $("#manage_booking").html("Manage");
                    })
                }
            }

            function checkSession() {
                //this variable stores session
                let session = '<%= session.getAttribute("user") != null %>';
                //this line deletes cookie if it does not detect an active session
                if (session !== "true") {
                    document.cookie = "userEmail=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    document.cookie = "userType=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                }
            }

            $(document).ready(function() {
                checkSession();
                checkCookie();
            })

        </script>
    </head>
    <body>
        <div class="links" id="link">
        <%--  this line is later filled by js code  --%>
        </div>
        <div class="heading">
            <div id="hey"></div>
            <div class="hotel_logo">
                <a href="index.jsp">
                <span>Hotel <br> Dreamers</span>
                </a>
            </div>

            <div class="services">
                <a href="index.jsp"> Homepage </a>
                <a id="create_booking" href="">Create a Booking</a>
                <a id="manage_booking" href="">Manage Bookings</a>
                <a href="draft.html">Information</a>
                <a href="draft.html">Contacts</a>
            </div>
        </div>

        <div class="welcome">
            <div class="welcome_image">
                <img class="center_fit" src="img/hotel_index_image.jpg" alt="">
            </div>
        </div>

        <div class="about_hotel">
            <span class="title"> About Hotel</span>
            <div class="text_wrapper">
                <span>
                    Dreamers Hotel is a cozy 5-star hotel with breathtaking views. Here you will find anything you want, getting away from the hustle and bustle of everyday life, parties or relaxation in spa.
The rooms at the Dreamers Hotel are new, comfortable, and safe. Reception staff will be happy to help you during your stay in our hotel, suggesting itineraries, guided visits, and some good restaurants in the historic centre.
Available services include free WI-FI internet connection everywhere, breakfast and 24/7 reception.
Hospitable staff, calm atmosphere, favorable location will make your vacation and business trip as comfortable and pleasant as possible.
                </span>
            </div>
        </div>
    </body>
</html> 
