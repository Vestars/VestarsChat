<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/materialize.css">
    <link rel="stylesheet" href="/static/css/chat.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/static/js/materialize.min.js"></script>
    <title>Indigo Chat</title>
</head>

<body>
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
        <form:form modelAttribute="chat" method="post">
        <div class="col s9 m9 l9">
            <div class="card white">
                <div class="card-content indigo white-text">
                    <p class="center-align" style="font-size:24px;">
                        Чат
                    </p>
                </div>
                <div class="card-content black-text center-box">
                    <table>
                        <tbody>
                        <tr>
                            <td class="left-align green lighten-4 z-depth-3 your-message">
                                Jonathan hdhdfhdfhdfhdfhdf
                                hfhdhfdhhhhhhhhhhhhhhhdhdf
                                hdfhdfhdfhdfhfhdhf<span><sub>&#160;&#160;(data)</sub></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="left-align grey lighten-4 z-depth-3 other-message"><span>имя:</span><br>
                                Jonathan hdhdfhdfhdfhdfhdfhfhdhfdhhhhhhhhhhhhhhhdhdfhdfhdfhdfhdfhfhdhf <span><sub>&#160;(data)</sub></span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="card-action">
                    <div class="input-field">
                        <textarea id="textarea1" class="materialize-textarea" length="240"></textarea>
                        <label for="textarea1">Введите сообщение...</label>
                        <button class="waves-effect waves-light btn indigo left" type="submit" name="action">Отправить
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                    <br>
                    <br>
                </div>
            </div>
        </div>
        </form:form>
        <div class="col s3 m3 l3">
            <div class="card white">
                <div class="card-content indigo white-text">
                    <p class="center-align" style="font-size:24px;">
                        Участники чата
                    </p>
                </div>
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header active"><i class="material-icons">person</i>Создатель</div>
                        <div class="collapsible-body">
                            <p>Lorem ipsum dolor sit amet.</p>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">visibility</i>Онлайн</div>
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
                        <div class="collapsible-header"><i class="material-icons">visibility_off</i>Оффлайн</div>
                        <div class="collapsible-body right-box">
                            <p>Lorem ipsum dolor sit amet.</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</main>
<script>$(document).ready(function(){
    $('.collapsible').collapsible();
});

$(".button-collapse").sideNav();</script>
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
