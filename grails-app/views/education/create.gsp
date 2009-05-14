

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Education</title>
    <link rel="stylesheet" href="${createLinkTo(dir:'js/jquery.ui-1.5.2/themes/flora',file:'flora.datepicker.css')}" />
	<resource:dateChooser />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Education List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Education</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${education}">
            <div class="errors">
                <g:renderErrors bean="${education}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            <g:hiddenField name="person.id" value="${education?.person?.id}"/>
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organization">Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:education,field:'organization','errors')}">
                                    <input type="text" id="organization" name="organization" value="${fieldValue(bean:education,field:'organization')}" size="50"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="courseCompleted">Course Completed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:education,field:'completed','errors')}">
                                    <input type="text" id="courseCompleted" name="courseCompleted" value="${education?.courseCompleted}" size="50"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="completed">Completed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:education,field:'completed','errors')}">
									<richui:dateChooser name="completed" format="MM/dd/yyyy" />
                                </td>
                            </tr> 
                        

                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
