<%@ page import="complaintsystem.Utility" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="styled"/>
    <g:set var="entityName" value="${message(code: 'utility.label', default: 'Utility')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'utility.id.label', default: 'Id')}"/>

                <g:sortableColumn property="name" title="${message(code: 'utility.name.label', default: 'Name')}"/>

                <g:sortableColumn property="location"
                                  title="${message(code: 'utility.location.label', default: 'Location')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${utilityInstanceList}" status="i" var="utilityInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${utilityInstance.id}">${fieldValue(bean: utilityInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: utilityInstance, field: "name")}</td>

                    <td>${fieldValue(bean: utilityInstance, field: "location")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${utilityInstanceTotal}"/>
    </div>
</div>
</body>
</html>
