package resume

class Training {

    static constraints = {
        courseTitle(nullable: true)
        hours(nullable: true)
        dateCompleted(nullable: true)
        ongoing(nullable: true)
    }

    static belongsTo = Person

    String trainingOrg

    String courseTitle

    int hours

    Date  dateCompleted

    boolean ongoing

    Person  person



}
