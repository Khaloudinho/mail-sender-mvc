<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sending a mail</title>

    <style>
        body { text-align: center; font-family: Arial; }
        th, td { border: 1px solid black; }
        a, a:hover { text-decoration: none; }
        button { width: 150px; height: 25px; }
        table { border-collapse: collapse; margin-left:auto; margin-right:auto; }
        .label { font-weight: bold; }
        #subject { width: 400px; height: 30px; }
        #content { width: 400px; height: 100px; }
    </style>

    <script type="text/javascript">
        $(document).ready(function() {
            if ($("#subject").is(":empty")){
                $("#subjectErrors").text("The field << subject >> cannot be empty ! ");
            }

            if ($("#content").is(":empty")){
                $("#contentErrors").text("The field << content >> cannot be empty ! ");
            }
        });
    </script>
</head>

<body>

    <h1>Sending an email</h1>

    <button><a href="/mailbox">Comeback to mailbox</a></button>

    <p>Please fulfill the following blanks to send your email </p>

    <hr>

    <form method="post" action="/send">

        <p class="subject">
            <p class="label"><label>Subject : </label></p>
            <p class="input"><input type="text" name="subject" id="subject" required="required"/></p>
            <p id="subjectErrors"></p>
        </p>

        <p class="content">
            <p class="label"><label>Content : </label></p>
            <p class="input"><textarea name="content" id="content" required="required"></textarea></p>
            <p id="contentErrors"></p>
        </p>

        <button type="submit">Send my mail</button>

    </form>

</body>
</html>