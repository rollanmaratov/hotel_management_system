var session = '<%= session.getAttribute("user") != null %>';
console.log(session);
if (session === true) {
    //document.write('<a href="logout.jsp"><b>Logout</b></a>');
    document.write('Welcome, ${user.firstname} ${user.lastname}');
} else {
    document.write('<a href="login.jsp"><b>Login or Register</b></a>');
}