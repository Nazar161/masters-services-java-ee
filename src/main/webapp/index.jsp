<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Главная страница</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<jsp:include page="./jspf/header.jsp"/>
<div id="main" class="block-container">
    <h2>Функции системы</h2>
    <ul>
        <li><a href="masters">Мастера</a>
        <li><a href="services">Услуги</a>
    </ul>
</div>
<jsp:include page="./jspf/footer.jsp"/>
</body>
</html>