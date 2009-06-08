
<%@ page import="resume.Patent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Patent</title>
        <resource:dateChooser />
    </head>
    <body>
       
        <div class="body">
            <h2>Patent</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${patentInstance}">
            <div class="errors">
                <g:renderErrors bean="${patentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${patentInstance?.id}" />
                <input type="hidden" name="version" value="${patentInstance?.version}" />
                <g:hiddenField name="personId" value="${personId}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="number">Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'number','errors')}">
                                    <input type="text" id="number" name="number" value="${fieldValue(bean:patentInstance,field:'number')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'title','errors')}">
                                    <input type="text" id="title" name="title" value="${fieldValue(bean:patentInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAwarded">Date Awarded:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'dateAwarded','errors')}">
                                    <g:datePicker name="dateAwarded" precision="month"  noSelection="['':'-Select-']"  />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shortDescription">Short Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'shortDescription','errors')}">
                                    <input type="text" id="shortDescription" name="shortDescription" value="${fieldValue(bean:patentInstance,field:'shortDescription')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="idustryField">Idustry Field:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'idustryField','errors')}">
                                    <input type="text" id="idustryField" name="idustryField" value="${fieldValue(bean:patentInstance,field:'idustryField')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="patentHolders">Patent Holders:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'patentHolders','errors')}">
                                    <input type="text" id="patentHolders" name="patentHolders" value="${fieldValue(bean:patentInstance,field:'patentHolders')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pending">Pending:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:patentInstance,field:'pending','errors')}">
                                    <g:checkBox name="pending" value="${patentInstance?.pending}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                           
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Save" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
