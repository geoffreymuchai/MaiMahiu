<%@ page import="complaintsystem.Comment" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="comment.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="comment.text.label" default="Text"/></td>

                <td valign="top" class="value">${fieldValue(bean: commentInstance, field: "text")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="comment.complaint.label" default="Complaint"/></td>

                <td valign="top" class="value"><g:link controller="complaint" action="show"
                                                       id="${commentInstance?.complaint?.id}">${commentInstance?.complaint?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="comment.user.label" default="User"/></td>

                <td valign="top" class="value"><g:link controller="shiroUser" action="show"
                                                       id="${commentInstance?.user?.id}">${commentInstance?.user?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="comment.dateCreated.label" default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${commentInstance?.dateCreated}"/></td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${commentInstance?.id}"/>
            <span class="button"><g:actionSubmit class="edit" action="edit"
                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
