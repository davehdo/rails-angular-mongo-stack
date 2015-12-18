# ============================  controllers module  ===========================
controllers = angular.module("controllers", [])


controllers.controller("PatientsIndexController", ["$scope", "Patient", ($scope, Patient) -> 
	$scope.patients ||= Patient.query()
	# while this looks synchronous, what is returned is a "future", an object
	# that will be filled with data when the XHR response returns
])


controllers.controller("PatientsShowController", ["$scope", "$routeParams", "$location", "Patient", ($scope, $routeParams, $location, Patient) -> 
	$scope.patient = Patient.get({ id: $routeParams.id})
])


controllers.controller("PatientsNewController", ["$scope", "$location", "Patient", ($scope, $location, Patient) -> 
	$scope.patient = new Patient
	
	$scope.submitForm = () ->
		$scope.patient.$save(null, () -> # parameters, success, error
			$location.path( "/patients/#{ $scope.patient._id }" )
		) 
])


controllers.controller("PatientsEditController", ["$scope", "$routeParams", "$location", "Patient", ($scope, $routeParams, $location, Patient) -> 
	$scope.patient = Patient.get({ id: $routeParams.id})
		
	$scope.submitForm = () ->
		$scope.patient.$update(null, () -> # parameters, success, error
			$location.path( "/patients/#{ $scope.patient._id }" )
		)
		
	$scope.destroy = () ->
		if confirm("Are you sure you want to delete?")
			$scope.patient.$delete({id: $scope.patient._id}, () ->
				$location.path( "/")
			)
])
