<?php
// Database connection details
$hostname = "localhost"; 
$username = "scott"; 
$password = "tiger";  
$dbname = "user"; 

// Establishing the Oracle connection
$conn = oci_connect($username, $password, "//$hostname/$dbname");

// Check the connection
if (!$conn) {
    $e = oci_error();
    die("Connection failed: " . $e['message']);
} else {
    // Connection successful
    echo "Connected to Oracle database successfully!";
}

// Close the connection
oci_close($conn);
?>
