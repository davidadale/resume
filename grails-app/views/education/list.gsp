

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Education List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Education</g:link></span>
        </div>
        <div class="body">
            <h1>Education List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="id" title="Id" />
                   	        <g:sortableColumn property="organization" title="Organization" />                        
                   	        <g:sortableColumn property="completed" title="Completed" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${educationList}" status="i" var="education">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${education.id}">${fieldValue(bean:education, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:education, field:'organization')}</td>
                            <td>${fieldValue(bean:education, field:'completed')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Education.count()}" />
            </div>
        </div>
    </body>
</html>
