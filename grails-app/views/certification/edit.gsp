
<%@ page import="resume.Certification" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Add Certification</title>
        <resource:dateChooser />
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
              <g:hiddenField name="person.id" value="${personId}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Certification:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:certificationInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:certificationInstance,field:'name')}"/>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="certDate">Cert Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:certificationInstance,field:'certDate','errors')}">
                                    <g:datePicker name="certDate" precision="month"  noSelection="['':'-Select-']"  />
                                </td>
                            </tr>

                            

                        </tbody>
                    </table>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Save" /></span>
                </div>
                </div>

            </g:form>
        </div>
    </body>
</html>
