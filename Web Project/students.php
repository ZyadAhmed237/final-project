<?php

$servername = "localhost";

$username = "root";

$password = "123456"; // فارغ لأن الافتراضي في XAMPP كده

$dbname = "university";


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {

    die("Connection failed: " . $conn->connect_error);

}


// استعلام لجلب بيانات الطلاب

$sql = "SELECT * FROM Student";

$result = $conn->query($sql);


if ($result->num_rows > 0) {

    echo "<table border='1'>";

    echo "<tr><th>ID</th><th>Name</th><th>Age</th><th>Phone Number</th></tr>";

    while ($row = $result->fetch_assoc()) {

        echo "<tr>";

        echo "<td>" . $row["StudentID"] . "</td>";

        echo "<td>" . $row["StudentNAME"] . "</td>";

        echo "<td>" . $row["Age"] . "</td>";

        echo "<td>" . $row["PhoneNumber"] . "</td>";

        echo "</tr>";

    }

    echo "</table>";

} else {

    echo "No students found";

}
$StudentID = $_POST['StudentID'] ?? '';
$StudentNAME = $_POST['StudentNAME'] ?? '';
$Age = $_POST['Age'] ?? '';
$PhoneNumber = $_POST['PhoneNumber'] ?? '';

if ($StudentID && $StudentNAME && $Age && $PhoneNumber) {
    $stmt = $conn->prepare("INSERT INTO Student (StudentID, StudentNAME, Age, PhoneNumber) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("isis", $StudentID, $StudentNAME, $Age, $PhoneNumber);
    
    if ($stmt->execute()) {
        echo "Student added successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "Please provide all required fields.";
}
$StudentID = $_POST['StudentID'] ?? '';

if ($StudentID) {
    $stmt = $conn->prepare("DELETE FROM Student WHERE StudentID = ?");
    $stmt->bind_param("i", $StudentID);
    
    if ($stmt->execute()) {
        echo "Student deleted successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "Please provide StudentID to delete.";
}
$conn->close(); 