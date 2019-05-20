<?php
// core configuration
include_once "../config/core.php";
 
// check if logged in as admin
include_once "login_checker.php";
 
// include classes
include_once '../config/database.php';
include_once '../objects/fag.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// initialize objects
$fag = new Fag($db);
 
// set page title
$page_title = "Opret ny fag";
 
// include page header HTML
include_once "layout_head.php";

 
echo "<div class='col-md-12'>";

?>
		<form action='read_fag.php/create_fag.php' method='post' id='opret'>
		 
		    <table class='table table-responsive'>
		 
		        <tr>
		            <td class='width-30-percent'>Fag nr.</td>
		            <td><input type='text' name='fag_uid' class='form-control' required value="<?php echo isset($_POST['fag_uid']) ? htmlspecialchars($_POST['fag_uid'], ENT_QUOTES) : "";  ?>" /></td>
		        </tr>
		 
		        <tr>
		            <td>Fag title</td>
		            <td><input type='text' name='fag_title' class='form-control' required value="<?php echo isset($_POST['fag_title']) ? htmlspecialchars($_POST['fag_title'], ENT_QUOTES) : "";  ?>" /></td>
		        </tr>
		 
		        <tr>
		            <td>Start dato</td>
		            <td><input type='date' name='startdato' class='form-control' required value="<?php echo isset($_POST['startdato']) ? htmlspecialchars($_POST['startdato'], ENT_QUOTES) : "";  ?>" /></td>
		        </tr>
		 
		        <tr>
		            <td>Slut dato</td>
		            <td><input type="date" name="enddato" class='form-control' required><?php echo isset($_POST['enddato']) ? htmlspecialchars($_POST['enddato'], ENT_QUOTES) : "";  ?></textarea></td>
		        </tr>		        
		 

		        <!-- uddannelse 'select' field -->
		        <tr>
		            <td>Uddannelse</td>
		            <td>
		            <?php	
		            	//include read uddannels form
						include_once "../dropdown_uddannelse_template.php";
					?>
		            </td>
		        </tr>   

		        <tr>
		            <td></td>
		            <td>
		                <button type="submit" class="btn btn-primary">
		                    <span class="glyphicon glyphicon-plus"></span>Tilføj uddannelse
		                </button>
		            </td>
		        </tr>
		      
		 
		        <tr>
		            <td></td>
		            <td>
		                <button type="submit" class="btn btn-success">
		                    <span class="glyphicon glyphicon-plus"></span> Opret
		                </button>
		            </td>
		        </tr>
		 
		    </table>
		</form>
	<?php
 
echo "</div>";
 
// include page footer HTML
include_once "layout_foot.php";
?>

