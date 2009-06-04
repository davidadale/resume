
<%@ page import="resume.Award" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Award</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Award List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Award</g:link></span>
        </div>
        <div class="body">
            <h1>Show Award</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:awardInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Awarding Organization:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:awardInstance, field:'awardingOrganization')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Award Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:awardInstance, field:'awardName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Awarded:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:awardInstance, field:'dateAwarded')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Nominated Only:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:awardInstance, field:'nominatedOnly')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Person:</td>
                            
                            <td valign="top" class="value"><g:link controller="person" action="show" id="${awardInstance?.person?.id}">${awardInstance?.person?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${awardInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
