<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="send.tab.title" /></title>

    <style>
        body { text-align: center; font-family: Arial; background-image: url('../images/background.jpg') }
        th, td { border: 1px solid black; }
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
        #subject { width: 400px; height: 30px; }
        #content { width: 400px; height: 100px; }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            if ($("h1").html() == "Sending a mail") $("#en").hide();
            if ($("h1").html() == "Envoi d'un mail") $("#fr").hide();
            if ($("h1").html() == "Enviando un correo electronico") $("#es").hide();
        });
    </script>
</head>

<body>

    <h1><spring:message code="send.page.title" /></h1>

    <p class="languages">
        <a id="fr" href="/send?lang=fr"><spring:message code="send.language.fr" /> </a>
        <a id="es" href="/send?lang=es"><spring:message code="send.language.es" /> </a>
        <a id="en" href="/send?lang=en"><spring:message code="send.language.en" /></a>
    </p>

    <br />

    <button><a href="/mailbox"><spring:message code="send.button.mailbox" /></a></button>

    <p><spring:message code="send.abstract.title" /></p>

    <hr>

    <c:if test="${errors != null}">
        <p>${errors}</p>
    </c:if>

    <form method="post" action="/send">

        <p class="subject">
            <p class="label"><label><spring:message code="send.label.subject" /></label></p>
            <p class="input"><input type="text" name="subject" id="subject" required /></p>
        </p>

        <p class="content">
            <p class="label"><label><spring:message code="send.label.content" /></label></p>
            <p class="input"><textarea name="content" id="content" required></textarea></p>
        </p>

        <button type="submit" id="submit"><spring:message code="send.button.submit" /></button>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    </form>

</body>
</html>