<%@ page import="complaintsystem.Comment" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${commentInstance}">
        <div class="errors">
            <g:renderErrors bean="${commentInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="text"><g:message code="comment.text.label" default="Comment"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'text', 'errors')}">
                        <g:textArea cols="100" rows="3" name="text" value="${commentInstance?.text}"/>
                    </td>
                </tr>

                <g:hiddenField name="complaint.id" value="${commentInstance?.complaint?.id}"/>

                %{--<tr class="prop">--}%
                    %{--<td valign="top" class="name">--}%
                        %{--<label for="complaint"><g:message code="comment.complaint.label" default="Complaint"/></label>--}%
                    %{--</td>--}%
                    %{--<td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'complaint', 'errors')}">--}%
                        %{--<g:select name="complaint.id" from="${complaintsystem.Complaint.list()}" optionKey="id"--}%
                                  %{--value="${commentInstance?.complaint?.id}"/>--}%
                    %{--</td>--}%
                %{--</tr>--}%

                %{--<tr class="prop">--}%
                    %{--<td valign="top" class="name">--}%
                        %{--<label for="user"><g:message code="comment.user.label" default="User"/></label>--}%
                    %{--</td>--}%
                    %{--<td valign="top" class="value ${hasErrors(bean: commentInstance, field: 'user', 'errors')}">--}%
                        %{--<g:select name="user.id" from="${complaintsystem.ShiroUser.list()}" optionKey="id"--}%
                                  %{--value="${commentInstance?.user?.id}"/>--}%
                    %{--</td>--}%
                %{--</tr>--}%

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save"
                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
