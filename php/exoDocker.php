<!DOCTYPE html>
<html>
<head>
	<title>Exo Docker</title>
</head>
<body>
Bienvenue sur l'applicaiton d'affichage de données
<?php
//Connection Bdd
try {
	$bdd = new PDO('mysql:host=localhots:8282; dbname=test; charaset=utf8', 'root', 'test') // d'aprés docker-compose.yml
	
} 
catch (Exception $e) {
	die('Erreur : '.$e->getMessage());
}
?>
<!-- Creation d'un utilisateur persitant-->
	  <form method="post" >
      Nom: <input type="text" name="firstname" placeholder="Entrez votre nom" /><br />
      Prenom: <input type="text" name="firstname" placeholder="Entrez votre nom" /><br />
      Password: <input type="password" name="firstname" placeholder="Entrez votre nom" /><br />
      Email:<input type="text" name="email" placeholder="Entrez votre nom" /><br />
      <input type="submit" value="Submit" />
    </form>

<!-- Lister les Utilisateur stockés en base de donné-->
<!-- SELECT * FROM Users AS u , Contacts c WHERE u.email = c.user_email -->

</body>
</html>