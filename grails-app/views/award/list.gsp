
<%@ page import="resume.Award" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Award List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Award</g:link></span>
        </div>
        <div class="body">
            <h1>Award List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="awardingOrganization" title="Awarding Organization" />
                        
                   	        <g:sortableColumn property="awardName" title="Award Name" />
                        
                   	        <g:sortableColumn property="dateAwarded" title="Date Awarded" />
                        
                   	        <g:sortableColumn property="nominatedOnly" title="Nominated Only" />
                        
                   	        <th>Person</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${awardInstanceList}" status="i" var="awardInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${awardInstance.id}">${fieldValue(bean:awardInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:awardInstance, field:'awardingOrganization')}</td>
                        
                            <td>${fieldValue(bean:awardInstance, field:'awardName')}</td>
                        
                            <td>${fieldValue(bean:awardInstance, field:'dateAwarded')}</td>
                        
                            <td>${fieldValue(bean:awardInstance, field:'nominatedOnly')}</td>
                        
                            <td>${fieldValue(bean:awardInstance, field:'person')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${awardInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
