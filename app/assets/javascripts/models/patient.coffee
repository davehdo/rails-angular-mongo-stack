# =============================  models module  ===============================
models = angular.module("models", ["ngResource"])

# defaults methods are get({id: 1}), save, query, remove, delete
models.factory('Patient', ["$resource", "Model", ($resource, Model) ->
	$.extend($resource('/patients/:id', # url
		{format: "json"}, # param defaults
		{ # custom actions here 
			query: {method: "GET", url: "/patients/", isArray: true}, 
			update: {method: "PATCH", params: {id: '@_id'}}
		}
	), Model)
])