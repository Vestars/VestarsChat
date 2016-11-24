<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Indigo Chat Login</title>
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
                <div class="card-content green white-text">
                    <p class="card-title center-align"><i class="large material-icons">done_all</i><br>Регистрация выполнена успешно!</p>
                </div>
                <div class="card-content grey lighten-2">
                    <p>
                        Уважаемый(-ая) <b>${username}</b>.
                        <br>
                        На вашу почту <b>${email}</b> было отправленно письмо с подтвержеднием регистрации. Что бы закончить ее, нужно перейти по ссылке в письме.
                    </p>
                </div>
                <div class="card-action">
                    <a class="indigo-text" href="/login">Авторизация</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>