
<%@ page import="br.ufscar.dc.dsw.Gerente" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'gerente.label', default: 'Gerente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-gerente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                       <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>

                       <li>
                       <sec:access controller="gerente" action='create'>
                        <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                            </sec:access>
                    </li>
                </ul>
            </div>
            <div id="show-gerente" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list gerente">
                
                <g:if test="${gerenteInstance?.username}">
                    <li class="fieldcontain">
                        <span id="username-label" class="property-label"><g:message code="gerente.username.label" default="Username" /></span>
                        
                        <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${gerenteInstance}" field="username"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.password}">
                    <li class="fieldcontain">
                        <span id="password-label" class="property-label"><g:message code="gerente.password.label" default="Password" /></span>
                        
                        <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${gerenteInstance}" field="password"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.nome}">
                    <li class="fieldcontain">
                        <span id="nome-label" class="property-label"><g:message code="gerente.nome.label" default="Nome" /></span>
                        
                        <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${gerenteInstance}" field="nome"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.rg}">
                    <li class="fieldcontain">
                        <span id="rg-label" class="property-label"><g:message code="gerente.rg.label" default="Rg" /></span>
                        
                        <span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${gerenteInstance}" field="rg"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.CPF}">
                    <li class="fieldcontain">
                        <span id="CPF-label" class="property-label"><g:message code="gerente.CPF.label" default="CPF" /></span>
                        
                        <span class="property-value" aria-labelledby="CPF-label"><g:fieldValue bean="${gerenteInstance}" field="CPF"/></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.agencia}">
                    <li class="fieldcontain">
                        <span id="agencia-label" class="property-label"><g:message code="gerente.agencia.label" default="Agencia" /></span>
                        
                        <span class="property-value" aria-labelledby="agencia-label"><g:link controller="agencia" action="show" id="${gerenteInstance?.agencia?.id}">${gerenteInstance?.agencia?.encodeAsHTML()}</g:link></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.accountExpired}">
                    <li class="fieldcontain">
                        <span id="accountExpired-label" class="property-label"><g:message code="gerente.accountExpired.label" default="Account Expired" /></span>
                        
                        <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${gerenteInstance?.accountExpired}" /></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.accountLocked}">
                    <li class="fieldcontain">
                        <span id="accountLocked-label" class="property-label"><g:message code="gerente.accountLocked.label" default="Account Locked" /></span>
                        
                        <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${gerenteInstance?.accountLocked}" /></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.enabled}">
                    <li class="fieldcontain">
                        <span id="enabled-label" class="property-label"><g:message code="gerente.enabled.label" default="Enabled" /></span>
                        
                        <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${gerenteInstance?.enabled}" /></span>
                        
                    </li>
                </g:if>
                
                <g:if test="${gerenteInstance?.passwordExpired}">
                    <li class="fieldcontain">
                        <span id="passwordExpired-label" class="property-label"><g:message code="gerente.passwordExpired.label" default="Password Expired" /></span>
                        
                        <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${gerenteInstance?.passwordExpired}" /></span>
                        
                    </li>
                </g:if>
                
            </ol>
            <g:form url="[resource:gerenteInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <sec:access controller="gerente" action='edit'>
                        <g:link class="edit" action="edit" resource="${gerenteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        </sec:access>
                        <sec:access controller="gerente" action='delete'>
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:access>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
