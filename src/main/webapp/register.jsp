<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="style.css">
    <script src="scripts/jquery.min.js"></script>
    <script src="scripts/lodash.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;600;700;900&display=swap" rel="stylesheet">
    <script type="text/javascript">


        const isValidElement = element => {
            return element.name && element.value;
        };

        const isValidValue = element => {
            return (!['checkbox', 'radio'].includes(element.type) || element.checked);
        };

        const formToJSON = elements => [].reduce.call(elements, (data, element) => {
            if (isValidElement(element) && isValidValue(element)  && element.name!=='reppassword') {
                data[element.name] = element.value;
            }
            return data;
        }, {});

        $(document).ready(function () {
            const form = document.getElementById('regForm');
            form.addEventListener('submit', (event) => {
                event.preventDefault(); //stops form from submitting
                const password = $('#password').val()
                const reppassword = $("#reppassword").val()
                if (password === reppassword) {
                    const data = formToJSON(form.elements)
                    const dataJson = JSON.stringify(data);
                    console.log('json data', data);
                    var p = $.post('register', dataJson);
                    p.done(function (r) {
                        if (r['message'] === 'success') {
                            window.location.replace("index.jsp")
                        } else {
                            $('#message').html(r['message'])
                        }
                    })
                } else {
                    $('#message').html('Passwords do not match')
                    console.log('Passwords do not match')
                };
            });
        });

    </script>
</head>
<body>
<div class="links">
    <a href="login.jsp">Log In</a>
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

<div class="title_section">
    <span class="title">Registration</span>
</div>

<div class="registration">
    <form id="regForm">
        <input type="text" placeholder="First Name" name="firstname" id="firstname" required> <!-- on same line -->
        <input type="text" placeholder="Last Name" name="lastname" id="lastname" required> <br>
        <input type="text" placeholder="Email" name="email" id="email" required> <br>
        <input type="password" placeholder="Password" name="password" id="password" required> <br>
        <input type="password" placeholder="Repeat Password" name="reppassword" id="reppassword" required> <br>

        <label for="idType">Choose your Identification Document:</label> <br />
        <select name="idType" id="idType" required>
            <option value="Passport">Passport</option>
            <option value="Drivers License">Driver's License</option>
            <option value="State id">State ID</option>
        </select>
        <br>
        <input type="text" placeholder="Document Number" name="idNumber" id="idNumber" required> <br>
        <input type="text" placeholder="Address line 1 (country, city, place)" id="addressLine1" name="addressLine1" required>
        <br>
        <input type="text" placeholder="Address line 2 (any additional info)" id="addressLine2" name="addressLine2" > <br>
        <input type="text" name="mobilePhoneNumber" id="mobilePhoneNumber" placeholder="Mobile Phone Number" pattern="\+[0-9]{11}" required> <br>
        <input type="text" name="homePhoneNumber" id="homePhoneNumber" placeholder="Home Phone Number" pattern="\+[0-9]{11}"> <br>
        <input type="date" name="dateOfBirth" id="dateOfBirth" placeholder="yyyy-mm-dd"> <br>
        <!-- sex -->

        <input type="radio" id="male" name="sex" value="male">
        <label for="male">Male</label>
        <input type="radio" id="female" name="sex" value="female">
        <label for="female">Female</label>
        <input type="radio" id="nonbinary" name="sex" value="other">
        <label for="nonbinary">Other</label> <br>

        <input type="submit" id="register_button" value="Register">
    </form>
    <div id="message"></div>
</div>
</body>
</html>