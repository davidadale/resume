class DomainEqualityTests extends GroovyTestCase {
	
	
	void testResumeSkillLinkEqualsAndCompare(){
		
		Person person = new Person(username:"davidadale")
		
		Resume resume = new Resume(person:person)
		
		ResumeSkillLink link1 = new ResumeSkillLink()
		ResumeSkillLink link2 = new ResumeSkillLink()
		
		assert link1 == link2
		
		link1.resume = resume
		
		assert link1 != link2
		
		link2.resume = resume
		
		assert link1 == link2
		
		Skill skill1 = new Skill(name:"Grails")
		Skill skill2 = new Skill(name:"Java")
		
		link1.skill = skill1
		
		assert link1 != link2
		
		link2.skill = skill1
		
		assert link1 == link2
		assert link1.hashCode() == link2.hashCode()
		
		link2.skill = skill2
		
		assert link1 != link2
		assert link2 != link1
		
		
	}
	
	void testResumeEqualsAndCompare(){
		
		boolean result = false
		
		Person person = new Person(username:"davidadale")
		
		Resume resume1 = new Resume(person:person,name:"Developer")
		Resume resume2 = new Resume(person:person,name:"Developer")
		
		assert resume1 == resume2
		assert resume2 == resume1
		
		Resume resume3 = new Resume(name:"developer")
		
		assert resume1 != resume3
		assert resume3 != resume1
		
		Person person2 = new Person(username:"joetester")
		
		Resume resume4 = new Resume(person:person2,name:"Developer")
		
		resume4 != resume1
		resume4 != resume3
		
		Resume empty1 = new Resume()
		Resume empty2 = new Resume()
		
		empty1 == empty2
		
		int comparison = resume1.compareTo(resume4)
		assert comparison < 0
		
		comparison = resume4.compareTo(resume1)
		assert comparison > 0
		
		comparison = resume1.compareTo( resume2 )
		assert comparison == 0
		
	}

    void testSkillEqualsAndCompareTo() {
		boolean result = false
		
		Skill grails1 = new Skill(name:"Grails")
		Skill grails2 = new Skill(name:"Grails")
		
		result = grails1.equals( grails2 )
		
		assertTrue( result )
		
		result = false
		
		Skill grails3 = new Skill()
		result = grails1.equals( grails3 )
		assertFalse result 
		
		result = false

		result = grails3.equals( grails1 )
		assertFalse result
		
		result = false
		
		Skill grails4 = new Skill(name:"Websphere")
		result = grails1.equals( grails4 )
		assertFalse result
		
		// reverse comparing "Grails" with "Grails", equals
		int comparison = grails1.compareTo( grails2 )
		assertEquals( 0, comparison )
		
		// comparing "Grails" with "Grails", equals
		comparison = grails2.compareTo( grails1 )
		assertEquals( 0, comparison )
		
		// comparing "G" to "W", "G" coming before "W"
		comparison = grails1.compareTo( grails4 )
		assertTrue( comparison < 0 )	
		
		// comparing "W" with "G", "W" coming after "G"
		comparison = grails4.compareTo( grails1 )
		assertTrue( comparison > 0 )
		
		
		// comparing a null with a non null, the null should come before the non null
		comparison = grails3.compareTo( grails4 )
		assertTrue( comparison < 0 )
		
    }
}
