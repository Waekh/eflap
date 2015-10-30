/**
 * Main AngularJS Web Application
 */
var app = angular.module('eflapESIEA', ['ngRoute']);
// app factory (global variable) used for the username and user verification
app.factory('UserService', function() {
return {
  checkUserName : 'anonymous'
};
});
// app factory (global variable) used for to read a specified article
app.factory('UserArticleId', function() {
return {
    articleId : '1'
};
    
});


/**
 * Configure the Routes
 */
app.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    // Home
    .when("/", {templateUrl: "partials/blog.html", controller: "PageCtrl"})
    // Pages
    .when("/home", {templateUrl: "partials/blog.html", controller: "PageCtrl"})
    .when("/profile", {templateUrl: "partials/profil.html", controller: "PageCtrl"})
    .when("/login", {templateUrl: "partials/login.html", controller: "PageCtrl"})
    .when("/subscribe", {templateUrl: "partials/subscribe.html", controller: "PageCtrl"})
    .when("/userlist", {templateUrl: "partials/userlist.html", controller: "PageCtrl"})
    .when("/chat", {templateUrl: "partials/chat.html", controller: "PageCtrl"})
    // Blog
    .when("/blog", {templateUrl: "partials/blog.html", controller: "PageCtrl"})
    .when("/blog/post", {templateUrl: "partials/blog_item.html", controller: "PageCtrl"})
    .when("/blog/add", {templateUrl: "partials/addpost.html", controller: "PageCtrl"})
    // else 404
    .otherwise("/404", {templateUrl: "partials/404.html", controller: "PageCtrl"});
}]);

/**
 * Controls the Blog : We are not using this controller in the current project
 */
app.controller('BlogCtrl', function (/* $scope, $location, $http */) {
  console.log("Blog Controller reporting for duty.");
});

/**
 * Controls all other Pages
 */
