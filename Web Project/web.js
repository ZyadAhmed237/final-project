// main.js
function loadStudents() {
    fetch('students.php')
        .then(res => res.json())
        .then(data => {
            let table = "<table><tr><th>ID</th><th>Name</th><th>Age</th><th>Phone</th><th>Action</th></tr>";
            data.forEach(student => {
                table += `<tr>
                    <td>${student.StudentID}</td>
                    <td>${student.StudentNAME}</td>
                    <td>${student.Age}</td>
                    <td>${student.PhoneNumber}</td>
                    <td><button onclick="deleteStudent(${student.StudentID})">Delete</button></td>
                </tr>`;
            });
            table += "</table>";
            document.getElementById("studentList").innerHTML = table;
        });
}

function addStudent(e) {
    e.preventDefault();
    const form = document.getElementById("studentForm");
    const formData = new FormData(form);
    fetch('students.php', {
        method: 'POST',
        body: formData
    })
    .then(() => {
        form.reset();
        loadStudents();
    });
}

function deleteStudent(id) {
    fetch(`students.php?delete=${id}`)
        .then(() => loadStudents());
}

window.onload = loadStudents;
