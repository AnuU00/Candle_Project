// Get the drop-down list element
var parts = document.getElementById("parts");

// Get the paragraph elements
var no_option = document.getElementById("no_option");
var employee = document.getElementById("employee");
var production = document.getElementById("production");
var ot = document.getElementById("ot");
var ship = document.getElementById("ship");
var wax = document.getElementById("wax");

// Hide all paragraphs by default
no_option.style.display = "none";
employee.style.display = "block";
production.style.display = "none";
ot.style.display = "none";
ship.style.display = "none";
wax.style.display = "none";

// Add a function that runs when the user changes the selection
parts.addEventListener("change", function() {
  // Get the value of the selected option
  var value = parts.value;
  // Hide all paragraphs
  no_option.style.display = "none";
  employee.style.display = "block";
  production.style.display = "none";
  ot.style.display = "none";
  ship.style.display = "none";
  wax.style.display = "none";

  // Show the paragraph that matches the value
if (value == "no_option") {
    no_option.style.display = "block";  
  }  else if (value == "employee") {
    employee.style.display = "block";
  } else if (value == "production") {
    production.style.display = "block";
  } else if (value == "ot") {
    ot.style.display = "block";
  } else if (value == "ship") {
    ship.style.display = "block";
  } else if (value == "wax") {
    wax.style.display = "block";
  }
});