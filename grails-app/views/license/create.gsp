
<%@ page import="resume.License" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ResuME</title>
    </head>
    <body>
        
        <div class="body">
            <h2>License</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${licenseInstance}">
            <div class="errors">
                <g:renderErrors bean="${licenseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
              <g:hiddenField name="personId" value="${personId}" />
                <div class="dialog">
                    <table>
                        <tbody>

                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="licenseName">License Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseInstance,field:'licenseName','errors')}">
                                    <input type="text" id="licenseName" name="licenseName" value="${fieldValue(bean:licenseInstance,field:'licenseName')}"/>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="licensingDate">Licensing Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseInstance,field:'licensingDate','errors')}">
                                    <g:datePicker name="licensingDate" precision="month"  noSelection="['':'-Select-']"  />
                                </td>
                            </tr>                         
                           
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Save" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
