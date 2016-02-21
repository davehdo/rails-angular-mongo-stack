# This class serves as a prototype for rails-style models.
# Merge with angular $resource object to use it
#
# Has defaults methods get({id: 1}), save, query, remove, delete
# and familiar rails model class methods, like .all() .find()
#
# 1. How to use this
# 
# models.factory('Patient', ["$resource", "Model", ($resource, Model) ->
# 	$.extend($resource('/patients/:id', # url
# 		{format: "json"}, # param defaults
# 		{ # custom actions here 
# 			query: {method: "GET", url: "/patients/", isArray: true}, 
# 			update: {method: "PATCH", params: {id: '@_id'}}
# 		}
# 	), Model)
# ])

models = angular.module("models")

# defaults methods are get({id: 1}), save, query, remove, delete
models.value('Model', (() ->
	class 
		# =====  define the rails-inspired model class methods  =====
		@find: (id, success) ->
			success ||= () -> false
			@collection ||= {}
			if @collection[id]
				success( @collection[id] )
				@collection[id]
			else 
				@collection[id] = @get({id: id}, success)
				# return the promise

		@all: (success) ->
			success ||= () -> false
			@collection ||= {}
			if @fetched 
				all = $.map(@collection, (i,j) -> i)
				success(all)
				all
			else 
				@query({}, (array) =>			
					# store for future needs
					$.each( array, (i,g) => @collection[g._id] = g )
					@fetched = true
					success(array)
				)
				# returns the array of promises
	
		@exists: ( id ) ->
			$.grep( @collection || [], (i) -> i._id == id	).length > 1
	
		@collection: undefined
		@fetched: false
)())
