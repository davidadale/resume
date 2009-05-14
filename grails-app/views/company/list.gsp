
<%@ page import="resume.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Company List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Company</g:link></span>
        </div>
        <div class="body">
            <h1>Company List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="organizationName" title="Organization Name" />
                        
                   	        <g:sortableColumn property="phoneNumber" title="Phone Number" />
                        
                   	        <g:sortableColumn property="contactName" title="Contact Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${companyInstanceList}" status="i" var="companyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean:companyInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:companyInstance, field:'organizationName')}</td>
                        
                            <td>${fieldValue(bean:companyInstance, field:'phoneNumber')}</td>
                        
                            <td>${fieldValue(bean:companyInstance, field:'contactName')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Company.count()}" />
            </div>
        </div>
		<br/><br/>
    </body>
</html>
