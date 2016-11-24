<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Indigo-Chat Register</title>
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
        <form:form class="col s10 offset-s1 m10 offset-m1 l4 offset-l4 grey lighten-4 form_login z-depth-5"
                   commandName="user" modelAttribute="user" method="post">
            <h4 class="center-align">Регистрация</h4>
            <spring:hasBindErrors name="user">
                <div class="card pink lighten-4 form_login error-mess">
                    <div class="card-content red-text text-darken-4">
                        <p>
                            <form:errors path="*"/>
                        <br>
                        </p>
                    </div>
                </div>
            </spring:hasBindErrors>
            <div class="row">
                <div class="input-field col s10 offset-s1">
                    <form:input id="username" name="username" type="text" path="username" class="validate"/>
                    <label class="black-text" for="username">Имя пользователя</label>
                </div>
                <div class="input-field col s10 offset-s1">
                    <form:input path="email" id="email" type="email" name="email" class="validate"/>
                    <label class="black-text" for="email">Email</label>
                </div>
                <div class="input-field col s10 offset-s1">
                    <form:input path="password" id="password" type="password" name="password" class="validate"/>
                    <label class="black-text" for="password">Пароль</label>
                </div>
            </div>
            <div class="row">
                <div class="col s10 offset-s1">
                    <button class="btn waves-effect waves-light indigo" style="display:block; width: 100%;"
                            type="submit">Регистрация
                    </button>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    Уже есть аккаунт?<a href="/login"> Авторизация</a>
                </div>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>