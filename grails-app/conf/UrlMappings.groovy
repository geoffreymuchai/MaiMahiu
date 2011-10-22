class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
//        "/logout/$action?"(controller: "logout")
//        "/login/$action?"(controller: "login")
    }
}
