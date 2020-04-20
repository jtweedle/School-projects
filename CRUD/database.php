<?php
class Database {
  private static $mysqli = null;

  public function __construct() {
    die('Init function error');
  }

  public static function dbConnect() {
	//try connecting to your database
  require_once("/home/jtweedle/DBTweedle.php");
  try{
    $mysqli = new PDO("mysql:host=".DBHOST.";dbname=".DBNAME, USERNAME, PASSWORD);
    echo "Successful Connection";
      return $mysqli;
  } catch(\PDOException $e) {
    echo "Could not connect";
  }
  }

  public static function dbDisconnect() {
    $mysqli = null;
  }
}
?>
