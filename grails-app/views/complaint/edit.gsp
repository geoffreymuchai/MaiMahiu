

<%@ page import="complaintsystem.Complaint" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="styled" />
        <g:set var="entityName" value="${message(code: 'complaint.label', default: 'Complaint')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <uf:resources/>
    </head>
    <body>
        <div class="body">
            <h1>Complaint ${complaintInstance.ticketNumber}</h1>

            <h3>Issue: ${complaintInstance?.content}</h3>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${complaintInstance}">
            <div class="errors">
                <g:renderErrors bean="${complaintInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" class="uniForm">
                <g:hiddenField name="id" value="${complaintInstance?.id}" />
                <g:hiddenField name="version" value="${complaintInstance?.version}" />

                <fieldset>

                %{--<p class="disclaimer">This is an example form formatted with Uni–Form markup and CSS. Submitting it does nothing.</p>--}%
                %{--<div class="ctrlHolder">--}%
                  %{--<label for="name2">Your Name</label>--}%
                  %{--<input type="text" id="name2" name="name2" value="" size="35" class="textInput"/>--}%
                %{--</div>--}%
                %{--<div class="ctrlHolder">--}%
                  %{--<label for="email2">Your E–Mail Address</label>--}%

                  %{--<input type="text" id="email2" name="email2" value="" size="35" class="textInput"/>--}%
                  %{--<p class="formHint">Use a real e–mail address</p>--}%
                %{--</div>--}%
                %{--<div class="ctrlHolder">--}%
                  %{--<label for="subject">Why Are You Contacting Us?</label>--}%
                  %{--<select id="subject" name="subject">--}%
                    %{--<option value="0">Choose one</option>--}%

                    %{--<option value="1">You are awesome</option>--}%
                    %{--<option value="2">You suck</option>--}%
                  %{--</select>--}%
                %{--</div>--}%

                    <div class="ctrlHolder">
                        %{--<td valign="top" class="name">--}%
                                  <label for="type"><g:message code="complaint.type.label" default="Type" /></label>
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'type', 'errors')}">--}%
                                    <g:select name="type.id" from="${complaintsystem.ComplaintType.list()}" optionKey="id" value="${complaintInstance?.type?.id}" noSelection="['null': '']" />
                                %{--</td>--}%
                    </div>

                    <div class="ctrlHolder">

                        <label for="affects"><g:message code="complaint.affects.label" default="Affects" /></label>

                        <g:select disabled="true" name="affects.id" from="${complaintsystem.Customer.list()}" optionKey="id" value="${complaintInstance?.affects?.id}" noSelection="['null': '']" />

                    </div>

                    <div class="ctrlHolder">
                        <label for="status"><g:message code="complaint.status.label" default="Status" /></label>
                        <g:select name="status" from="${complaintInstance.constraints.status.inList}" value="${complaintInstance?.status}" valueMessagePrefix="complaint.status" noSelection="['': '']" />
                    </div>

                    <div class="ctrlHolder">
                        <label for="resolvedDate"><g:message code="complaint.dateResolved.label" default="Resolved Date" /></label>
                        %{--<g:datePicker name="resolvedDate" precision="day" value="${complaintInstance?.dateResolved}" default="none" noSelection="['': '']" />--}%
                        <g:textField name="resolvedDate" value="${complaintInstance?.dateResolved}" disabled="true"/>
                    </div>

                    <div class="ctrlHolder">
                        <label for="content"><g:message code="complaint.content.label" default="Content" /></label>
                        <g:textField disabled="true" name="content" value="${complaintInstance?.content}" />
                    </div>

                </fieldset>
                %{--<div class="dialog">--}%
                    %{--<table>--}%
                        %{--<tbody>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="type"><g:message code="complaint.type.label" default="Type" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'type', 'errors')}">--}%
                                    %{--<g:select name="type.id" from="${complaintsystem.ComplaintType.list()}" optionKey="id" value="${complaintInstance?.type?.id}" noSelection="['null': '']" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="affects"><g:message code="complaint.affects.label" default="Affects" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'affects', 'errors')}">--}%
                                    %{--<g:select name="affects.id" from="${complaintsystem.Customer.list()}" optionKey="id" value="${complaintInstance?.affects?.id}" noSelection="['null': '']" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="utility"><g:message code="complaint.utility.label" default="Utility" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'utility', 'errors')}">--}%
                                    %{--<g:select name="utility.id" from="${complaintsystem.Utility.list()}" optionKey="id" value="${complaintInstance?.utility?.id}" noSelection="['null': '']" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="source"><g:message code="complaint.source.label" default="Source" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'source', 'errors')}">--}%
                                    %{--<g:select name="source.id" from="${complaintsystem.Message.list()}" optionKey="id" value="${complaintInstance?.source?.id}" noSelection="['null': '']" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="content"><g:message code="complaint.content.label" default="Content" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'content', 'errors')}">--}%
                                    %{--<g:textField name="content" value="${complaintInstance?.content}" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="status"><g:message code="complaint.status.label" default="Status" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'status', 'errors')}">--}%
                                    %{--<g:select name="status" from="${complaintInstance.constraints.status.inList}" value="${complaintInstance?.status}" valueMessagePrefix="complaint.status" noSelection="['': '']" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="ticketNumber"><g:message code="complaint.ticketNumber.label" default="Ticket Number" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'ticketNumber', 'errors')}">--}%
                                    %{--<g:textField name="ticketNumber" value="${complaintInstance?.ticketNumber}" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="resolvedDate"><g:message code="complaint.dateResolved.label" default="Resolved Date" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'resolvedDate', 'errors')}">--}%
                                    %{--<g:datePicker name="resolvedDate" precision="day" value="${complaintInstance?.dateResolved}" default="none" noSelection="['': '']" />--}%
                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="comments"><g:message code="complaint.comments.label" default="Comments" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: complaintInstance, field: 'comments', 'errors')}">--}%
                                    %{----}%
%{--<ul>--}%
%{--<g:each in="${complaintInstance?.comments?}" var="c">--}%
    %{--<li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>--}%
%{--</g:each>--}%
%{--</ul>--}%
%{--<g:link controller="comment" action="create" params="['complaint.id': complaintInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>--}%

                                %{--</td>--}%
                            %{--</tr>--}%
                        %{----}%
                        %{--</tbody>--}%
                    %{--</table>--}%
                %{--</div>--}%
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="save" action="resolve" controller="complaint" value="Resolve" /></span>
                    %{--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>--}%
                </div>
            </g:form>
        </div>
    </body>
</html>
