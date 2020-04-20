<?php
	require_once("session.php");
	require_once("included_functions.php");
	require_once("database.php");
  new_header("Here are the ambulances");
	$mysqli = Database::dbConnect();
	$mysqli -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	if (($output = message()) !== null) {
		echo $output;
	}


	//****************  Add Query
	//  Query people to select PersonID, FirstName, and LastName, sorting in ascending order by LastName
	//$query2 ="SELECT * FROM Ambulance";
	$query = "SELECT AmbID, Employees.Lname, Employees.Fname, Employees.EmployeeID FROM Ambulance NATURAL JOIN Employees WHERE Ambulance.AmbID=Employees.Ambulance_AmbID AND Employees.Cert=\"EMT\" GROUP BY Ambulance_AmbID ORDER BY Ambulance_AmbID ASC";
	$query1 = "SELECT AmbID, GROUP_CONCAT(' ', Employees.Lname, ' ', Employees.Fname) AS Lname, GROUP_CONCAT(DISTINCT Employees.Fname) AS Fna, Employees.EmployeeID FROM Ambulance NATURAL JOIN Employees WHERE Ambulance.AmbID=Employees.Ambulance_AmbID AND Employees.Cert=\"Paramedic\" GROUP BY Ambulance_AmbID ORDER BY Ambulance_AmbID ASC";
	$stmt = $mysqli->prepare($query);
	$stmt -> execute();
	$stmt1 = $mysqli->prepare($query1);
	$stmt1 -> execute();
	//$stmt2 = $mysqli->prepare($query2);
	//$stmt2 -> execute();


	//  Prepare and execute query

	if ($stmt && $stmt1) {
		echo "<div class='row'>";
		echo "<center>";
		echo "<h2>Here are the Ambulances</h2>";
		echo "<table>";
		echo "  <thead>";
		echo "    <tr><th>Ambulance ID</th><th></th><th>EMT</th><th></th><th></th><th>Paramedic</th><th></th><th></th></tr>";
		echo "  </thead>";
		echo "  <tbody>";
		while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
			echo "<tr>";
			//Output FirstName and LastName
			$row1 = $stmt1->fetch(PDO::FETCH_ASSOC);
			//$row2 = $stmt2->fetch(PDO::FETCH_ASSOC);
			echo "<td>".$row["AmbID"]."</td>";
			echo "<td><a href='editFinal.php?id=".urlencode($row["AmbID"])."'>Edit</a></</td>";
			echo "<td>". $row["Lname"]." ". $row["Fname"]."</td>";
			echo "<td><a href='editEMT.php?id=".urlencode($row["EmployeeID"])."'>Edit</a></</td>";
			?>
			<td>&nbsp;<a href="deleteEmployees.php?id=<?php echo urlencode($row["EmployeeID"]); ?>" onclick="return confirm('Are you sure?');">Delete</a>&nbsp;&nbsp;</td>
			<?php
			echo "<td>". $row1["Lname"]." ". $row1["Fname"]."</td>";
			echo "<td><a href='editParamedic.php?id=".urlencode($row1["EmployeeID"])."'>Edit</a></</td>";
			?>
			<td>&nbsp;<a href="deleteEmployees.php?id=<?php echo urlencode($row1["EmployeeID"]); ?>" onclick="return confirm('Are you sure?');">Delete</a>&nbsp;&nbsp;</td>
<?php
      echo "<tr>";

			echo "</tr>";
		}
		echo "  </tbody>";
		echo "</table>";
		echo "<br /><br /><a href='createFinal.php'>Add an Ambulance</a> | <a href='createOnly.php'>Add only an Ambulance</a> | <a href='createEMT.php'>Add an EMT</a> | <a href='createParamedic.php'>Add a Paramedic</a>";
		echo "</center>";
		echo "</div>";
	}
	new_footer("Milestone 4 ");
	$stmt -> close();

	Database::dbDisconnect();
 ?>
