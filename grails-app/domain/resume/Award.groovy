package resume

class Award {

    static belongsTo = Person

    static constraints = {
        awardingOrganization(nullable: true)
        awardName(nullable: true)
        dateAwarded(nullable: true)
        nominatedOnly(nullable: true)
    }
    
    Person person

    String awardingOrganization

    String awardName

    Date   dateAwarded

    boolean nominatedOnly


}
