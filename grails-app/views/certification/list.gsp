
<%@ page import="resume.Certification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Certification List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Certification</g:link></span>
        </div>
        <div class="body">
            <h1>Certification List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="certDate" title="Cert Date" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${certificationInstanceList}" status="i" var="certificationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${certificationInstance.id}">${fieldValue(bean:certificationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:certificationInstance, field:'certDate')}</td>
                        
                            <td>${fieldValue(bean:certificationInstance, field:'name')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${certificationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
