<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
<link rel="stylesheet" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=visibility,visibility_off" />

</head>
<body onload="confirmation()">
	<div id="signUpPage">
		<div>
			<span id="signUpPageHeader" class="prevent-select"> <img
				src='assets/myFlorabase_Logo_Text.svg' width="59" height="98" />
				<h1 class="centerText">Sign Up</h1>
			</span>
			<form action="submitForm" method="post">
				<div class="inputGroup prevent-select">
					<label class="textfield-label">Username</label> <span><input
						type="text" name="uname" placeholder="Enter your username"
						value="${uname}" required></span> <label class="invalid">${usrnmError}</label>
				</div>
				<div class="inputGroup prevent-select">
					<div class="psw-wrap">
						<label class="textfield-label">Password</label> <input id="psw"
							type="password" name="password" placeholder="Enter your password"
							value="${password}"
							pattern='(?=.*[!@#\$%\^\&\*\(\),\.\?:\{\}\|"])(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}'
							title="Must contain at least one number and one uppercase and lowercase letter and one special character, and at least 8 or more characters"
							required>
						<button type="button" id="toggle-psw"
							class="toggle-button material-symbols-outlined"
							onclick="togglePswVisibility()">visibility_off</button>

					</div>

				</div>
				<div id="message">
					<h3>Password must contain the following:</h3>
					<p id="letter" class="invalid">
						A <b>lowercase</b> letter
					</p>
					<p id="capital" class="invalid">
						A <b>capital (uppercase)</b> letter
					</p>
					<p id="number" class="invalid">
						A <b>number</b>
					</p>
					<p id="special" class="invalid">
						A <b>special</b> character: <br> !@#$%^&*(),.?:{}&quot;|
					</p>
					<p id="length" class="invalid">
						Minimum <b>8 characters</b>
					</p>
				</div>
				<div class="inputGroup prevent-select">
					<div class="psw-wrap">
						<label class="textfield-label">Confirm Password</label> <input
							id="psw2" type="password" name="password"
							placeholder="Enter your password again" value="${password}"
							title="Passwords must match" required>
						<button type="button" id="toggle-psw2"
							class="toggle-button material-symbols-outlined"
							onclick="togglePsw2Visibility()">visibility_off</button>
					</div>

				</div>
				<div class="centerButtons">
					<div id="signUpButtons">
						<button id="signUpButton" class="major-button primary-button"
							value="Sign Up">Sign Up</button>
					</div>
					<label class="label prevent-select">OR</label>
					<%--                need to redirect this to the login page --%>
					<button onclick="window.location.href='login.jsp';"
						class="major-button secondary-button" value="Log in">Log
						in</button>
				</div>
			</form>
		</div>
	</div>

</body>
<script>
	var myInput = document.getElementById("psw");
	var letter = document.getElementById("letter");
	var capital = document.getElementById("capital");
	var number = document.getElementById("number");
	var length = document.getElementById("length");
	var special = document.getElementById("special");

	var myInput2 = document.getElementById("psw2");
	var match = document.getElementById("match");

	// When the user clicks on the password field, show the message box
	myInput.onfocus = function() {
		if (!document.getElementById("psw").checkValidity()) {
			document.getElementById("message").style.display = "block";
		}
	}

	myInput2.onfocus = function() {
		if (document.getElementById("psw2").value == document
				.getElementById("psw").value) {
			myInput2.setCustomValidity('');
		} else {
			myInput2.setCustomValidity("Passwords must match");
		}
		myInput2.reportValidity();
	}
	myInput2.onkeyup = function() {
		if (document.getElementById("psw2").value == document
				.getElementById("psw").value) {
			myInput2.setCustomValidity('');
		} else {
			myInput2.setCustomValidity("Passwords must match");
		}
		myInput2.reportValidity();
	}

	// When the user clicks outside of the password field, hide the message box
	myInput.onblur = function() {
		if (document.getElementById("psw").checkValidity()) {
			document.getElementById("message").style.display = "none";
		}
	}

	// When the user starts to type something inside the password field
	myInput.onkeyup = function() {
		// Validate lowercase letters
		if (!document.getElementById("psw").checkValidity()) {
			document.getElementById("message").style.display = "block";
		}
		
		var lowerCaseLetters = /[a-z]/g;
		if (myInput.value.match(lowerCaseLetters)) {
			letter.classList.remove("invalid");
			letter.classList.add("valid");
		} else {
			letter.classList.remove("valid");
			letter.classList.add("invalid");
		}

		// Validate capital letters
		var upperCaseLetters = /[A-Z]/g;
		if (myInput.value.match(upperCaseLetters)) {
			capital.classList.remove("invalid");
			capital.classList.add("valid");
		} else {
			capital.classList.remove("valid");
			capital.classList.add("invalid");
		}

		// Validate numbers
		var numbers = /[0-9]/g;
		if (myInput.value.match(numbers)) {
			number.classList.remove("invalid");
			number.classList.add("valid");
		} else {
			number.classList.remove("valid");
			number.classList.add("invalid");
		}

		// Validate length
		if (myInput.value.length >= 8) {
			length.classList.remove("invalid");
			length.classList.add("valid");
		} else {
			length.classList.remove("valid");
			length.classList.add("invalid");
		}

		// Validate special characters
		var specialChars = /[!@#$%^&*(),.?:{}|"]/g;
		if (myInput.value.match(specialChars)) {
			special.classList.remove("invalid");
			special.classList.add("valid");
		} else {
			special.classList.remove("valid");
			special.classList.add("invalid");
		}

	}

	/* togglePassword.addEventListener("click", function () {
		  if (passwordField.type === "password") {
		    passwordField.type = "text";
		    togglePassword.classList.remove("fa-eye");
		    togglePassword.classList.add("fa-eye-slash");
		  } else {
		    passwordField.type = "password";
		    togglePassword.classList.remove("fa-eye-slash");
		    togglePassword.classList.add("fa-eye");
		  }
		}); */

	function togglePswVisibility() {
		var x = document.getElementById("psw");
		if (x.type === "password") {
			x.type = "text";
			document.getElementById("toggle-psw").innerHTML = "visibility";
		} else {
			x.type = "password";
			document.getElementById("toggle-psw").innerHTML = "visibility_off";
		}
	}
	function togglePsw2Visibility() {
		var x = document.getElementById("psw2");
		if (x.type === "password") {
			x.type = "text";
			document.getElementById("toggle-psw2").innerHTML = "visibility";
		} else {
			x.type = "password";
			document.getElementById("toggle-psw2").innerHTML = "visibility_off";

		}
	}
</script>
</html>