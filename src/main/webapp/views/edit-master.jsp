
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta charset="UTF-8">
    <title>Редактирование мастера</title>
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
                <h3>Список Мастеров</h3>
                <table class="table table-sm" id="table-info">
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
                <h3>Форма Редактирования Мастера</h3>
                <div class="text-article">
                    <form method="POST" action="">
                        <div class="mb-3 row">
                            <label for="masterId" class="col-sm-3 col-form-label">Код</label>
                            <div class="col-sm-8">
                                <input type="text" name="masterId" id="masterId" class="form-control" readonly
                                    value="${mastersEdit[0].getId()}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="fullName" class="col-sm-3 col-form-label">ФИО</label>
                            <div class="col-sm-8">
                                <input type="text" name="fullName" id="fullName" class="form-control" required
                                    value="${mastersEdit[0].getFullName()}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="post" class="col-sm-3 col-form-label">Должность</label>
                            <div class="col-sm-8">
                                <input type="text" name="post" id="post" class="form-control" required
                                    value="${mastersEdit[0].getPost()}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="phone" class="col-sm-3 col-form-label">Номер тел.</label>
                            <div class="col-sm-8">
                                <input type="text" name="phone" id="phone" class="form-control" required
                                    value="${mastersEdit[0].getPhone()}"/>
                            </div>
                        </div>
                        <p>
                            <button type="submit" class="btn btn-primary">Редактировать</button>
                            <a href='<c:url value="/masters" />'
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
