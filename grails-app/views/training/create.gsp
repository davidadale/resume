
<%@ page import="resume.Training" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Training</title>
        <resource:dateChooser />
    </head>
    <body>
        
        <div class="body">
            <h2>Create Training</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${trainingInstance}">
            <div class="errors">
                <g:renderErrors bean="${trainingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="courseTitle">Course Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:trainingInstance,field:'courseTitle','errors')}">
                                    <input type="text" id="courseTitle" name="courseTitle" value="${fieldValue(bean:trainingInstance,field:'courseTitle')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hours">Hours:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:trainingInstance,field:'hours','errors')}">
                                    <input type="text" id="hours" name="hours" value="${fieldValue(bean:trainingInstance,field:'hours')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCompleted">Date Completed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:trainingInstance,field:'dateCompleted','errors')}">
                                    <g:datePicker name="dateCompleted" precision="month"  noSelection="['':'-Select-']"  />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ongoing">Ongoing:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:trainingInstance,field:'ongoing','errors')}">
                                    <g:checkBox name="ongoing" value="${trainingInstance?.ongoing}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:trainingInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${resume.Person.list()}" name="person.id" value="${trainingInstance?.person?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="trainingOrg">Training Org:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:trainingInstance,field:'trainingOrg','errors')}">
                                    <input type="text" id="trainingOrg" name="trainingOrg" value="${fieldValue(bean:trainingInstance,field:'trainingOrg')}"/>
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
