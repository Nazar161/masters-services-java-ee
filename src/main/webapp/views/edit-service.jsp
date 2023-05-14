<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta charset="UTF-8">
    <title>Редактирование сервиса</title>
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
                <h3>Форма Редактирования Сервиса</h3>
                <div class="text-article">
                    <form method="POST" action="">
                        <div class="mb-3 row">
                            <label for="serviceId" class="col-sm-3 col-form-label">Код</label>
                            <div class="col-sm-7">
                                <input type="text" name="serviceId" id="serviceId" class="form-control" readonly
                                       value="${servicesEdit[0].getId()}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="title" class="col-sm-3 col-form-label">Название</label>
                            <div class="col-sm-7">
                                <input type="text" name="title" id="title" required
                                       value="${servicesEdit[0].getTitle()}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="duration" class="col-sm-3 col-form-label">Продолжительность</label>
                            <div class="col-sm-7">
                                <input type="number" step="0.5" name="duration" id="duration" required
                                       value="${servicesEdit[0].getDuration()}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="price" class="col-sm-3 col-form-label">Стоимость</label>
                            <div class="col-sm-7">
                                <input type="number" step="50" name="price" id="price" required
                                       value="${servicesEdit[0].getPrice()}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="master" class="col-sm-3 col-form-label">Мастер</label>
                            <div class="col-sm-7" style="padding-right: 0">
                                <select class="form-control" name="master" id="master" required>
                                    <option disabled>Выберите Мастера</option>
                                    <c:forEach var="master" items="${masters}">
                                        <option value="${master.getId()}" ${servicesEdit[0].getIdMaster() == master.getId() ? "selected" : null}>
                                            <c:out value="${master.getFullName()}(${master.getPost()})"></c:out>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <p>
                            <button type="submit" class="btn btn-primary">Редактировать</button>
                            <a href='<c:url value="/services" />'
                               role="button"
                               class="btn btn-secondary">Отменить/Возврат</a>
                        </p>
                    </form>
                </div>
            </article>
        </section>
    </div>
</div>
<jsp:include page="../jspf/footer.jsp"/>
</body>
</html>
