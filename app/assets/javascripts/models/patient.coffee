# =============================  models module  ===============================
models = angular.module("models", ["ngResource"])


models.factory('Patient', ["$resource", ($resource) ->
	$resource('/patients/:id', # url
		{}, # param defaults
		{ # custom actions here (defaults are get({id: 1}), save, query, remove, delete)
			query: {method: "GET", params: {id: '@id'}, isArray: true}, 
			update: {method: "PATCH"}
		}
	)
])
