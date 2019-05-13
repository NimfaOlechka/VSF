
<?php
include 'config/database.php';
include 'objects/user.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<?php 

$object = new Database();

$object2 = new User($object->getConnection()); 

print_r($object2);
?>
</body>
</html>