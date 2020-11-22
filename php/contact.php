<!DOCTYPE html>
<html>
<head>
<title>Formulaire de contact</title>
  <meta charset="UTF-8">
</head>

<body>
	<?php
//Connection Bdd
try {
	$bdd = new PDO('mysql:host=localhots:8282; dbname=test; charaset=utf8', 'root', 'test') // d'aprés docker-compose.yml
	
} 
catch (Exception $e) {
	die('Erreur : '.$e->getMessage());
}
?>
<form id="contact" method="post" action="traitement_formulaire.php">
	<fieldset><legend>Fom</legend>
		<p><label for="firstname">Nom :</label><input type="text" id="firstname" name="firstname" /></p>
		<p><label for="lastname">lastname :</label><input type="text" id="lastname" name="lastname" /></p>
		<p><label for="email">Email :</label><input type="text" id="email" name="email" /></p>
	</fieldset>
 
	<fieldset><legend>Votre message :</legend>
		<p><label for="objet">Objet :</label><input type="text" id="objet" name="objet" /></p>
		<p><label for="message">Message :</label><textarea id="message" name="message" cols="30" rows="8"></textarea></p>
	</fieldset>
 
	<div style="text-align:center;"><input type="submit" name="envoi" value="Envoyer le formulaire !" /></div>
</form>
</body>

</html>
