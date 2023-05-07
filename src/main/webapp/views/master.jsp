<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="domain.Master" %>

<%
    Master m1 = new Master(1l, "Казаков Авраам Юрьевич", "Сантехник", "89067821112");
    Master m2 = new Master(2l, "Васильев Степан Гордеевич", "Мастер по ремонту стиральных машин", "89280984590");
    Master m3 = new Master(3l, "Фадеев Адриан Иванович", "Плиточник", "89609126545");
    Master[] masters = new Master[]{m1, m2, m3};
    pageContext.setAttribute("masters", masters);
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Мастера</title>
</head>
<body>
<jsp:include page="../jspf/header.jsp"/>
<div id="main">
    <div class="content">
        <section class="left-section">
            <aside class="left-side">
                <h3>Список Мастеров</h3>
                <table>
                    <thead>
                    <tr>
                        <th scope="col">Код</th>
                        <th scope="col">ФИО Мастера</th>
                        <th scope="col">Должность</th>
                        <th scope="col">Номер телефона</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="master" items="${masters}">
                        <tr>
                            <td>${master.getId()}</td>
                            <td>${master.getFullName()}</td>
                            <td>${master.getPost()}</td>
                            <td>${master.getPhone()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </aside>
        </section>
        <section class="right-section">
            <article>
                <h3>Форма Добавления Мастера</h3>
                <div class="text-article">
                    <form method="POST" action="">
                        <p>
                            <label for="fullName">ФИО</label>
                            <input type="text" name="fullName" id="fullName"/>
                        </p>
                        <p>
                            <label for="post">Должность</label>
                            <input type="text" name="post" id="post"/>
                        </p>
                        <p>
                            <label for="phone">Номер тел.</label>
                            <input type="text" name="phone" id="phone"/>
                        </p>
                    </form>
                    <p><button type="submit">Добавить</button></p>
                </div>
            </article>
        </section>
    </div>
</div>
<jsp:include page="../jspf/footer.jsp"/>
</body>
</html>
