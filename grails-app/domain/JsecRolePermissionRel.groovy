class JsecRolePermissionRel implements Serializable {

    JsecRole role
    JsecPermission permission
    String target
    String actions

    static constraints = {
        actions(nullable: false, blank: false)
    }
}
