<?php
$db_host = 'localhost';
$db_user = 'root';
$db_pass = 'root';
$db_name = 'EMedRec';

// Create connection
$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
// Execute the stored procedure


// Get a patient by ID
if ($_GET['endpoint'] === 'patient') {
  $pid = $_GET['pid'];
  $sql = "CALL getPatientById($pid)";
  $result = $conn->query($sql);
  
  if ($result->num_rows > 0) {
      $patient = $result->fetch_assoc();
      echo json_encode($patient);
  } else {
      echo "Patient not found";
  }
}


$conn->close();
?>
