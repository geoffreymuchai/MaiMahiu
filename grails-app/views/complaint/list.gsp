
<%@ page import="complaintsystem.Complaint" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'complaint.label', default: 'Complaint')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'complaint.id.label', default: 'Id')}" />
                        
                            <th><g:message code="complaint.type.label" default="Type" /></th>
                        
                            <th><g:message code="complaint.affects.label" default="Affects" /></th>
                        
                            <th><g:message code="complaint.utility.label" default="Utility" /></th>
                        
                            <th><g:message code="complaint.source.label" default="Source" /></th>
                        
                            <g:sortableColumn property="content" title="${message(code: 'complaint.content.label', default: 'Content')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${complaintInstanceList}" status="i" var="complaintInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${complaintInstance.id}">${fieldValue(bean: complaintInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: complaintInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: complaintInstance, field: "affects")}</td>
                        
                            <td>${fieldValue(bean: complaintInstance, field: "utility")}</td>
                        
                            <td>${fieldValue(bean: complaintInstance, field: "source")}</td>
                        
                            <td>${fieldValue(bean: complaintInstance, field: "content")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${complaintInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
