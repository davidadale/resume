

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Person</title>         
    </head>
    <body>

        <div class="body">
            <h1>Contact Information</h1>
			<h2><em>Registration (step 2 of 2)</em></h2>
            <g:if test="${message}">
            <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${person}">
            <div class="errors">
                <g:renderErrors bean="${person}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="registration" controller="account" method="post" name="userInfo" >
                <div class="dialog">
                    <table>
                        <tbody>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'firstName','errors')}">
                                    <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:person,field:'firstName')}"/>
		  							<script>document.forms['userInfo'].firstName.focus();</script>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'lastName','errors')}">
                                    <input type="text" id="lastName" name="lastName" value="${fieldValue(bean:person,field:'lastName')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'address','errors')}">
                                    <input type="text" id="address" name="address" value="${fieldValue(bean:person,field:'address')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:person,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'state','errors')}">
                                    <input type="text" id="state" name="state" value="${fieldValue(bean:person,field:'state')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip">Zip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'zip','errors')}">
                                    <input type="text" id="zip" name="zip" value="${fieldValue(bean:person,field:'zip')}"/>
                                </td>
                            </tr>
 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'phoneNumber','errors')}">
                                    <input type="text" id="phoneNumber" name="phoneNumber" value="${fieldValue(bean:person,field:'phoneNumber')}"/>
                                </td>
                            </tr>      

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:person,field:'email')}"/>
                                </td>
                            </tr> 

                        </tbody>
                    </table>
	                <div class="buttons">
						<g:submitButton name="quit" value="Complete Later"/> &nbsp;&nbsp;
						<g:submitButton name="finish" value="Finish and Start"/>
	                </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
