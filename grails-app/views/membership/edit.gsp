
<%@ page import="resume.Membership" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Membership</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Membership List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Membership</g:link></span>
        </div>
        <div class="body">
            <h2>Membership</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${membershipInstance}">
            <div class="errors">
                <g:renderErrors bean="${membershipInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${membershipInstance?.id}" />
                <input type="hidden" name="version" value="${membershipInstance?.version}" />
                <g:hiddenField name="person.id" value="${personId}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organization">Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:membershipInstance,field:'organization','errors')}">
                                    <input type="text" id="organization" name="organization" value="${fieldValue(bean:membershipInstance,field:'organization')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="memberSince">Member Since:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:membershipInstance,field:'memberSince','errors')}">
                                    <g:datePicker name="memberSince" value="${membershipInstance?.memberSince}" precision="month" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Save" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
