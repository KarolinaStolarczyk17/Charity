
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="header.jsp" %>
<body>

<section class="login-page">
    <h2>Panel administratora: ${user.login}</h2>

    <a href="/admin/listInstitutions" class="btn btn--large btn--without-border width-33">Zarządzaj fundacjami</a>
    <a href="/admin/listAdmins" class="btn btn--large btn--without-border width-33">Zarządzaj adminami</a>
    <a href="/admin/listUsers" class="btn btn--large btn--without-border width-33">Zarządzaj użytkownikami</a>
</section>

<%--</section>--%>
<%@include file="footer.jsp" %>
<script src="../../resources/js/app.js"></script>
<script src="../../resources/js/form.js" type="text/javascript"></script>
</body>