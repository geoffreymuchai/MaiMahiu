
<%@ page import="complaintsystem.Complaint" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'complaint.label', default: 'Complaint')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: complaintInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="complaintType" action="show" id="${complaintInstance?.type?.id}">${complaintInstance?.type?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.affects.label" default="Affects" /></td>
                            
                            <td valign="top" class="value"><g:link controller="customer" action="show" id="${complaintInstance?.affects?.id}">${complaintInstance?.affects?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.utility.label" default="Utility" /></td>
                            
                            <td valign="top" class="value"><g:link controller="utility" action="show" id="${complaintInstance?.utility?.id}">${complaintInstance?.utility?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.source.label" default="Source" /></td>
                            
                            <td valign="top" class="value"><g:link controller="message" action="show" id="${complaintInstance?.source?.id}">${complaintInstance?.source?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.content.label" default="Content" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: complaintInstance, field: "content")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: complaintInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.ticketNumber.label" default="Ticket Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: complaintInstance, field: "ticketNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.resolvedDate.label" default="Resolved Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${complaintInstance?.dateResolved}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="complaint.comments.label" default="Comments" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${complaintInstance.comments}" var="c">
                                    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${complaintInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
