
<%@ page import="resume.Training" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Training List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Training</g:link></span>
        </div>
        <div class="body">
            <h1>Training List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="courseTitle" title="Course Title" />
                        
                   	        <g:sortableColumn property="hours" title="Hours" />
                        
                   	        <g:sortableColumn property="dateCompleted" title="Date Completed" />
                        
                   	        <g:sortableColumn property="ongoing" title="Ongoing" />
                        
                   	        <th>Person</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${trainingInstanceList}" status="i" var="trainingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${trainingInstance.id}">${fieldValue(bean:trainingInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:trainingInstance, field:'courseTitle')}</td>
                        
                            <td>${fieldValue(bean:trainingInstance, field:'hours')}</td>
                        
                            <td>${fieldValue(bean:trainingInstance, field:'dateCompleted')}</td>
                        
                            <td>${fieldValue(bean:trainingInstance, field:'ongoing')}</td>
                        
                            <td>${fieldValue(bean:trainingInstance, field:'person')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${trainingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
