<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dreamers - Manager Page</title>
    <link rel="stylesheet" href="style.css">
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    <script src="scripts/lodash.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
    <script type="text/javascript">
        //here goes my script

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


        function compareDates(date) {
            var today = new Date();
            var d = date.split("-");
            if (parseInt(d[0]) < today.getFullYear()) {
                return false;
            } else if (parseInt(d[0]) > today.getFullYear()) {
                return true;
            } else {
                if (parseInt(d[1]) < today.getMonth()+1) {
                    return false;
                } else if (parseInt(d[1]) > today.getMonth()+1) {
                    return true;
                } else {
                    return parseInt(d[2]) > today.getDate();
                }
            }
        }

        function deleteItem(resID) {
            $.post("cancel_booking", resID, function () {
                console.log("success!")
            })
        }

        function updateList(bookings) {
            bookings.forEach(function (booking) {
                const resID = booking['reservationID']
                const inDate = booking['checkInDate']
                var isFuture = compareDates(inDate)
                const outDate = booking['checkOutDate']
                const resDate = booking['reservationDate']
                const typeName = booking['typeName']
                const hotelID = booking['hotelID']

                let deleteBooking = "<button onclick='deleteItem("+ resID +")'>Cancel</button>";
                if(isFuture) {
                    $("#activeBookingList").append("<li>" + resID + inDate + outDate + resDate + typeName + hotelID + deleteBooking + "</li>");
                } else {
                    $("#pastBookingList").append("<li>" + resID + inDate + outDate + resDate + typeName + hotelID + "</li>");
                }
            });
        }

        function getBookings() {
            var email = getCookie("userEmail");
            $.get("get_bookings", email, function(data) {
                updateList(data);
            })
        }

        function findEmployee() {
            const form = document.getElementById('search_emp');
            form.addEventListener('submit', (event) => {
                event.preventDefault(); //stops form from submitting
                const id = $("#emp").val();
                var p = $.post('find_employee', id);
                p.done(function (data) {
                    console.log("RESPONSE GOT");
                    //const monday = data
                })
            });
        }

        $(document).ready(function() {
            findEmployee();
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
        <a>Manage</a>
        <a href="draft.html">Information</a>
        <a href="draft.html">Contacts</a>
    </div>
</div>

<div class="title_section">
    <span class="title"> Manage Employees </span>
</div>

<div class="searchEmployee">
    <form id="search_emp">
        <label for="emp">Search Employee by ID</label>
        <input name="emp" id="emp" type="text">
        <button>Search</button>
    </form>
</div>
<div id="foundEmp">
    <span id="employee"></span> <br>
    <button>Manage hours</button>
    <button>Manage payroll</button>
    <div id="response"></div>
</div>

</body>
</html>
