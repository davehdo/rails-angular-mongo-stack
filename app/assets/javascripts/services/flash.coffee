services = angular.module("services", [])

flash = services.factory("flash", ($rootScope) ->
	queue = []
	currentMessage = ""

	$rootScope.$on("$routeChangeSuccess", () -> 
		currentMessage = queue.shift() || ""
	)

	{ 
	setMessage: (message) -> queue.push(message)
	getMessage: () -> currentMessage 
	}
)