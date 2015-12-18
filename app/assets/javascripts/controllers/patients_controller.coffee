# ============================  controllers module  ===========================
controllers = angular.module("controllers", [])

controllers.controller("PatientsIndexController", ["$scope", "Patient", ($scope, Patient) -> 
	$scope.patients ||= Patient.query()
	# while this looks synchronous, what is returned is a "future", an object
	# that will be filled with data when the XHR response returns
])

controllers.controller("PatientsShowController", ["$scope", "$routeParams", "Patient", ($scope, $routeParams, Patient) -> 
	# $scope.patients ||= Patient.query()
	$scope.patient = Patient.get({ id: $routeParams.id})
])

controllers.controller("PatientsNewController", ["$scope", "Patient", ($scope, Patient) -> 
	$scope.patient = new Patient
	
])

controllers.controller("PatientsEditController", ["$scope", "$routeParams", "Patient", ($scope, $routeParams, Patient) -> 
	$scope.patient = Patient.get({ id: $routeParams.id})
])