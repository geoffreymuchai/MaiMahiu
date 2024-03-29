

<%@ page import="complaintsystem.Complaint" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'complaint.label', default: 'Complaint')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${complaintInstance}">
            <div class="errors">
                <g:renderErrors bean="${complaintInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="complaint.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'type', 'errors')}">
                                    <g:select name="type.id" from="${complaintsystem.ComplaintType.list()}" optionKey="id" value="${complaintInstance?.type?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="affects"><g:message code="complaint.affects.label" default="Affects" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'affects', 'errors')}">
                                    <g:select name="affects.id" from="${complaintsystem.Customer.list()}" optionKey="id" value="${complaintInstance?.affects?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="utility"><g:message code="complaint.utility.label" default="Utility" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'utility', 'errors')}">
                                    <g:select name="utility.id" from="${complaintsystem.Utility.list()}" optionKey="id" value="${complaintInstance?.utility?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source"><g:message code="complaint.source.label" default="Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'source', 'errors')}">
                                    <g:select name="source.id" from="${complaintsystem.Message.list()}" optionKey="id" value="${complaintInstance?.source?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="content"><g:message code="complaint.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'content', 'errors')}">
                                    <g:textField name="content" value="${complaintInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="complaint.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${complaintInstance.constraints.status.inList}" value="${complaintInstance?.status}" valueMessagePrefix="complaint.status" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ticketNumber"><g:message code="complaint.ticketNumber.label" default="Ticket Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'ticketNumber', 'errors')}">
                                    <g:textField name="ticketNumber" value="${complaintInstance?.ticketNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="resolvedDate"><g:message code="complaint.resolvedDate.label" default="Resolved Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'dateResolved', 'errors')}">
                                    <g:datePicker name="dateResolved" precision="day" value="${complaintInstance?.dateResolved}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
