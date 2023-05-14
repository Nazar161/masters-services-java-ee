<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Услуги</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../jspf/header.jsp"/>
<div id="main">
    <div class="content">
        <section class="left-section">
            <aside class="left-side">
                <h3>Список Услуг</h3>
                <table class="table table-sm" id="table-info">
                    <thead>
                    <tr>
                        <th scope="col">Код</th>
                        <th scope="col">Название</th>
                        <th scope="col">Продолжительность</th>
                        <th scope="col">Стоимость</th>
                        <th scope="col">Мастер</th>
                        <th scope="col">Редактировать</th>
                        <th scope="col">Удалить</th>
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
                            <td>
                                <a href='<c:url value="/editservice?id=${service.getId()}" />' role="button"
                                   class="btn btn-outline-primary">
                                    <img class="icon" alt="Редактировать" src="images/icon-edit.png">
                                </a>
                            </td>
                            <td>
                                <a href='<c:url value="/deleteservice?id=${service.getId()}" />' role="button"
                                   class="btn btn-outline-primary">
                                    <img class="icon" alt="Удалить" src="images/icon-delete.png">
                                </a>
                            </td>
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
                        <div class="mb-3 row">
                            <label for="title" class="col-sm-3 col-form-label">Название</label>
                            <div class="col-sm-7">
                                <input type="text" name="title" id="title" required/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="duration" class="col-sm-3 col-form-label">Продолжительность</label>
                            <div class="col-sm-7">
                                <input type="number" step="0.5" name="duration" id="duration" required/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="price" class="col-sm-3 col-form-label">Стоимость</label>
                            <div class="col-sm-7">
                                <input type="number" step="50" name="price" id="price" required/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="master" class="col-sm-3 col-form-label">Мастер</label>
                            <div class="col-sm-7" style="padding-right: 0">
                                <select class="form-control" name="master" id="master" required>
                                    <option disabled>Выберите Мастера</option>
                                    <c:forEach var="master" items="${masters}">
                                        <option value="${master.getId()}">
                                            <c:out value="${master.getFullName()}(${master.getPost()})"></c:out>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <p><button type="submit" class="btn btn-primary">Добавить</button></p>
                    </form>
                </div>
            </article>
        </section>
    </div>
</div>
<jsp:include page="../jspf/footer.jsp"/>
</body>
</html>