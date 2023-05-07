<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Услуги</title>
</head>
<body>
<jsp:include page="../jspf/header.jsp"/>
<div id="main">
    <div class="content">
        <section class="left-section">
            <aside class="left-side">
                <h3>Список Услуг</h3>
                <table>
                    <thead>
                    <tr>
                        <th scope="col">Код</th>
                        <th scope="col">Название</th>
                        <th scope="col">Продолжительность</th>
                        <th scope="col">Стоимость</th>
                        <th scope="col">Мастер</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="service" items="${services}">
                        <tr>
                            <td>${service.getId()}</td>
                            <td>${service.getTitle()}</td>
                            <td>${service.getDuration()}ч.</td>
                            <td>${service.getPrice()} руб.</td>
                            <td>${service.getMaster()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </aside>
        </section>
        <section class="right-section">
            <article>
                <h3>Данные по услуге</h3>
                <div class="text-article">
                    <form method="POST" action="">
                        <p>
                            <label for="title">Название</label>
                            <input type="text" name="title" id="title"/>
                        </p>
                        <p>
                            <label for="duration">Продолжительность</label>
                            <input type="number" step="0.5" name="duration" id="duration" style="width: 100px"/>
                        </p>
                        <p>
                            <label for="price">Стоимость</label>
                            <input type="number" step="50" name="price" id="price"/>
                        </p>
                        <p>
                            <label for="phone">Номер тел.</label>
                            <input type="text" name="phone" id="phone"/>
                        </p>
                        <p>
                            <label for="master">Мастер</label>
                            <select name="master" id="master" style="width: 180px">
                                <option disabled>Выберите Мастера</option>
                                <c:forEach var="master" items="${masters}">
                                    <option value="${master}">${master.getFullName()}(${master.getPost()})</option>
                                </c:forEach>
                            </select>
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
