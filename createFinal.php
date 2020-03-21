<?php
//Add beginning code to
//1. Require the needed 3 files
//2. Connect to your database
//3. Output a message, if there is one
require_once("session.php");
require_once("included_functions.php");
require_once("database.php");
new_header("Here are the ambulances");
$mysqli = Database::dbConnect();
$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (($output = message()) !== null) {
	echo $output;
}

	echo "<h3>Add to Ambulance</h3>";
	echo "<div class='row'>";
	echo "<label for='left-label' class='left inline'>";

	if (isset($_POST["submit"])) {
		if( (isset($_POST["AmbID"]) && $_POST["AmbID"] !== "") && (isset($_POST["Model"]) && $_POST["Model"] !== "") &&(isset($_POST["County"]) && $_POST["County"] !== "") &&(isset($_POST["Mileage"]) && $_POST["Mileage"] !== "") &&(isset($_POST["InventoryID"]) && $_POST["InventoryID"] !== "")) {
//////////////////////////////////////////////////////////////////////////////////////////////////
					//STEP 2.
					//Create and prepare query to insert information that has been posted
					$query = "INSERT INTO Ambulance (AmbID, Model, County, Mileage, Inventory_ItemID) VALUES(?, ?, ?, ?, ?)";
					$query1 = "INSERT INTO Employees (EmployeeID, Ambulance_AmbID, LName, Fname, Cert) VALUES(?, ?, ?, ?, ?)";
					$query2 = "INSERT INTO Employees (EmployeeID, Ambulance_AmbID, LName, Fname, Cert) VALUES(?, ?, ?, ?, ?)";
					$stmt = $mysqli->prepare($query);
					$stmt1 = $mysqli->prepare($query1);
					$stmt2 = $mysqli->prepare($query2);

					// Execute query
					$stmt -> execute([$_POST["AmbID"], $_POST["Model"], $_POST["County"], $_POST["Mileage"], $_POST["InventoryID"]]);
					$stmt1 -> execute([$_POST["EmployeeID"], $_POST["AmbID"], $_POST["LName"], $_POST["Fname"], "EMT"]);
					$stmt2 -> execute([$_POST["EmployeeID1"], $_POST["AmbID"], $_POST["LName1"], $_POST["Fname1"], "Paramedic"]);

					//Verify $stmt executed - create a SESSION message
					if($stmt && $stmt1 && $stmt2) {
		     		$_SESSION["message"] = $_POST["AmbID"]." has been added";
						$_SESSION["message"] = $_POST["EmployeeID"]." has been added";
						$_SESSION["message"] = $_POST["EmployeeID1"]." has been added";

					//Redirect back to readPeople.php
					redirect("readFinal.php");
					}

//////////////////////////////////////////////////////////////////////////////////////////////////


		}
		else {
				$_SESSION["message"] = "Unable to add Ambulance. Fill in all information!";
				redirect("createFinal.php");
		}
	}
	else {
//////////////////////////////////////////////////////////////////////////////////////////////////
					// STEP 1.  Create a form that will post to this page: createPeople.php
					//
					//          Include <input> tags for each of the attributes in person:
					//                  First Name, Last Name, Birthdate, Birth City, Birth State, Region
					//
					//			Finally, add a submit button - include the class 'tiny round button'
					echo "<center>";
					echo "<form action = 'createFinal.php' method='post'>";
					echo "Ambulance ID:<input type=text name='AmbID'/>";
					echo "Model: <input type = text name = 'Model'/>";
					echo "County:<input type=text name='County'/>";
					echo "Mileage: <input type = text name = 'Mileage'/>";
					echo "Inventory ID:<input type=text name='InventoryID'/>";
					echo "<p><b>EMT</b></p>";
					echo "Employee ID:<input type=text name='EmployeeID'/>";
					echo "Last Name:<input type=text name='LName'/>";
					echo "First Name: <input type = text name = 'Fname'/>";
					echo "<p><b>Paramedic</b></p>";
					echo "Employee ID:<input type=text name='EmployeeID1'/>";
					echo "Last Name:<input type=text name='LName1'/>";
					echo "First Name: <input type = text name = 'Fname1'/>";
					echo "</center>";
					echo "<p><input type = \"submit\" name = \"submit\" value = \"Add Ambulance\" class=\"button tiny round\" />";
					echo "</form>";



//////////////////////////////////////////////////////////////////////////////////////////////////

	}
	echo "</label>";
	echo "</div>";
	echo "<br /><p>&laquo:<a href='readFinal.php'>Back to Main Page</a>";
	?>


<?php
//Define footer with the phrase "Who's Who"
//Release query results
//Close database
new_footer("Add Ambulance ");
$stmt -> close();
Database::dbDisconnect();


 ?>
