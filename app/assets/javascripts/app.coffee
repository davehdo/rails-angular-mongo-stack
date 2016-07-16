receta = angular.module("receta", [
	"templates",
	"ngRoute",
	"controllers", # the controllers module is defined in javascripts/controllers/
	"models", # the models module is defined in javascripts/models/
	"ngResource", # helps angular access the serverside RESTfully
	"services"
])

receta.config([ "$routeProvider", 
	($routeProvider) ->
		$routeProvider
			.when("/patients",
				controller: "PatientsIndexController"
				templateUrl: "patients/index.html"
			)
			.when("/patients/new",
				controller: "PatientsNewController"
				templateUrl: "patients/new.html"
			)
			.when("/patients/:id",
				controller: "PatientsShowController"
				templateUrl: "patients/show.html"
			)
			.when("/patients/:id/edit",
				controller: "PatientsEditController"
				templateUrl: "patients/edit.html"
			)
			.otherwise(
				redirectTo: "/patients"
			)
])


# initialize the controllers module
controllers = angular.module("controllers", [])
# in subsequent controller files, put at the top:
# controllers = angular.module("controllers")

models = angular.module("models", ["ngResource"])
# in subsequent model files, put at the top:
# models = angular.module("models")

services = angular.module("services", [])

# turns on token in API requests
receta.config(["$httpProvider", ($httpProvider) ->
	authToken = $("meta[name=\"csrf-token\"]").attr("content")
	$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
])
