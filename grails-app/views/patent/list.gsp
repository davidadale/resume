
<%@ page import="resume.Patent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Patent List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Patent</g:link></span>
        </div>
        <div class="body">
            <h1>Patent List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="number" title="Number" />
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="dateAwarded" title="Date Awarded" />
                        
                   	        <g:sortableColumn property="shortDescription" title="Short Description" />
                        
                   	        <g:sortableColumn property="idustryField" title="Idustry Field" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${patentInstanceList}" status="i" var="patentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${patentInstance.id}">${fieldValue(bean:patentInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:patentInstance, field:'number')}</td>
                        
                            <td>${fieldValue(bean:patentInstance, field:'title')}</td>
                        
                            <td>${fieldValue(bean:patentInstance, field:'dateAwarded')}</td>
                        
                            <td>${fieldValue(bean:patentInstance, field:'shortDescription')}</td>
                        
                            <td>${fieldValue(bean:patentInstance, field:'idustryField')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${patentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
