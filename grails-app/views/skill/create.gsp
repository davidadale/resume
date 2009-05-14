<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Skill</title> 
    </head>
    <body>
        <div class="body">
            <h1>Create Skill</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${skill}">
            <div class="errors">
                <g:renderErrors bean="${skill}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="skillForm" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:skill,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:skill,field:'name')}"/>
							        <script>
										document.forms['skillForm'].name.focus();
									</script>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:skill,field:'description','errors')}">
                                    <g:textArea name="description" value=${skill?.description} cols="60" rows="15"/>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="saveContinue" value="Save and Continue"/></span>
                    <span class="button"><g:actionSubmit class="save" action="save" value="Save and Close" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
