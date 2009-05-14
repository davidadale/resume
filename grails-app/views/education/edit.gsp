

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Education</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Education List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Education</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Education</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${education}">
            <div class="errors">
                <g:renderErrors bean="${education}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${education?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organization">Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:education,field:'organization','errors')}">
                                    <input type="text" id="organization" name="organization" value="${fieldValue(bean:education,field:'organization')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="courseCompleted">Course Completed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:education,field:'completed','errors')}">
                                    <input type="text" size="10" id="courseCompleted" name="courseCompleted" value="${education?.courseCompleted}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="completed">Completed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:education,field:'completed','errors')}">
                                    <input type="text" size="10" id="completed" name="completed" value="${education?.completed}"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
