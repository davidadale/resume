

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Project</title>
    </head>
    <body>
        <div class="body">
            <h1>Show Project</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">Project Name:</td>

                            <td valign="top" class="value">${fieldValue(bean:project, field:'titleLine')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Company Name:</td>

                            <td valign="top" class="value">${fieldValue(bean:project, field:'companyName')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Date Started:</td>

                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${project?.dateStarted}"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Date Completed:</td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${project?.dateCompleted}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:project, field:'description')}</td>
                            
                        </tr>
                    
                    

                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${project?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><g:actionSubmit class="close" value="Close" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
