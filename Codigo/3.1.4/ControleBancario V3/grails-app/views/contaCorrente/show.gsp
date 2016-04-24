<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contaCorrente.label', default: 'ContaCorrente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-contaCorrente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <sec:access controller="contaCorrente" action='create'>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </sec:access>
            </ul>
        </div>
        <div id="show-contaCorrente" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="contaCorrente" />
            <g:form resource="${this.contaCorrente}" method="DELETE">
                <fieldset class="buttons">
                    <sec:access controller="contaCorrente" action='create'>
                        <g:link class="edit" action="edit" resource="${this.contaCorrente}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </sec:access>
                    <sec:access controller="contaCorrente" action='delete'>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:access>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>