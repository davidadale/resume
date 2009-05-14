
<%@ page import="resume.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Company</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Company List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Company</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
            <div class="errors">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organizationName">Organization Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:companyInstance,field:'organizationName','errors')}">
                                    <input type="text" id="organizationName" name="organizationName" value="${fieldValue(bean:companyInstance,field:'organizationName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:companyInstance,field:'phoneNumber','errors')}">
                                    <input type="text" id="phoneNumber" name="phoneNumber" value="${fieldValue(bean:companyInstance,field:'phoneNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contactName">Contact Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:companyInstance,field:'contactName','errors')}">
                                    <input type="text" id="contactName" name="contactName" value="${fieldValue(bean:companyInstance,field:'contactName')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
