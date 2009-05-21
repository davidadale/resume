dataSource {
	pooled = false
	driverClassName = "com.mysql.jdbc.Driver"
	username = "resume_user"
	password = "Monday04."
	

}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/resume"
			//dbCreate = "update"
			//driverClassName = "org.hsqldb.jdbcDriver"
			//username = "sa"
			//password = ""
			//url = "jdbc:hsqldb:mem:devDb"			
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			driverClassName = "org.hsqldb.jdbcDriver"
			username = "sa"
			password = ""
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			//url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			url = "jdbc:mysql://localhost/resume"
		}
	}
}
