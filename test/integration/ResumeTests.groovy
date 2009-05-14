class ResumeTests extends GroovyTestCase {

	void setUp(){
		
		def skills = Skill.list()
		
		if( !skills ){
			for( i in 1..10 ){
				Skill s = new Skill(id:i,name:"Skill${i}",description:"Skill Description")
				if( !s.save() ){
					println s.errors
				}
			}
		}
		
		Person person = Person.findByUsername("davidadale")
		
		if( !person ){
			person = new Person(username:"davidadale", firstName:"David", lastName:"Dale",
			                           email:"d@d.com", phoneNumber:"1231231233",address:"123 Main",
									    city:"New York", state:"NY", zip:"12345")			

			if( !person.save() ){
				person.errors.each(){
					println it
				}
			}										
		}

		
		Resume resume = Resume.get( 1 )
		
		if( !resume ){
			resume = new Resume(id:1, person:person, name:"test", profile:"test" )			
			
			for( i in 1..10){
				Skill skill = Skill.get( i )
				ResumeSkillLink link = new ResumeSkillLink(resume:resume,skill:skill)
				resume.addToSkills( link )
			}

			if( !resume.save(flush:true) ){
				println resume.errors.each(){
					println it
				}
			}

		}
		

	}


	void testSubtractingResumeSkillLinkCollections(){
		
		def ids = [1,5]
		
		Resume resume = Resume.get( 1 )
		
		def selected = ids.collect{ id ->
			Skill skill = Skill.get( id )
			new ResumeSkillLink(resume:resume,skill:skill)
		}
		
		println "selected ${selected}"
		
		assert resume != null
		
		if( resume.skills ){
			println "made it to the resume.skills check inside the test"
			def diff =  resume.skills - selected

			println "diff ${diff}"

			diff?.each(){
				resume.removeFromSkills( it )
			}

		}		
		
		//resume.skills.merge()

		if( !resume.save(flush:true) ){
			fail()
		}
		
		//Resume updatedResume = Resume.get( 1 )
		assert resume.skills.size() == 2
		
	}
}
