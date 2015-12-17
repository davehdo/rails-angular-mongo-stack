receta = angular.module("receta", [
	"templates",
	"ngRoute",
	"controllers",
	"ngResource" # helps angular access the serverside RESTfully
])

receta.config([ "$routeProvider", 
	($routeProvider) ->
		$routeProvider
			.when("/",
				templateUrl: "patients/index.html"
				controller: "PatientsIndexController"
			)
			.when("/patients/:id",
				templateUrl: "patients/show.html"
				controller: "PatientsShowController"
			)

])

controllers = angular.module("controllers", [])

patients = [
	{"id": 1, "name": "Bob"},
	{"id": 2, "name": "Bill"},
	{"id": 3, "name": "John"},
]

controllers.controller("PatientsIndexController", ["$scope", ($scope) -> 
	$scope.patients = patients
])

controllers.controller("PatientsShowController", ["$scope", "$routeParams", ($scope, $routeParams) -> 
	$scope.patients = patients
	$scope.patient = (patients.filter (i) ->
		i.id == parseInt( $routeParams.id))[0]
])