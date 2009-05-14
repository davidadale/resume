class JsecUser implements Serializable {
    String username
    String passwordHash

    static constraints = {
        username(nullable: false, blank: false)
    }
}
