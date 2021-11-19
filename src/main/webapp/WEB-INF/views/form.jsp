
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="header.jsp" %>
<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>
    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

<%--        <form:form method="post" modelattribute="donation">--%>
<%--            <!-- STEP 1: class .active is switching steps -->--%>
<%--            <div data-step="1" class="active">--%>
<%--                <h3>Zaznacz co chcesz oddać:</h3>--%>
<%--                <c:forEach items="${categories}" var="category">--%>
<%--                    <div class="form-group form-group--checkbox">--%>
<%--                        <label>--%>
<%--                            <input id="categoriesTypes" type="checkbox" name="categories" value="${category.id}"/>--%>
<%--                                ${donation.categories.contains(category) ? "checked" : ""}/>--%>
<%--                            <span class="checkbox"></span>--%>

<%--                            <span class="description categoryDescription">${category.name}</span>--%>
<%--                            <form:checkbox path="categories" value="${category.id}"/>--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--                <div class="form-group form-group--buttons">--%>
<%--                    <button type="button" class="btn next-step">Dalej</button>--%>
<%--                </div>--%>
<%--            </div>--%>



        <!-- STEP 1 -->
        <form:form method="post" modelAttribute="donation">
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="checkbox" name="categories" value="${category.id}"
                                ${donation.categories.contains(category) ? "checked" : ""}/>
                            <span class="checkbox"></span>
                            <span class="description categoryDescription">${category.name}</span>
                            <form:checkbox path="categories" value="${category.id}"/>
                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <input id="quantityOfBags" type="number" name="quantity" step="1" min="1"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 3 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <c:forEach items="${institutions}" var="institution">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="institution" value="${institution.id}"
                                ${donation.institution.equals(institution) ? "checked" : ""}/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                                        <div class="title institutionTitle">${institution.name}</div>
                                        <div class="subtitle">${institution.description}</div>
                                    </span>
                            <form:radiobutton path="institution" value="${institution.id}"/>
                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 3 -->
<%--            <div data-step="3">--%>
<%--                <h3>Wybierz organizacje, której chcesz pomóc:</h3>--%>

<%--                <c:forEach items="${institutions}" var="institution">--%>
<%--                    <div class="form-group form-group--checkbox">--%>
<%--                        <label>--%>
<%--                            <input id="institutionNames" type="radio" name="institution" value="${institution.id}"/>--%>
<%--                            <span class="checkbox radio"></span>--%>
<%--                            <span class="description">--%>
<%--                  <div id="selected${institution.id}" class="title">Fundacja ${institution.name}</div>--%>
<%--                  <div class="subtitle">--%>
<%--                    Cel i misja: ${institution.description}--%>
<%--                  </div>--%>
<%--                </span>--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>

<%--                <div class="form-group form-group--buttons">--%>
<%--                    <button type="button" class="btn prev-step">Wstecz</button>--%>
<%--                    <button type="button" class="btn next-step">Dalej</button>--%>
<%--                </div>--%>
<%--            </div>--%>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <input id="formStreet" type="text" name="street"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <input id="formCity" type="text" name="city"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <input id="formPostCode" type="text" name="zipCode"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input id="formPhone" type="phone" name="phone"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <input id="formDate" type="date" name="pickUpDate"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <input id="formTime" type="time" name="pickUpTime"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <textarea id="formPickUpComment" name="more_info" rows="5"></textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step" onclick="finalizingForm()">Dalej</button>
                </div>
            </div>

<%--        Step 5--%>
        <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>
            <div class="summary">
                <div class="form-section">
                    <ul>
                        <li>
                            <span class="icon icon-bag"></span>
                            <span class="summary--text">

                                    <span>Ilość worków z rzeczami które oddajesz: </span>
                                    <span id="summaryQuantity"></span>
                                    <br>
                                    <span>Kategorie: </span>
                                    <span id="summaryThings"></span>
                                </span>
                        </li>
                        <li>
                            <span class="icon icon-hand"></span>
                            <span class="summary--text">Dla fundacji "<span id="summaryInstitution"></span>"</span>
                        </li>
                    </ul>
                </div>
                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru:</h4>
                        <ul>
                            <li><span id="summaryStreet"></span></li>
                            <li><span id="summaryCity"></span></li>
                            <li><span id="summaryZipcode"></span></li>
                        </ul>
                    </div>
                    <div class="form-section--column">
                        <h4>Termin odbioru:</h4>
                        <ul>
                            <li><span id="summaryPickupdate"></span></li>
                            <li><span id="summaryPickuptime"></span></li>
                            <li><span id="summaryPickupcomment"></span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="submit" class="btn">Potwierdzam</button>
            </div>
        </div>
        </form:form>
            <!-- STEP 5 -->
<%--            <div data-step="5">--%>
<%--                <h3>Podsumowanie Twojej darowizny</h3>--%>

<%--                <div class="summary">--%>
<%--                    <div class="form-section">--%>
<%--                        <h4>Oddajesz:</h4>--%>
<%--                        <ul>--%>
<%--                            <li>--%>
<%--                                <span class="icon icon-bag"></span>--%>
<%--                                <span id="finalQuantity" class="summary--text"></span>--%>
<%--                            </li>--%>

<%--                            <li>--%>
<%--                                <span class="icon icon-hand"></span>--%>
<%--                                <span id="institutionName" class="summary--text"></span>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <div class="form-section form-section--columns">--%>
<%--                        <div class="form-section--column">--%>
<%--                            <h4>Adres odbioru:</h4>--%>
<%--                            <ul>--%>
<%--                                <li id="liStreet"></li>--%>
<%--                                <li id="liCity" ></li>--%>
<%--                                <li id="liPostCode"></li>--%>
<%--                                <li id="liPhone"></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>

<%--                        <div class="form-section--column">--%>
<%--                            <h4>Termin odbioru:</h4>--%>
<%--                            <ul>--%>
<%--                                <li id="liData"></li>--%>
<%--                                <li id="liTime"></li>--%>
<%--                                <li id="liComment"></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="form-group form-group--buttons">--%>
<%--                    <button type="button" class="btn prev-step">Wstecz</button>--%>
<%--                    <button type="submit" class="btn">Potwierdzam</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form:form>--%>
<%--    </div>--%>
</section>
<%@include file="footer.jsp" %>
<%--<script>--%>
<%--    let tomorrow = new Date();--%>
<%--    let dd = tomorrow.getDate() + 1;--%>
<%--    let mm = tomorrow.getMonth() + 1; //January is 0 so need to add 1 to make it 1!--%>
<%--    let yyyy = tomorrow.getFullYear();--%>
<%--    if (dd < 10) {--%>
<%--        dd = '0' + dd--%>
<%--    }--%>
<%--    if (mm < 10) {--%>
<%--        mm = '0' + mm--%>
<%--    }--%>
<%--    tomorrow = yyyy + '-' + mm + '-' + dd;--%>
<%--    document.getElementById("formDate").setAttribute("min", tomorrow);--%>
<%--</script>--%>
<script src="../../resources/js/app.js"></script>
<script src="../../resources/js/form.js" type="text/javascript"></script>
</body>