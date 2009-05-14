<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title>Login</title>
</head>
<body>
    <h1>Welcome to Resume</h1><br/>
	<g:if test="${flash.message}">
	  <div class="message">${flash.message}</div>
	</g:if>

	<g:form action="signIn" name="loginForm">
	  <input type="hidden" name="targetUri" value="${targetUri}" />
		<div class="dialog">
		  <table>
		    <tbody>
		      <tr class="prop">
		        <td class="name">Username:</td>
		        <td class="value"><input type="text" name="username" value="${username}" />
		  		<script>document.forms['loginForm'].username.focus();</script>
		  </td>
		      </tr>
		      <tr class="prop">
		        <td class="name">Password:</td>
		        <td calss="value"><input type="password" name="password" value="" /></td>
		      </tr>
		      <tr class="prop">
		        <td class="name" colspan="2"><br/>Remember me?:
		  	<g:checkBox name="rememberMe" value="${rememberMe}" />
		  </td>
		      </tr>
		    </tbody>
		  </table>

		<p>
		Not currently registered? Register now it's quick and easy.
		<g:link controller="account">Register</g:link>

		</p>
			<div class="buttons" align="right">
				<input type="submit" value="Sign in" />
			</div>
		</div>
	</g:form>


</body>
</html>