app.controller('PageCtrl', function ($scope, $location, $http, UserService, UserArticleId, $interval) 
{
    console.log("Page Controller reporting for duty.");

    $scope.checkUserName = UserService.checkUserName;
    $scope.articleId = UserArticleId.articleId;
    
    // Call the interval to refresh the chat
    $interval(callAtInterval, 1000);
    
    // Get all the data to fill the chat at the given interval
    function callAtInterval() 
    {
        $http.get('http://localhost:3000/chat').
        success(function(data) {
            $scope.chat = data;
        });
    }
    
    // Activates the Carousel
    $('.carousel').carousel({
    interval: 5000
    });

    // Activates Tooltips for Social Links
    $('.tooltip-social').tooltip({
    selector: "a[data-toggle=tooltip]"
    })

    // Get all the data for the user list
    $http.get('http://localhost:3000/load').
        success(function(data) {
            $scope.greeting = data;
        });

    // Get all the data for the chat
    $http.get('http://localhost:3000/chat').
        success(function(data) {
            $scope.chat = data;
        });
    
    // Get all the data for the articles
    $http.get('http://localhost:3000/article').
        success(function(data) {
        	// Get all the article
            $scope.articles = data;
            
            // Search for the article that user has choosen
            var i = 0;
            while (data[i].id != $scope.articleId)
            {
                // console.log(i);
                i++
            }
            // Put that article in a variable
            $scope.theArticle = data[i];
        });
    
    // Get all the data for the articles
    $http.get('http://localhost:3000/comments').
        success(function(data) {
        	// Get all the comment then search which one are for the current article
            $scope.comments = [];
            
            var i = 0;
            var j = 0;
            while (i < data.length)
            {
                // console.log(i);
                if (data[i].article_id == $scope.articleId)
                {
                    $scope.comments[j] = data[i];
                    j++;
                }
                i++;
            }
            
        });
    
    // Function to add a new user
    $scope.addContact=function()
    {
        // Var where are the user data
		var newContact = 
        {
			firstname: $scope.firstname,
			lastname: $scope.lastname,
            address: $scope.address,
            password: $scope.password
		}
        
		// Send the new user to the nodejs server for traitement
		$http.post('http://localhost:3000/add', newContact)
        .then(function(resp)
        {
            
        });
        
        // Free the form
		$scope.firstname = '';
		$scope.lastname = '';
        $scope.address = '';
        $scope.password = '';
        
	}
    
    // Function to check the user data when trying to log in
    $scope.connexionContact=function()
    {
        // Var for the contact
		var checkContact = 
        {
			username: $scope.username,
			password: $scope.password
		}
        
		// Send the user data to the nodejs server for traitement
		$http.post('http://localhost:3000/checkuser', checkContact)
        .then(function(resp)
        {
            // If the user hasn't filed the filled the username field
            if (checkContact.username == "")
            {
                $scope.textCo = "Please enter a username";
            }
            // If the username field is filled, we check if the user exist and if the password match
            else
            {
                if (!!resp.data[0])
                {
                    $scope.connected = resp.data[0];
                    console.log("Got data from database :");

                    if (angular.equals(checkContact.password, resp.data[0].password))
                    {
                        $scope.textCo = "Connection OK";
                        UserService.checkUserName = checkContact.username;
                        $scope.checkUserName = checkContact.username;
                        $scope.username = '';
                    }
                    else
                    {
                        $scope.textCo = "Wrong password";
                    }
                }
                else
                {
                    $scope.textCo = "Username doesn't exist";
                }
            }
            
        });
        
        // Free the form
		$scope.password = '';
        
	}
    
    // Function to add a new line to the chat
    $scope.addChat=function(UserService)
    {
        // Get the date
        var todayDate = new Date();
        
        // Var for the new message
		var newMessage = 
        {
			id: "",
			user: $scope.checkUserName,
            date: todayDate,
            message: $scope.message
		}
        
		// If the user isn't logged, he can't write into the chat
        if (angular.equals($scope.checkUserName,"anonymous"))
        {
            $scope.textCo = "Vous devez etre connecté pour utiliser le chat";
        }
        else
        {
            if ($scope.message != "")
            {
                $scope.textCo = "";
                // We send the newmessage to the nodejs server for traitement
                $http.post('http://localhost:3000/addChat', newMessage)
                .then(function(resp)
                {
                    console.log($scope.chat);
                    $scope.chat = resp.data;
                    console.log($scope.chat);
                });
            }
            else
            {
                $scope.textCo = "You can't send nothing";
            }
        }
        
        // Free the form
        $scope.message = '';
        
	}
    
    $scope.readArticle=function(newId)
    {
        // console.log(newId);
        // console.log(UserArticleId.articleId);
        UserArticleId.articleId = newId;
    }
    
    // Function to add a new article
    $scope.addArticle=function(UserService)
    {
        // Get the date
        var todayDate = new Date();
        
        var cSummary = $scope.summary;
        
        // Var for the new message
		var newArticle = 
        {
			id: "",
			user: $scope.checkUserName,
            date: todayDate,
            title: $scope.title,
            content: $scope.content,
            summary: cSummary
		}
        
		// If the user isn't logged, he can't write into the chat
        if (angular.equals($scope.checkUserName,"anonymous"))
        {
            $scope.textCo = "Vous devez etre connecté pour ecrire un article";
        }
        else
        {
            if ($scope.content == "" || $scope.title == "")
            {
                $scope.textCo = "Un des champs n'est pas rempli";
            }
            else
            {
                // We send the newmessage to the nodejs server for traitement
                $http.post('http://localhost:3000/addArticle', newArticle)
                .then(function(resp)
                {
                    
                });
                
                $scope.textCo = "Article ajouté avec succès";
                // Free the form
                $scope.title = '';
                $scope.content = '';
                $scope.summary = '';
            }
        }
        
	}
    
    // Function to add a new commentary
    $scope.addComment=function(UserService, UserArticleId)
    {
        // Get the date
        var todayDate = new Date();
        
        // Var for the new message
		var newComment = 
        {
			id: "",
			user: $scope.checkUserName,
            date: todayDate,
            content: $scope.commentaryContent,
            article_id: $scope.articleId
		}
        
		// If the user isn't logged, he can't write into the chat
        if (angular.equals($scope.checkUserName,"anonymous"))
        {
            $scope.textCo = "Vous devez etre connecté pour ecrire un commentaire";
        }
        else
        {
            if ($scope.commentaryContent.length < 3)
            {
                $scope.textCo = "Commentaire trop court";
            }
            else
            {
                // We send the newmessage to the nodejs server for traitement
                $http.post('http://localhost:3000/addComment', newComment)
                .then(function(resp)
                {
                    $scope.comments = [];
            
                    var i = 0;
                    var j = 0;
                    while (i < resp.data.length)
                    {
                        // console.log(i);
                        if (resp.data[i].article_id == $scope.articleId)
                        {
                            $scope.comments[j] = resp.data[i];
                            j++;
                        }
                        i++;
                    }
                    
                });
                
                
                // Free the form
                $scope.commentaryContent = '';
                $scope.textCo = 'Commentaire ajouté avec succès';
            }
        }
        
	}
    
});
