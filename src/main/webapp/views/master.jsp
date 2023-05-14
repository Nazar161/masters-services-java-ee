<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Мастера</title>
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
                <h3>Список Мастеров</h3>
                <table class="table table-sm" id="table-info">
                    <thead>
                    <tr>
                        <th scope="col">Код</th>
                        <th scope="col">ФИО Мастера</th>
                        <th scope="col">Должность</th>
                        <th scope="col">Номер телефона</th>
                        <th scope="col">Редактировать</th>
                        <th scope="col">Удалить</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="master" items="${masters}">
                        <tr>
                            <td>${master.getId()}</td>
                            <td>${master.getFullName()}</td>
                            <td>${master.getPost()}</td>
                            <td>${master.getPhone()}</td>
                            <td>
                                <a href='<c:url value="/editmaster?id=${master.getId()}" />' role="button"
                                   class="btn btn-outline-primary">
                                    <img class="icon" alt="Редактировать" src="images/icon-edit.png">
                                </a>
                            </td>
                            <td>
                                <a href='<c:url value="/deletemaster?id=${master.getId()}" />' role="button"
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
                <h3>Форма Добавления Мастера</h3>
                <div class="text-article">
                    <form method="POST" action="">
                        <div class="mb-3 row">
                            <label for="fullName" class="col-sm-3 col-form-label">ФИО</label>
                            <div class="col-sm-8">
                                <input type="text" name="fullName" id="fullName" class="form-control" required/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="post" class="col-sm-3 col-form-label">Должность</label>
                            <div class="col-sm-8">
                                <input type="text" name="post" id="post" class="form-control" required/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="phone" class="col-sm-3 col-form-label">Номер тел.</label>
                            <div class="col-sm-8">
                                <input type="text" name="phone" id="phone" class="form-control" required/>
                            </div>
                        </div>
                        <p>
                            <button type="submit" class="btn btn-primary">Добавить</button>
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