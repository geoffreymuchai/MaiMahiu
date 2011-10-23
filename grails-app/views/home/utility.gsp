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
				<tr>

					%{--<g:sortableColumn property="id" title="${message(code: 'complaint.id.label', default: 'Id')}"/>--}%

					%{--<th><g:message code="complaint.id.label" d/></th>--}%
					<th><g:message code="complaint.type.label" default="Type"/></th>

					<th><g:message code="complaint.affects.label" default="Affects"/></th>

					<th><g:message code="complaint.utility.label" default="Utility"/></th>

					<th><g:message code="complaint.source.label" default="Source"/></th>

					<g:sortableColumn property="content"
									  title="${message(code: 'complaint.content.label', default: 'Content')}"/>

				</tr>
				</thead>
				<tbody>
				<g:each in="${complaintInstanceList}" status="i" var="complaintInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						%{--<td><g:link action="show" controller="complaint"--}%
									%{--id="${complaintInstance.id}">${fieldValue(bean: complaintInstance, field: "id")}</g:link></td>--}%

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
	</g:if>
  <g:else>
	  No utility's have been registered
  </g:else>
  </body>
</html>