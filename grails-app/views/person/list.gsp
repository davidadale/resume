

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Person List</title>
    </head>
    <body>
        <div class="body">
            <h1>Person List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
	        <div class="nav">
	            <span class="menuButton"><g:link class="create" action="create">New Person</g:link></span>
	        </div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="id" title="Id" />
                   	        <g:sortableColumn property="address" title="Address" />
                   	        <g:sortableColumn property="city" title="City" />
                   	        <g:sortableColumn property="email" title="Email" />
                   	        <g:sortableColumn property="firstName" title="First Name" />
                   	        <g:sortableColumn property="lastName" title="Last Name" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personList}" status="i" var="person">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${person.id}">${fieldValue(bean:person, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:person, field:'address')}</td>
                            <td>${fieldValue(bean:person, field:'city')}</td>
                            <td>${fieldValue(bean:person, field:'email')}</td>
                            <td>${fieldValue(bean:person, field:'firstName')}</td>
                            <td>${fieldValue(bean:person, field:'lastName')}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${resume.Person.count()}" />
            </div>
        </div>
		<br/><br/>
    </body>
</html>
