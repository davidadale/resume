

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Resume Administration</title>
    </head>
    <body>
        <div class="body">
            <h1>Administration</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table cellpadding="5" style="padding-left: 10px;">
                    <tbody>
						<tr>
							<td style="margin-left:10px;"> 
								<p><g:link action="list" controller="company">Companies</g:link></p>
								<p><g:link action="list" controller="person">People</g:link></p>
								<p><g:link action="list" controller="account">Accounts</g:link></p>
								<p><g:link action="list" controller="skill">Skills</g:link></p>
							</td>
							<td>
								<p><g:link action="list" controller="jsecUser">Logins</g:link></p>
							</td>	
						</tr>	
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
