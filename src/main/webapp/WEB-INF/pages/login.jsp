<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Indigo-Chat Login</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/static/css/materialize.css">
    <link type="text/css" rel="stylesheet" href="/static/css/sigin.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/static/js/materialize.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<div class="section center"><img src="/static/images/indigo-2.png" width="300" height="50"></div>
<div class="container">
    <div class="row">
        <c:url value="/j_spring_security_check" var="loginUrl" />
        <form class="col s10 offset-s1 m10 offset-m1 l4 offset-l4 grey lighten-4 form_login z-depth-5" method="post" action="${loginUrl}">
            <h4 class="center-align">Авторизация</h4>
            <c:if test="${param.error != null}">
                <div class="card pink lighten-4 form_login error-mess">
                    <div class="card-content red-text text-darken-4"><p>Неверный логин или пароль</p></div>
                </div>
            </c:if>
            <div class="row">
                <div class="input-field col s10 offset-s1">
                    <input id="username" type="text" name="username" class="validate">
                    <label class="black-text" for="username">Имя пользователя</label>
                </div>
                <div class="input-field col s10 offset-s1">
                    <input id="password" type="password" name="password" class="validate">
                    <label  class="black-text" for="password">Пароль</label>
                    <div class="col s8 push-s6 m8 push-m8 l6 push-l7">
                        <a href="/forgot-password">Забыли пароль?</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s10 offset-s1">
                    <button class="btn waves-effect waves-light indigo" style="display:block; width: 100%;" type="submit" name="action">Войти</button>
                </div>
            </div>
            <div class="row">
                <div class="col s10 offset-s1 m8 offset-m2 l10 offset-l1">
                    Нет аккаунта?<a href="/register"> Регистрация</a>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</div>
</body>
</html>