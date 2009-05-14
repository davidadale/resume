

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Project List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Project</g:link></span>
        </div>
        <div class="body">
            <h1>Project List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="dateCompleted" title="Date Completed" />
                        
                   	        <g:sortableColumn property="dateStarted" title="Date Started" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <th>Person</th>
                   	    
                   	        <g:sortableColumn property="titleLine" title="Title Line" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${projectList}" status="i" var="project">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${project.id}">${fieldValue(bean:project, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:project, field:'dateCompleted')}</td>
                        
                            <td>${fieldValue(bean:project, field:'dateStarted')}</td>
                        
                            <td>${fieldValue(bean:project, field:'description')}</td>
                        
                            <td>${fieldValue(bean:project, field:'person')}</td>
                        
                            <td>${fieldValue(bean:project, field:'titleLine')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Project.count()}" />
            </div>
        </div>
    </body>
</html>
