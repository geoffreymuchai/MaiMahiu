<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="styled" />
        <style type="text/css" media="screen">


        </style>
    </head>
  <body>
    <g:if test="${utilityInstance}">
		<h2>${utilityInstance.utility.name}</h2>

		<div class="list">
			<table>
				<thead>
				<tr style="text-align: left">

					%{--<g:sortableColumn property="id" title="${message(code: 'complaint.id.label', default: 'Id')}"/>--}%

					<th><g:message code="complaint.id.label" default="Reference"/></th>
					<th><g:message code="complaint.type.label" default="Type"/></th>

					<th><g:message code="complaint.affects.label" default="Affects Customer"/></th>

					%{--<th><g:message code="complaint.utility.label" default="Utility"/></th>--}%

					%{--<th><g:message code="complaint.source.label" default="Source"/></th>--}%

                    <th>Content</th>

					<th><g:message code="complaint.dateCreated.label" default="Date Reported"/></th>
					
					<th><g:message code="complaint.dateResolved.label" default="Date Resolved"/></th>

                    <th>Status</th>
					%{--<g:sortableColumn property="content"--}%
									  %{--title="${message(code: 'complaint.content.label', default: 'Content')}"/>--}%

				</tr>
				</thead>
				<tbody>
				<g:each in="${complaintInstanceList}" status="i" var="complaintInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

					  <td><g:link action="edit" controller="complaint"
								  id="${complaintInstance.id}">${fieldValue(bean: complaintInstance, field: "ticketNumber")}</g:link></td>
						  <td>${fieldValue(bean: complaintInstance, field: "type")}</td>

						  <td>${fieldValue(bean: complaintInstance, field: "affects")}</td>

						  %{--<td>${fieldValue(bean: complaintInstance, field: "utility")}</td>--}%

						  %{--<td>${fieldValue(bean: complaintInstance, field: "source")}</td>--}%

						  <td>${fieldValue(bean: complaintInstance, field: "content")}</td>

						  <td><g:formatDate format="E, dd-MM-yyyy" date="${complaintInstance?.dateCreated}"/>  </td>

						  <td><g:formatDate format="E, dd-MM-yyyy" date="${complaintInstance?.dateResolved}"/> </td>

						  <td>${fieldValue(bean: complaintInstance, field: "status")}</td>
				  </tr>
				  <tr>
					  <td>
						<span style="font-weight: bold">Comments: </span>
						<ul style="padding-left: 50px; list-style-type: none">
						  <g:each in="${complaintInstance?.comments}" status="c" var="comment">
							<li>${comment} By ${comment.user.name}</li>
						  </g:each>
						</ul>
					  </td>
				  </tr>
						
				</g:each>
				</tbody>
			</table>
		</div>
	</g:if>
  <g:else>
	  No utility's have been registered
  </g:else>
  </body>
</html>