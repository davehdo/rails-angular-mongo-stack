receta = angular.module("receta", [
	"templates",
	"ngRoute",
	"controllers", # the controllers module is defined in javascripts/controllers/
	"models", # the models module is defined in javascripts/models/
	"ngResource" # helps angular access the serverside RESTfully
])

receta.config([ "$routeProvider", 
	($routeProvider) ->
		$routeProvider
			.when("/",
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

])

# turns on token in API requests
receta.config ($httpProvider) ->
	authToken = $("meta[name=\"csrf-token\"]").attr("content")
	$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

#
receta.directive("ngRender", () ->
	restrict: "A"
	templateUrl: "patients/_form.html"
)