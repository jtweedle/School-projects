<?php
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");
//verify_login();
new_header("Edit Ambulance!");
$mysqli=Database::dbConnect();
$mysqli->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
if (($output = message()) !== null) {
	echo $output;
}
echo "<h3>Edit Ambulance!</h3>";
echo "<div class='row'>";
echo "<label for='left-label' class='left inline'>";
if (isset($_POST["submit"])) {
 		$query = "UPDATE Ambulance SET Model=?,County=?,Mileage=?,Inventory_ItemID=? where AmbID=?";
		$stmt = $mysqli->prepare($query);
		$stmt -> execute([$_POST["Model"], $_POST["County"], $_POST["Mileage"],$_POST["Inventory_ItemID"],$_POST["AmbID"]]);
		if($stmt) {
		     $_SESSION["message"] = "Ambulance".$_POST["AmbID"].""." is changed";
        }

			else {
		    $_SESSION["message"] = "Error changing".$_POST["AmbID"];
			}
       redirect("readFinal.php");

}
	else{
		if(isset($_GET["id"]) && $_GET["id"] !== ""){
			$thisamb=$_GET["id"];
			$query="SELECT * FROM Ambulance WHERE AmbID=?";
			$stmt=$mysqli->prepare($query);
			$stmt->execute([$thisamb]);
			if($stmt){
				$row=$stmt->fetch(PDO::FETCH_ASSOC);
				echo "<h3>".$row["FirstName"]." ".$row["LastName"]."'s Profile</h3>";
				echo "<form action='editFinal.php' method='POST'>";
				echo "<input type='hidden' name='AmbID' value='{$thisamb}'>";
				echo "Mileage:<input type='text' name='Mileage' value='{$row["Mileage"]}'>";
				echo "County:<input type='text' name='County' value='{$row["County"]}'>";
				echo "Model:<input type='text' name='Model' value='{$row["Model"]}'>";
				echo "<input type='hidden' name='Inventory_ItemID' value='{$row["Inventory_ItemID"]}'>";
				echo "<p><input type = 'submit' name = 'submit' value = 'Change' class='button tiny round' >";
        echo "</form>";
			}
		}
	}
echo "<br /><p>&laquo:<a href='readFinal.php'>Back to Main Page</a>";
echo "</label>";
echo "</div>";
new_footer("Update Ambulances ");
$stmt->close();
Database::dbDisconnect();
?>
