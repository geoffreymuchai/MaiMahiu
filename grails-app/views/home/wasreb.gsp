<html>
    <head>
        <title>Wasrep Dashboard</title>
        <meta name="layout" content="styled" />
        <style type="text/css" media="screen">


        </style>
    </head>
  <body>
    <h2>Wasreb</h2>
	<table border="0">
	  <tbody>
		<tr>
			<td>
			  <h2>Pending Issues</h2>
				<g:if test="${pendingIssuesInstanceList}">
					  <div class="list">
						<table>
							<thead>
							<tr style="text-align: left">

								%{--<g:sortableColumn property="id" title="${message(code: 'complaint.id.label', default: 'Id')}"/>--}%

								%{--<th><g:message code="complaint.id.label" d/></th>--}%

								<th><g:message code="complaint.ticketnumber.label" default="Ticket Number"/></th>

								<th><g:message code="complaint.type.label" default="Type"/></th>

								<th><g:message code="complaint.affects.label" default="Affects"/></th>

								<th><g:message code="complaint.utility.label" default="Utility"/></th>

								 <th></th>

								<g:sortableColumn property="content"
												  title="${message(code: 'complaint.content.label', default: 'Content')}"/>

							</tr>
							</thead>
							<tbody>
							<g:each in="${pendingIssuesInstanceList}" status="i" var="complaintInstance">
								<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

									%{--<td><g:link action="show" controller="complaint"--}%
												%{--id="${complaintInstance.id}">${fieldValue(bean: complaintInstance, field: "id")}</g:link></td>--}%

									<td>${fieldValue(bean: complaintInstance, field: "ticketNumber")}</td>

									<td>${fieldValue(bean: complaintInstance, field: "type")}</td>

									<td>${fieldValue(bean: complaintInstance, field: "affects")}</td>

									<td>${fieldValue(bean: complaintInstance, field: "utility") ?: "Unclear"}</td>

									<td>${fieldValue(bean: complaintInstance, field: "content")}</td>

									<td><g:link controller="complaint" id="${complaintInstance.id}" action="resolve">Resolve</g:link></td>

								</tr>
							</g:each>
							</tbody>
						</table>
					</div>
				</g:if>
				<g:else>
				  No pending issues
				</g:else>
		  </td>
		</tr>
		<tr>
			<td>
			  <h2>Solved Issues</h2>
			  <g:if test="${solvedIssuesInstanceList}">
				  <div class="list">
					  <table>
						  <thead>
						  <tr style="text-align: left">

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
						  <g:each in="${solvedIssuesInstanceList}" status="i" var="complaintInstance">
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
				No solved issues
			  </g:else>
			</td>
		</tr>
	  </tbody>
	</table>


  </body>
</html>