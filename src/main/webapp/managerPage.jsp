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

        const isValidElement = element => {
            return element.name && element.value;
        };


        const formToJSON = elements => [].reduce.call(elements, (data, element) => {
            if (isValidElement(element) ) {
                data[element.name] = element.value;
            }
            return data;
        }, {});

        function fillFields(emp, id) {
            $("#foundEmp").show()
            var form = document.getElementById("empForm")
            $("#monHours").attr("value", emp["monHours"])
            $("#tueHours").attr("value", emp["tueHours"])
            $("#wedHours").attr("value", emp["wedHours"])
            $("#thuHours").attr("value", emp["thuHours"])
            $("#friHours").attr("value", emp["friHours"])
            $("#satHours").attr("value", emp["satHours"])
            $("#sunHours").attr("value", emp["sunHours"])
            $("#hourSalary").attr("value", emp["hourSalary"])
            $("#userID").attr("value", id)
            $("#update").on("click", function() {
                const data = formToJSON(form.elements)
                const dataJson = JSON.stringify(data)
                var p = $.post('manage_employee', dataJson);
                p.done(function () {
                    console.log('success')
                })
            })
        }

        function findEmployee() {
            const id = $("#emp").val();
            console.log(id);
            var p = $.get('find_employee', id);
            p.done(function (data) {
                console.log(data)
                if (data !== null) {
                    $("#no_employee").hide()
                    fillFields(data, id)
                } else if (data === null) {
                    $("#foundEmp").hide()
                    $("#no_employee").show()
                    $("#no_employee").html("No employee matches this ID")
                }
            })
        }

        function createForm() {
            var form = document.createElement('form');
            //insert form attribute if needed

            //Hotel Name
            var input1 = document.createElement('input')
            input1.setAttribute('type', 'text')
            input1.type = 'text'
            input1.id = 'name'
            input1.name = 'name'

            var label1 = document.createElement('label')
            label1.htmlFor = 'name'
            label1.innerHTML = 'Name: '

            //Start Date
            var input2 = document.createElement('input')
            input2.setAttribute('type', 'text')
            input2.type = 'date'
            input2.id = 'startDate'
            input2.name = 'startDate'

            var label2 = document.createElement('label')
            label2.htmlFor = 'startDate'
            label2.innerHTML = 'Start Date: '

            //End Date
            var input3 = document.createElement('input')
            input3.setAttribute('type', 'text')
            input3.type = 'date'
            input3.id = 'endDate'
            input3.name = 'endDate'

            var label3 = document.createElement('label')
            label3.htmlFor = 'startDate'
            label3.innerHTML = 'End Date: '

            //altering Price
            var input4 = document.createElement('input')
            input4.setAttribute('type', 'text')
            input4.type = 'text'
            input4.id = 'alteringPrice'
            input4.name = 'alteringPrice'

            var label4 = document.createElement('label')
            label4.htmlFor = 'alteringPrice'
            label4.innerHTML = 'Markup: '

            var button = document.createElement('button')
            button.type = 'button'
            button.id = 'seasonSubmit'

            form.appendChild(label1)
            form.appendChild(input1)

            form.appendChild(label2)
            form.appendChild(input2)

            form.appendChild(label3)
            form.appendChild(input3)

            form.appendChild(label4)
            form.appendChild(input4)

            return form;
        }

        function editItem(hotelID, name, startDate, endDate, alteringPrice) {
            console.log(hotelID, name, startDate, endDate, alteringPrice);
            var id = name + "id";
            var li = document.getElementById(id)
            var form = createForm()
            $("#name").attr("value", name)
            $("#startDate").attr("value", startDate)
            $("#endDate").attr("value", endDate)
            $("#alteringPrice").attr("value", alteringPrice)
            var contents = li.textContent
            li.innerHTML = ""
            li.appendChild(form)
            $("#seasonSubmit").on('click', function() {
                const data = formToJSON(form.elements)
                const dataJson = JSON.stringify(data)
                $.post('edit_season', dataJson, function() {
                    console.log("edit successful")
                })
                //
                //li.textContent = contents
            })
        }

        function deleteItem(name, hotelID) {
            const json = {
                name: name,
                hotelID: hotelID
            }

            $.post('delete_season', JSON.stringify(json), function() {
                console.log('successful deletion')
            })
        }

        function displaySeasons(seasons) {
            seasons.forEach(function (season) {
                var hotelID = season['hotelID']
                var name = season['name']
                const startDate = season['startDate']
                const endDate = season['endDate']
                const alteringPrice = season['alteringPrice']
                const ksks = season['hotelID'] + ", "
                const editButton = "<button id=\"edit_button" + name + "\" type=\"button\" onclick='editItem(\""+ hotelID +"\", \"" + name + "\", \"" + startDate +"\", \"" + endDate +"\", \"" + alteringPrice +"\")'>Edit</button>"
                const deleteButton = "<button id=\"delete_button" + name + "\" type=\"button\" onclick='deleteItem(\""+ name + "\", \"" + hotelID +"\")'>Delete</button>"
                const appendString = "<li class=\"season_entry\" id=\"" + name + "id\">Season Name: " + name + " Start Date: " + startDate + " End Date: " + endDate + " Markup: " + alteringPrice + editButton + deleteButton + "</li>"
                $("#seasons_list").append(appendString)
                console.log('testing')
            })
        }

        function getSeasons() {
            var email = getCookie("userEmail")
            $.get('get_seasons', email, function(data) {
                console.log("GOt obkects!!!", data)
                if (data !== 'null') {
                    displaySeasons(data)
                } else {
                    console.log(data)
                }
            })
        }

        $(document).ready(function() {

            $("#search").on("click", function () {
                findEmployee();
            });

            getSeasons();

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

<div class="managerBlock">

    <div class="searchEmployee">
        <form id="search_emp">
            <label for="emp">Search Employee by ID: </label>
            <input name="emp" id="emp" type="text">
            <button type="button" id="search">Search</button>
        </form>
    </div>
    <span id="no_employee"></span>
    <div id="foundEmp" style="display: none">
        <span id="employee"></span> <br>
        <form id="empForm">
            <span id="wh">Working Hours: </span> <br>
            <div class="days">
                <label for="monHours">Monday:</label><input type="text" name="monHours" id="monHours">
                <label for="tueHours">Tuesday:</label><input type="text" name="tueHours" id="tueHours">
                <label for="wedHours">Wednesday:</label><input type="text" name="wedHours" id="wedHours">
                <label for="thuHours">Thursday:</label><input type="text" name="thuHours" id="thuHours">
                <label for="friHours">Friday:</label><input type="text" name="friHours" id="friHours">
                <label for="satHours">Saturday:</label><input type="text" name="satHours" id="satHours">
                <label for="sunHours">Sunday:</label><input type="text" name="sunHours" id="sunHours">
                <input type="text" id="userID" name="userID" style="display: none">
            </div>
            <br>
            <div class="hrsslry">
                <label for="hourSalary">Salary: </label><input type="text" name="hourSalary" id="hourSalary">
            </div>
            <br><button type="button" id="update">Submit changes</button>
        </form>
        <div id="response"></div>
    </div>
</div>

<br>
<div class="title_section">
    <span class="title"> Manage Seasons </span>
</div>

<div class="managerBlock">
    <ul id="seasons_list"></ul>
</div>

</body>
</html>
