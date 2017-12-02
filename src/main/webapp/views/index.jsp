<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
        table { border-collapse: collapse; margin-left: auto; margin-right: auto; }g
    </style>

</head>

<body>

    <h1><spring:message code="mailbox.page.title" /></h1>

    <p class="languages">
        <a href="/mailbox?lang=fr"><spring:message code="mailbox.language.fr" /></a> |
        <a href="/mailbox?lang=es"><spring:message code="mailbox.language.es" /></a> |
        <a href="/mailbox?lang=en"><spring:message code="mailbox.language.en" /></a>
    </p>

    <br />

    <button><a href="/send"><spring:message code="mailbox.button.send" /></a></button>

    <p><spring:message code="mailbox.abstract.title" /></p>

    <table class="table">
        <tr>
            <th><spring:message code="mailbox.table.sender" /></th>
            <th><spring:message code="mailbox.table.subject" /></th>
            <th><spring:message code="mailbox.table.content" /></th>
        </tr>

        <c:forEach items="${mails}" var="mail">
        <tr>
            <td>${mail.from}</td>
            <td>${mail.subject}</td>
            <td>${mail.content}</td>
        </tr>
        </c:forEach>

    </table>
</body>
</html>