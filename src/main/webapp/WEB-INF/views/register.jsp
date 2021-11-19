<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="/WEB-INF/views/header.jsp" %>
</head>
<body>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="post" modelAttribute="user">
        <div class="form-group">
            <form:input path="login" type="text" placeholder="Login"/>
        </div>
        <div class="form-group">
            <form:input path="firstName" type="text" placeholder="Imię"/>
        </div>
        <div class="form-group">
            <form:input path="lastName" type="text" placeholder="Nazwisko"/>
        </div>
        <div class="form-group">
            <form:input path="email" type="email" placeholder="Email"/>
        </div>
        <div class="form-group">
            <form:input path="password" type="password" placeholder="Hasło"/>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<%--<footer>--%>
    <%@ include file="footer.jsp" %>
<%--</footer>--%>

</body>
</html>




