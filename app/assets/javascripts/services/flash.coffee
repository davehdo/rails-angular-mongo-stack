services = angular.module("services")

flash = services.factory("flash", ["$rootScope", ($rootScope) ->
	queue = []
	currentMessage = ""

	$rootScope.$on("$routeChangeSuccess", () -> 
		currentMessage = queue.shift() || ""
	)

	{ 
		setMessage: (message) -> queue.push(message)
		currentMessage: (message) -> currentMessage = message
		getMessage: () -> currentMessage 
	}
])