<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title><spring:message code="mailbox.tab.title" /></title>

    <style>
        body { text-align: center; font-family: Arial; background-image: url('../images/background.jpg') }
        th, td { border: 1px solid black; width: 300px; height: 50px; }
        th { background-color: lightskyblue; }
        a, a:hover { text-decoration: none; color: white; }
        .languages a, .languages a:hover { text-decoration: none; color: black; }
        button, button:hover, button:focus {
            width: 250px;
            height: 50px;
            background: #3498db;
            background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
            background-image: -moz-linear-gradient(top, #3498db, #2980b9);
            background-image: -ms-linear-gradient(top, #3498db, #2980b9);
            background-image: -o-linear-gradient(top, #3498db, #2980b9);
            background-image: linear-gradient(to bottom, #3498db, #2980b9);
            border-radius: 28px;
            color: white;
            font-size: 15px;
            padding: 10px 20px 10px 20px;
            text-decoration: none;
        }
        table { border-collapse: collapse; margin-left: auto; margin-right: auto; }
        .label { font-weight: bold; }
        #username, #password { width: 200px; height: 30px; }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            if ($("h1").html() == "Mailbox") $("#en").hide();
            if ($("h1").html() == "Boite de reception") $("#fr").hide();
            if ($("h1").html() == "Bendeja de entrada") $("#es").hide();
        });
    </script>

</head>

<body>

    <h1>Login page</h1>

    <form name='loginForm' action="<c:url value='/login' />" method='post'>

            <p class="username">
                <p class="label"><label>User : </label></p>
                <p class="input"><input type="text" name="username" id="username" required /></p>
            </p>

            <p class="password">
                <p class="label"><label>Password : </label></p>
                <p class="input"><input type="password" name="password" id="password" required /></p>
            </p>

            <button type="submit" name="submit">Sign in</button>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    </form>

</body>
</html>