class CollectionOperationTests extends GroovyTestCase{
	
	void testSubtractingResumeSkillLinks(){
		
		def skills = []
		
		for( i in 1..10 ){
			Skill skill = new Skill(name:"Skill${i}")
			skills << skill
		}
		
		Resume resume = new Resume(name:"Developer")
		
		def links = []
		
		for( i in 1..10 ){
			ResumeSkillLink link = new ResumeSkillLink( resume:resume, skill:skills.get( i-1 ) )
			links << link
		}
		
		def selected = []
		
		for(i in [1,5,10]){
			ResumeSkillLink link = new ResumeSkillLink( resume:resume, skill:skills.get( i-1 ) )
			selected << link			
		}
		
		def diff = links - selected
		
		assert diff?.size() == 7
		
	}
	
	
}