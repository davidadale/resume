
<%@ page import="resume.Training" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Training</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Training List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Training</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Training</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${trainingInstance}">
            <div class="errors">
                <g:renderErrors bean="${trainingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${trainingInstance?.id}" />
                <input type="hidden" name="version" value="${trainingInstance?.version}" />
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
                                    <g:datePicker name="dateCompleted" value="${trainingInstance?.dateCompleted}" precision="minute" noSelection="['':'']"></g:datePicker>
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
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
