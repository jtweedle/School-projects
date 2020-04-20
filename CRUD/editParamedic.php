<?php
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");
//verify_login();
new_header("Update Paramedic!");
$mysqli=Database::dbConnect();
$mysqli->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
if (($output = message()) !== null) {
	echo $output;
}
echo "<h3>Update Paramedic!</h3>";
echo "<div class='row'>";
echo "<label for='left-label' class='left inline'>";
if (isset($_POST["submit"])) {
 		$query = "UPDATE Employees SET Ambulance_AmbID=?,Lname=?,Fname=?,Cert=? where EmployeeID=?";
		$stmt = $mysqli->prepare($query);
		$stmt -> execute([$_POST["Ambulance_AmbID"],$_POST["Lname"], $_POST["Fname"],$_POST["Cert"],$_POST["EmployeeID"]]);
		if($stmt) {
		     $_SESSION["message"] = $_POST["Fname"]." ".$_POST["Lname"].""." is updated";
        }

			else {
		    $_SESSION["message"] = "Error updating".$_POST["Fname"].$_POST["Lname"];
			}
       redirect("readFinal.php");

}
	else{
		if(isset($_GET["id"]) && $_GET["id"] !== ""){
			$thisemt=$_GET["id"];
			$query="SELECT * FROM Employees WHERE EmployeeID=?";
			$stmt=$mysqli->prepare($query);
			$stmt->execute([$thisemt]);
			if($stmt){
				$row=$stmt->fetch(PDO::FETCH_ASSOC);
				echo "<h3>".$row["FirstName"]." ".$row["LastName"]."'s Profile</h3>";
				echo "<form action='editEMT.php' method='POST'>";
				echo "<input type='hidden' name='EmployeeID' value='{$thisemt}'>";
        echo "<input type='hidden' name='Ambulance_AmbID' value='{$row["Ambulance_AmbID"]}'>";
				echo "Last Name:<input type='text' name='Lname' value='{$row["Lname"]}'>";
				echo "First Name:<input type='text' name='Fname' value='{$row["Fname"]}'>";
				echo "Certification:<input type='text' name='Cert' value='{$row["Cert"]}'>";
				echo "<p><input type = 'submit' name = 'submit' value = 'Change' class='button tiny round' >";
        echo "</form>";
			}
		}
	}
echo "<br /><p>&laquo:<a href='readFinal.php'>Back to Main Page</a>";
echo "</label>";
echo "</div>";
new_footer("Update Paramedic ");
$stmt->close();
Database::dbDisconnect();
?>
