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
		if( (isset($_POST["AmbID"]) && $_POST["AmbID"] !== "") && (isset($_POST["EmployeeID"]) && $_POST["EmployeeID"] !== "") &&(isset($_POST["LName"]) && $_POST["LName"] !== "") &&(isset($_POST["Fname"]) && $_POST["Fname"] !== "")) {
//////////////////////////////////////////////////////////////////////////////////////////////////
					//STEP 2.
					//Create and prepare query to insert information that has been posted
					$query = "INSERT INTO Employees (EmployeeID, Ambulance_AmbID, LName, Fname, Cert) VALUES(?, ?, ?, ?, ?)";
					$stmt = $mysqli->prepare($query);

					// Execute query
					$stmt -> execute([$_POST["EmployeeID"], $_POST["AmbID"], $_POST["LName"], $_POST["Fname"], "EMT"]);

					//Verify $stmt executed - create a SESSION message
					if($stmt) {
		     		$_SESSION["message"] = $_POST["AmbID"]." has been added";

					//Redirect back to readPeople.php
					redirect("readFinal.php");
					}

//////////////////////////////////////////////////////////////////////////////////////////////////


		}
		else {
				$_SESSION["message"] = "Unable to add Ambulance. Fill in all information!";
				redirect("createEMT.php");
		}
	}
	else {
//////////////////////////////////////////////////////////////////////////////////////////////////
					// STEP 1.  Create a form that will post to this page: createPeople.php
					//
					//       	   Include <input> tags for each of the attributes in person:
					//                  First Name, Last Name, Birthdate, Birth City, Birth State, Region
					//
					//			Finally, add a submit button - include the class 'tiny round button'
					echo "<center>";
					echo "<form action = 'createEMT.php' method='post'>";
					//echo "Ambulance ID:<input type=text name='AmbID'/>";
					echo "Select an ambulance:<select name=\"AmbID\">";
					echo "<option></option>";
					$stmt = $mysqli -> prepare("SELECT * FROM Ambulance");
					$stmt -> execute();
					while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
						echo "<option value = '".$row['AmbID']."'>".$row['AmbID']."</option>";
					}
					echo "</select><p />";
					echo "Employee ID:<input type=text name='EmployeeID'/>";
					echo "Last Name:<input type=text name='LName'/>";
					echo "First Name: <input type = text name = 'Fname'/>";
					//echo "Certification:<input type=text name='Cert'/>";
					echo "</center>";
					echo "<p><input type = \"submit\" name = \"submit\" value = \"Add EMT\" class=\"button tiny round\" />";
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
new_footer("Add EMT ");
$stmt -> close();
Database::dbDisconnect();


 ?>
