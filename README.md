# eflap
Projet Blogging "eflap" ft. AngularJS by NGUYEN &amp; OZADANIR

Bonjour et bienvenu dans le README présentant le projet de blog en une seule page pour la promotion AIL 2015 de l'ESIEA. 
Ce readme fait aussi office de manuel d'installation

Ce projet a été concus par : Quang Trung Nguyen et Yasin Ozadanir
Il utilise les technologies suivantes :
	HTML
	AngularJS
	NodeJs
	MySql

Nous détaillerons le projet de la façon suivante 
1 - Arbre du projet
2 - Détail du projet
3 - L'installation

/-------------------------------------------------------------/
1 - Arbre du projet

index.html

logo.png

server.js

test.sql

angular.min.js

css/
--favicon.ico
--main.css

js/
--main.js

partials/
--404.html
--about.html
--addpost.html
--blog.html
--blog_item.html
--chat.html
--home.html
--login.html
--profil.html
--profil.html
--subscribe.html
--userlist.html

templates/
--footer.html
--header.html

views/
--users.html



/-------------------------------------------------------------/
2 - Détail du projet

Le projet repose sur une combinaison entre Angularjs, Nodejs et Mysql pour fonctionner, en s'appuyant sur du HTML

/* AngularJs */
Tout le code AngularsJs est contenu dans js/main.js, detaillons le plus important :
Toutes les fonctions et variables sont détaillées dans les commentaires du code

Deux variables globales sont déclarées au début :
	checkUserName : pour la vérification et la connexion utilisateur
	articleId : pour le choix de l'article à lire
	
L'application permet d'être en une seule page en utilisant la config avec un routeProvider qui redirige et change les pages
	app.config(['$routeProvider', function ($routeProvider) {
		$routeProvider
		[...]
		
  
Le controlleur de la page est 'PageCtrl', nous lui avons donné les fonctions suivantes :
	$interval : pour raffraichir le chat et l'avoir en temps reel, avec la fonction callAtInveral()
	carousel : pour le changement de page
	$http.get('http://localhost:3000/load') : pour avoir la liste des utilisateurs
	$http.get('http://localhost:3000/chat') : pour avoir les informations relatives au chat
	$http.get('http://localhost:3000/article') : pour récupérer les articles et le contenu d'un article en particulier
	$http.get('http://localhost:3000/comments') : pour récupérer les commentaires
	$scope.addContact=function() : pour ajouter un nouvel utilisateur
	$scope.connexionContact=function() : pour la connexion des utilisateurs
	$scope.addChat=function(UserService) : pour ajouter un message au chat, elle prend en entrée l'utilisateur
	$scope.readArticle=function(newId) : pour changer d'article
	$scope.addArticle=function(UserService) : pour ajouter un nouvel article
	$scope.addComment=function(UserService, UserArticleId) : pour ajouter un commentaire
	
/* NodeJs */
Tout le code du serveur nodejs est contenu dans server.js et est detaillé dans les commentaires

Ce code permet d'utiliser des requetes en cross origin
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

Celui ci définit les modalités de connexion à la base de données
var connection = mysql.createConnection({
host : "localhost",
user : "root",
password : "",
database : "test"
});

Plusieurs appels ont été mis en place après et font appel à la base de données :
	app.get('/load',function(req,res) : recuperation des utilisateurs
	app.get('/chat',function(req,res) : recuperation des donnees du chat
	app.get('/article',function(req,res) : recuperation des articles
	app.get('/comments',function(req,res) : recuperation des commentaires
	app.post('/add', bodyParser.json(), function (req, res) : ajoute un utilisateur
	app.post('/addChat', bodyParser.json(), function (req, res) : ajoute une ligne au chat et renvoie les données du chat
	app.post('/addArticle', bodyParser.json(), function (req, res) : ajoute un nouvel article
	app.post('/addComment', bodyParser.json(), function (req, res) : ajoute un nouveau commentaire
	app.post('/checkuser', bodyParser.json(), function (req, res) : verifie si l'utilisateur existe dans la base
	
	
/* MySql */
L'application utilise une base de donnée nommée Test, dans laquelle se trouve les tables suivantes :

article
--id
--title
--author
--date
--content
--summary

chat
--id
--user
--date
--message

commenta
--id
--content
--author
--date
--article_id

users
--id
--username
--password
--first_name
--last_name
--address


/* Html */
Enfin, l'important est d'avoir un index avec le code suivant :

<body ng-app="eflapESIEA">
        <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
            your browser</a> to improve your experience.</p>
        <![endif]-->
		
        <!-- Our Website Content Goes Here -->
        <div ng-include='"templates/header.html"'></div>
        <div ng-view></div>
        <div ng-include='"templates/footer.html"'></div>

pour pouvoir utiliser l'application en mode one page

Ce code fait appel au header et footer dans templates/ et change de page en selectionnant celle correspondante dans partials/


/-------------------------------------------------------------/
3 - L'installation

Pour pouvoir lancer ce projet, il faut :
	Cloner le projet
	Installer nodejs avec le module Express et Mysql
	Installer MySql
	Utiliser un serveur ou une simulation de serveur (Brackets fait parfaitement l'affaire)
	Importer la base Sql contenu dans le fichier "test.sql" dans une base nommée test
	L'application utilise le port 3000, veillez à l'avoir de libre
	Verifier que les informations de connexion à la base de donnée dans server.js sont les bons
	Lancer "node server.js"
	Lancer l'index
	Enjoy
	
