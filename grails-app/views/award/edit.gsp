
<%@ page import="resume.Award" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Award</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Award List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Award</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Award</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${awardInstance}">
            <div class="errors">
                <g:renderErrors bean="${awardInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${awardInstance?.id}" />
                <input type="hidden" name="version" value="${awardInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="awardingOrganization">Awarding Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'awardingOrganization','errors')}">
                                    <input type="text" id="awardingOrganization" name="awardingOrganization" value="${fieldValue(bean:awardInstance,field:'awardingOrganization')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="awardName">Award Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'awardName','errors')}">
                                    <input type="text" id="awardName" name="awardName" value="${fieldValue(bean:awardInstance,field:'awardName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAwarded">Date Awarded:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'dateAwarded','errors')}">
                                    <g:datePicker name="dateAwarded" value="${awardInstance?.dateAwarded}" precision="minute" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nominatedOnly">Nominated Only:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'nominatedOnly','errors')}">
                                    <g:checkBox name="nominatedOnly" value="${awardInstance?.nominatedOnly}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:awardInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${resume.Person.list()}" name="person.id" value="${awardInstance?.person?.id}" ></g:select>
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
