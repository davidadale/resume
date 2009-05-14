/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author daviddale
 */
class SecurityFilters {
    def filters = {
        // Ensure that all controllers and actions require an authenticated user,
        // except for the "public" controller
        auth(controller: "*", action: "*") {
            before = {
                // Exclude the "public" controller.
                if (controllerName == "public") return true
                if( controllerName == "pdf" ) return true
                if( controllerName == "resume" ) return true
                if( controllerName == "account" ) return true

                accessControl { true }
            }
	}
    }
}

