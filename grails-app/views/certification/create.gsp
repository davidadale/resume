
<%@ page import="resume.Certification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Add Certification</title>
    </head>
    <body>
        
        <div class="body">
            <h2>Certification</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${certificationInstance}">
            <div class="errors">
                <g:renderErrors bean="${certificationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
              <g:hiddenField name="personId" value="${personId}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="certDate">Cert Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:certificationInstance,field:'certDate','errors')}">
                                    <g:datePicker name="certDate" value="${certificationInstance?.certDate}" precision="month" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:certificationInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:certificationInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Add" /></span>
                </div>
                </div>
                
            </g:form>
        </div>
    </body>
</html>
