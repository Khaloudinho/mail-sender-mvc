<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Mailbox</title>

    <style>
        body { text-align: center; font-family: Arial; }
        th, td { border: 1px solid black; width: 300px; height: 50px; }
        th { background-color: lightskyblue; }
        a, a:hover { text-decoration: none; }
        table { border-collapse: collapse; margin-left: auto; margin-right: auto; }
        button { width: 150px; height: 25px; }
    </style>

</head>

<body>

    <h1>Mailbox</h1>

    <button><a href="/send">Send a mail</a></button>

    <p>Here, this is all the mails present into your mailbox </p>

    <table class="table">
        <tr>
            <th>Sender</th>
            <th>Subject</th>
            <th>Content</th>
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