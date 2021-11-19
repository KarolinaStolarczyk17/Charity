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
    <h2>Twoje dane: ${user.login}</h2>

    <a href="/profile/editInfo" class="btn btn--large btn--without-border width-33">Edytuj Dane</a>
    <a href="/profile/editPassword" class="btn btn--large btn--without-border width-33">Edytuj Hasło</a>
    <c:choose>
        <c:when test="${user.roles.size()>1}">
            <%--            <a href="/admin/login" class="btn btn--large btn--without-border width-33">Panel administratora</a>--%>
            <a href="/admin/profile" class="btn btn--large btn--without-border width-33">Panel administratora</a>
        </c:when>
    </c:choose>
</section>

<section class="login-page">
    <h2>Lista przekazanych darów</h2>
    <table id="table_id" class="Table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Data Odbioru</th>
            <th>Godzina Odbioru</th>
            <th>Fundacja</th>
            <th>Kategorie</th>
            <th>Ilość Worków</th>
            <th>Miasto</th>
            <th>Ulica</th>
            <th>Kod Pocztowy</th>
            <th>Komentarz</th>
            <th>Status</th>
            <th>Akcje</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${donations}" var="donation">
            <tr>

                <td>${donation.id}</td>
                <td>${donation.pickUpDate}</td>
                <td>${donation.pickUpTime}</td>
                <td>${donation.institution.name}</td>
                <td>
                    <c:forEach items="${donation.categories}" var="category" varStatus="status">
                        ${category.name} <c:if test="${!status.last}"> <br/><br/>  </c:if>
                    </c:forEach>
                </td>
                <td>${donation.quantity}</td>
                <td>${donation.city}</td>
                <td>${donation.street}</td>
                <td>${donation.zipCode}</td>
                <td>${donation.pickUpComment}</td>
                <td><c:choose>
                    <c:when test="${donation.fulfilled == 0}">
                        Niedoręczony
                    </c:when>
                    <c:otherwise>
                        Doręczony
                    </c:otherwise>
                </c:choose>
                </td>

                <td>
                    <ul class="nav--actions datatableUl">
                        <c:choose>
                            <c:when test="${donation.fulfilled == 0}">
                                <a href="/profile/donation/${donation.id}" class="btn btn--without-border active">Potwierdź
                                    odbiór</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/profile/donation/${donation.id}" class="btn btn--without-border active">Odwołaj
                                    odbiór</a>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/donate" class="btn btn--large btn--without-border width-33">Dodaj nowy dar</a>
</section>

<%--<footer>--%>
<%@ include file="footer.jsp" %>
<%--</footer>--%>

</body>
</html>
