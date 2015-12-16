receta = angular.module("receta", [
	"templates",
	"ngRoute",
	"controllers"
])

receta.config([ "$routeProvider", 
	($routeProvider) ->
		$routeProvider
			.when("/",
				templateUrl: "patients/index.html"
				controller: "PatientsController"
			)

])

controllers = angular.module("controllers", [])
controllers.controller("PatientsController", ["$scope", ($scope) -> true
])