
<%@ page import="resume.Patent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Patent</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Patent List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Patent</g:link></span>
        </div>
        <div class="body">
            <h1>Show Patent</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'number')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Awarded:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'dateAwarded')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Short Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'shortDescription')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Idustry Field:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'idustryField')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Patent Holders:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'patentHolders')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Pending:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:patentInstance, field:'pending')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Person:</td>
                            
                            <td valign="top" class="value"><g:link controller="person" action="show" id="${patentInstance?.person?.id}">${patentInstance?.person?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${patentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
