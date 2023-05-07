<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="domain.Service" %>
<%@ page import="domain.Master" %>
<%
    Master m1 = new Master(1l, "Казаков Авраам Юрьевич", "Сантехник", "89067821112");
    Master m2 = new Master(2l, "Васильев Степан Гордеевич", "Мастер стиральных машин", "89280984590");
    Master m3 = new Master(3l, "Фадеев Адриан Иванович", "Плиточник", "89609126545");
    Master[] masters = new Master[]{m1, m2, m3};
    pageContext.setAttribute("masters", masters);

    Service s1 = new Service(1L, "Установка ванны", 3000L, 2L, 1L, m1);
    Service s2 = new Service(2L, "Замена смесителя", 800L, (long)0.5, 1L, m1);
    Service s3 = new Service(3L, "Ремонт подшипников", 1500L, (long)1.5, 2L, m2);
    Service s4 = new Service(4L, "Ремонт блока управлени", 2400L, (long)1.5, 2L, m2);
    Service s5 = new Service(5L, "Укладка плитки", 5000L, 4L, 3L, m3);
    Service s6 = new Service(6L, "Резка плитки", 4500L, (long)3.5, 3L, m3);

    Service[] services = new Service[]{s1, s2, s3, s4, s5, s6};
    pageContext.setAttribute("services", services);
%>

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
                            <td><fmt:formatNumber value="${service.getDuration()}" minFractionDigits="1" maxFractionDigits="1"/>ч.</td>
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
