

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Project</title>
        <link rel="stylesheet" href="${createLinkTo(dir:'js/jquery.ui-1.5.2/themes/flora',file:'flora.datepicker.css')}" />
        <script src="${createLinkTo(dir:"js/jquery.ui-1.5.2",file:"jquery-1.2.6.js")}"></script>
        <script src="${createLinkTo(dir:"js/jquery.ui-1.5.2/ui",file:"ui.datepicker.js")}"></script>

    <script>
        $(document).ready(function(){
        $('#dateStarted' ).datepicker();
        $('#dateCompleted' ).datepicker();

    });

    </script>

    </head>
    <body>

        <div class="body">
            <h1>Edit Project</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${project}">
            <div class="errors">
                <g:renderErrors bean="${project}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${project?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="titleLine">Project Name:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'titleLine','errors')}">
                <input type="text" id="titleLine" name="titleLine" value="${fieldValue(bean:project,field:'titleLine')}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="titleLine">Company Name:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'companyName','errors')}">
                <input type="text" id="companyName" name="companyName" value="${fieldValue(bean:project,field:'companyName')}"/>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="dateStarted">Started / Completed:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'dateStarted','errors')}">
                <input type="text" id="dateStarted" name="dateStarted" value="${project?.formattedStartDate}" size="10">
                <input type="text" id="dateCompleted" name="dateCompleted" value="${project?.formattedCompletionDate}" size="10">
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="role">Role:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'role','errors')}">
                <g:select id="role" name="role" from="${project.constraints.role.inList}" value="${project.role}" ></g:select>
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="description">Description:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean:project,field:'description','errors')}">
                <g:textArea name="description" value="${fieldValue(bean:project,field:'description')}" cols="40" rows="15"/>
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
