<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Indigo Create New Chat</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/static/css/materialize.css">
    <link type="text/css" rel="stylesheet" href="/static/css/chat.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/static/js/materialize.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<header>
    <nav class="top-nav indigo">
        <div class="container">
            <a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only"><i
                    class="material-icons">menu</i></a>
            <div class="nav-wrapper">
                <img class="responsive-img center-align" src="/static/images/indigo-2.png">
            </div>
        </div>
    </nav>
</header>
<main>
    <ul id="nav-mobile" class="side-nav fixed">
        <li>
            <div class="userView">
                <div class="background" style="margin-bottom: -18px;">
                    <img src="/static/images/background-chat.jpg">
                </div>
                <div class="row">
                    <div class="col s10 m10 l10 pull-s1 pull-m1 pull-l1">
                        <span class="white-text name" style="margin-left:10px;"><h5>${username}</h5></span>
                    </div>
                </div>
            </div>
        </li>
        <li><a class="waves-effect" href="/chat"><i class="material-icons">polymer</i>Главная страница</a></li>
        <li><a class="waves-effect" href="/new-chat"><i class="material-icons">chat</i>Чаты</a></li>
        <li><a class="waves-effect" href="/friends"><i class="material-icons">supervisor_account</i>Друзья</a></li>
        <li><a class="waves-effect" href="/settings"><i class="material-icons">settings</i>Настройки</a></li>
        <li>
            <c:url value="/logout" var="logoutUrl" />
            <a class="waves-effect" href="${logoutUrl}"><i class="material-icons">power_settings_new</i>Выход</a>
        </li>
    </ul>
    <div class="row">
        <div class="col s6 m6 l6">
                <div class="card white">
                    <div class="card-content indigo white-text">
                        <p class="center-align" style="font-size:24px;">
                            Все чаты
                        </p>
                    </div>
                    <ul class="collapsible" data-collapsible="accordion">
                        <li>
                            <div class="collapsible-header active"><i class="material-icons">person</i>Ваши чаты</div>
                            <div class="collapsible-body">
                                <p>Lorem ipsum dolor sit amet.</p>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">visibility</i>Все открытые чаты</div>
                            <div class="collapsible-body right-box">
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                                <p>Lorem ipsum dolor sit amet.</p>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">visibility_off</i>Все приватные чаты</div>
                            <div class="collapsible-body right-box">
                                <p>Lorem ipsum dolor sit amet.</p>
                            </div>
                        </li>
                    </ul>
                </div>
        </div>
        <div class="col s6 m6 l6">
            <form:form modelAttribute="chat" method="post">
                <div class="card white">
                    <div class="card-content indigo white-text">
                        <p class="center-align" style="font-size:24px;">
                            Создать чат
                        </p>
                    </div>
                    <div class="card-content black-text">
                        <spring:hasBindErrors name="chat">
                            <div class="card pink lighten-4 form_login error-mess">
                                <div class="card-content red-text text-darken-4">
                                    <p>
                                        <form:errors path="*"/>
                                        <br>
                                    </p>
                                </div>
                            </div>
                        </spring:hasBindErrors>
                        <div class="input-field">
                            <form:input id="name" name="name" type="text" path="name" cssClass="validate"/>
                            <label for="name">Имя чата</label>
                        </div>
                            <form:input id="creator" name="creator" type="text" path="creator" cssClass="hide" value="${username}"/>
                        <p>
                            Тип чата:
                            <br>
                            <form:radiobutton cssClass="with-gap" path="type" value="publ" id="type1"/>
                            <label for="type1">Открытый</label>
                        </p>
                        <p>
                            <form:radiobutton cssClass="with-gap" path="type" value="priv" id="type2"  />
                            <label for="type2">Приватный</label>
                        </p>
                    </div>
                    <div class="card-action">
                        <button class="waves-effect waves-light btn indigo left" type="submit" name="action">Создать</button>
                        <br>
                        <br>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</main>
<script>$(".button-collapse").sideNav();</script>
<footer class="page-footer indigo" style="padding-top: 0px;">
    <div class="footer-copyright indigo">
        <div class="container">
            Powered by Vestars
            <a class="grey-text text-lighten-4 right" href="https://github.com/Vestars">GitHub</a>
            <a class="grey-text text-lighten-4 right" href="https://ua.linkedin.com/in/d-voronin">LinkedIn &#160; &#160; &#160;</a>
        </div>
    </div>
</footer>
</body>
</html>
