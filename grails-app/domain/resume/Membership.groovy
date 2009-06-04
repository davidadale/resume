package resume

class Membership {

    String organization

    Date memberSince

    Person person

    static belongsTo = Person
    
    static constraints = {
        organization(nullable: true)
        memberSince(nullable: true)
    }
}
