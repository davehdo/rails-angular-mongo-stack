receta = angular.module("receta", [
	"templates",
	"ngRoute",
	"controllers", # the controllers module is defined below
	"models", # the models module is defined below
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

# =============================  models module  ===============================
models = angular.module("models", ["ngResource"])

models.factory('Patient', ["$resource", ($resource) ->
	$resource('/patients/:id', {}, {
		query: {method: "GET", params: {_id: '@id'}, isArray: true}
	})
	# class Patient
	# 	constructor: (taskListId) ->
	# 		@service = $resource('/patients/:id',
	# 			{task_list_id: taskListId, id: '@id'})
	# 
	# 	create: (attrs) ->
	# 		new @service(task: attrs).$save (task) ->
	# 			attrs.id = task.id
	# 		attrs
	# 
	# 	all: ->
	# 		@service.query()
])

# ============================  controllers module  ===========================
controllers = angular.module("controllers", [])

controllers.controller("PatientsIndexController", ["$scope", "Patient", ($scope, Patient) -> 
	$scope.patients = Patient.query()
	# while this looks synchronous, what is returned is a "future", an object
	# that will be filled with data when the XHR response returns
])

controllers.controller("PatientsShowController", ["$scope", "$routeParams", "Patient", ($scope, $routeParams, Patient) -> 
	$scope.patients = Patient.query()
	
	$scope.patient = Patient.get({ _id: $routeParams.id})
])