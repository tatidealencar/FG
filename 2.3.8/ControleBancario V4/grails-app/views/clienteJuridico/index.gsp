
<%@ page import="br.ufscar.dc.dsw.ClienteJuridico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clienteJuridico.label', default: 'ClienteJuridico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
                <r:require module="pure-all" />
	</head>
	<body>
		<a href="#list-clienteJuridico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="pure-menu pure-menu-open pure-menu-horizontal">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				 <li>
                       <sec:access controller="clienteJuridico" action='create'>
                        <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                            </sec:access>
                    </li>
                                  
                    <li><g:link controller="logout">Logout</g:link></li>
                                      
			</ul>
		</div>
		<div id="list-clienteJuridico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="pure-table pure-table-bordered">
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'clienteJuridico.nome.label', default: 'Nome')}" />
					
						<th><g:message code="clienteJuridico.endereco.label" default="Endereco" /></th>
					
						<g:sortableColumn property="dtMoradia" title="${message(code: 'clienteJuridico.dtMoradia.label', default: 'Dt Moradia')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'clienteJuridico.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteJuridicoInstanceList}" status="i" var="clienteJuridicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clienteJuridicoInstance.id}">${fieldValue(bean: clienteJuridicoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: clienteJuridicoInstance, field: "endereco")}</td>
					
						<td><g:formatDate date="${clienteJuridicoInstance.dtMoradia}" /></td>
					
						<td>${fieldValue(bean: clienteJuridicoInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteJuridicoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>