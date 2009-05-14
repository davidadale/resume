

<html>
    <head>
        <meta name="layout" content="main" />
        <title>Account Registration</title>         
    </head>
    <body>

        <div class="body">
            <h1>Account Information</h1>
			<h2><em>Registration (step 1 of 2)</em></h2>
            <g:if test="${message}">
            <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${account}">
            <div class="errors">
                <g:renderErrors bean="${account}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="registration" controller="account" method="post" name="accountInfo">
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:account,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:person,field:'username')}"/>
		  							<script>document.forms['accountInfo'].username.focus();</script>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:account,field:'password','errors')}">
                                    <input type="password" id="password" name="password" value="${fieldValue(bean:person,field:'password')}"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="verifiedPassword"><em>Verify</em> Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:account,field:'verifiedPassword','errors')}">
                                    <input type="password" id="verifiedPasword" 
										name="verifiedPassword" value="${fieldValue(bean:account,field:'verifiedPassword')}"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
	                <div class="buttons">
						<g:submitButton name="next" value="Next"/>
	                </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
