<?php require_once("included_functions.php"); ?>
<?php
function printPresInfo($p){
 echo "<tr>";
 echo "<td style='text-align:center'>"." ".$p["fname"].$p["mInitial"].$p["lname"]."</td>";
 echo "<td style='text-align:center'>"." ".$p["state"]."</td>";
 echo "<td style='text-align:center'>"." ".$p["party"]."</td>";
 echo "<td style='text-align:center'>"." ".$p["term"]."</td>";
 echo "<td style='text-align:center'>"." ".$p["start"]."</td>";
 echo "<td style='text-align:center'>"." ".$p["end"]."</td>";
 $total=$p["end"]-$p["start"];
 echo "<td style='text-align:center'>"." ".$total."</td>";
 echo "</tr>";
 }
?>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <?php new_header("List of Presidents"); ?>
  <div class="row">
  <label for="left-label" class="left inline">
  <h2>Pick Your President</h2>
  <?php
  $presidents = ["thirtyfour", "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine", "forty", "fortyone",
  "fortytwo", "fortythree", "fortyfour", "fortyfive"];
  $thirtyfour = ["lname" => "Eisenhower", "fname" => "Dwight", "mInitial" => " D. ", "state" => "Kansas",
  "party" => "Republican", "start" => 1953, "end" => 1961, "term" => "42 & 43"];
  $thirtyfive = ["lname" => "Kennedy", "fname" => "John", "mInitial" => " F. ", "state" => "Massachusetts",
  "party" => "Democrat", "start" => 1961, "end" => 1963, "term" => "44"];
  $thirtysix = ["lname" => "Johnson", "fname" => "Lyndon", "mInitial" => " B. ", "state" => "Texas", "party" =>
  "Democrat", "start" => 1963, "end" => 1969, "term" => "44 & 45"];
  $thirtyseven = ["lname" => "Nixon", "fname" => "Richard", "mInitial" => " M. ", "state" => "California",
  "party" => "Republican", "start" => 1969, "end" => 1974, "term" => "46"];
  $thirtyeight = ["lname" => "Ford", "fname" => "Gerald", "mInitial" => " ", "state" => "Michigan", "party" =>
  "Republican", "start" => 1974, "end" => 1977, "term" => "47"];
  $thirtynine = ["lname" => "Carter", "fname" => "Jimmy", "mInitial" => " ", "state" => "Georgia", "party" =>
  "Democrat", "start" => 1977, "end" => 1981, "term" => "48"];
  $forty = ["lname" => "Reagan", "fname" => "Ronald", "mInitial" => " ", "state" => "California", "party" =>
  "Republican", "start" => 1981, "end" => 1989, "term" => "49 & 50"];
  $fortyone = ["lname" => "Bush", "fname" => "George", "mInitial" => " H. ", "state" => "Texas", "party" =>
  "Republican", "start" => 1989, "end" => 1993, "term" => "51"];
  $fortytwo = ["lname" => "Clinton", "fname" => "Bill", "mInitial" => " ", "state" => "Arkansas", "party" =>
  "Democrat", "start" => 1993, "end" => 2001, "term" => "52 & 53"];
  $fortythree = ["lname" => "Bush", "fname" => "George", "mInitial" => " W. ", "state" => "Texas", "party" =>
  "Republican", "start" => 2001, "end" => 2009, "term" => "54 & 55"];
  $fortyfour = ["lname" => "Obama", "fname" => "Barack", "mInitial" => " H. ", "state" => "Illinois", "party" =>
  "Democrat", "start" => 2009, "end" => 2017, "term" => "56 & 57"];
  $fortyfive = ["lname" => "Trump", "fname" => "Donald", "mInitial" => " J. ", "state" => "New York", "party" =>
  "Republican", "start" => 2017, "end" => 2021, "term" => "58"];
  ?>
  <?php
  echo "<table border = '1'>";
  echo "<thead><tr><th>Name</th><th>State</th><th>Party</th><th>Term(s)</th><th>Starting Year</th><th>Ending Year</th><th>Total Years</th></tr></thead>";
  echo "<tbody>";
  if(isset($_POST['ID']) && $_POST['ID'] !== ""){
    printPresInfo(${$_POST['ID']});
}
  echo "</tbody>";
  echo "</table>";
?>
