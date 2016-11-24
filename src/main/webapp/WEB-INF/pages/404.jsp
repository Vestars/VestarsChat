<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>404-Ошибка</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/static/css/materialize.css">
    <link type="text/css" rel="stylesheet" href="/static/css/sigin.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/static/js/materialize.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col s10 m10 offset-s1 l6 offset-m1 offset-l3 margin_center">
            <div class="card grey lighten-2">
                <div class="card-content red white-text">
                    <p class="card-title center-align"><i class="large material-icons">cancel</i><br>404 - Страница не найдена!</p>
                </div>
                <div class="card-content grey lighten-2">
                    <p>
                        Произошла ошибка!
                        <br> Запрошенная страница не существует.
                        <br>
                        <span class="red-text">Это все сведения, которыми мы располагаем.</span>
                    </p>
                </div>
                <div class="card-action">
                    <a class="indigo-text" href="/chat">Вернутся в чат</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
