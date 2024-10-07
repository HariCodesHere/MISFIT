<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content=
		"width=device-width, initial-scale=1.0">
	<title>
		FORMS 
	</title>
	<link rel="stylesheet" type = text/css href="Jeenatest\src\main\webapp\css">

	<style>

		/* Styling the Form (Color, Padding, Shadow) */
		form {
			background-color: #fff;
			max-width: 500px;
			margin: 50px auto;
			padding: 30px 20px;
			box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
		}

		/* Styling form-control Class */
		.form-control {
			text-align: left;
			margin-bottom: 25px;
		}

		/* Styling form-control Label */
		.form-control label {
			display: block;
			margin-bottom: 10px;
		}

		/* Styling form-control input,
		select, textarea */
		.form-control input,
		.form-control select,
		.form-control textarea {
			border: 1px solid #777;
			border-radius: 2px;
			font-family: inherit;
			padding: 10px;
			display: block;
			width: 95%;
		}

		/* Styling form-control Radio
		button and Checkbox */
		.form-control input[type="radio"],
		.form-control input[type="checkbox"] {
			display: inline-block;
			width: auto;
		}

		/* Styling Button */
		button {
			background-color: #05c46b;
			border: 1px solid #777;
			border-radius: 2px;
			font-family: inherit;
			font-size: 21px;
			display: block;
			width: 100%;
			margin-top: 50px;
			margin-bottom: 20px;
		}
	</style>
</head>

<body>
<div class="banner">
	<div class="navbar">
		<img src="C:\Users\ashar\Desktop\Testing zone\home page\" class="logo">
		<ul>
			<li> <a href="C:\Users\TINIL\Desktop\Testing zone\home page\homepagealt.html">Home</a></li>
			<li> <a href="#">Heatmap</a></li>
			<li> <a href="C:\Users\TINIL\Desktop\Testing zone\SOS\SOS.html">SOS</a></li>
			<li> <a href="C:\Users\TINIL\Desktop\Testing zone\forms\forms.html">forms</Form></a></li>
			<li> <a href="C:\Users\TINIL\Desktop\Testing zone\Profile\profile.html">profile</a></li>
			<li> <a href="C:\Users\TINIL\Desktop\Testing zone\Notification\notification.html">Notification</a></li>
			
		</ul>
	</div>

	<h1>Misfit Stray Dog Survey</h1>

	<!-- Create Form -->
	<form id="form" method="post" action = "surveyprocess.jsp">

		<div class="form-control">
		
		<label>Enter your Pin code
		            <select name="pincode">
					<option>-SELECT-YOUR-PIN-CODE-</option>
					<option>683562</option>
					<option>683544</option>
					<option>683541</option>
					<option>686692</option>
					<option>683579</option>
					<option>683511</option>
					<option>683562</option>
					</select>
		</label>
		
		<label>
		<select name = "district">
		<option>-SELECT-A-DISTRICT-</option>
		<option>Ernakulam</option>
		<option>Thiruvananthapuram</option>
		<option>Thrissur</option>
		</select>
		</label>
		

                <label>
                Do you have dog troubles in your area?
                </label>

			<label for="recommed-1">
				<input type="radio"
					id="recommed-1"
					name="recommed" value = "4"><small>Frequently</small></input>
			</label>
			<label for="recommed-2">
				<input type="radio"
					id="recommed-2"
					name="recommed" value = "3"><small>Sometimes</small></input>
			</label>
			<label for="recommed-3">
				<input type="radio"
					id="recommed-3"
					name="recommed" value = "2"><small>Rarely</small></input>
			</label>
                        <label for="recommed-4">
				<input type="radio"
					id="recommed-4"
					name="recommed" value = "1"><small>Not at all</small></input>
			</label>
		</div>

		<div class="form-control">
			<label>Number of dogs you saw near your home past week?
			</label>
			
			<label for="inp-1">
				<input type="radio"
					name="inp" value = "1">
					<small>0</small></label>
					
			<label for="inp-2">
				<input type="radio"
					name="inp" value = "2">
					<small>1-3</small></label>
					
			<label for="inp-3">
				<input type="radio"
					name="inp" value = "3">
					<small>4-6</small></label>
					
			<label for="inp-4">
				<input type="radio"
					name="inp" value = "4">
					<small>More than 7</small></label>
			</div>
			
                        
            <div class="form-control">

			<label>Did a dog bite in past 12 months?
			</label>
			
			<label for="bite-1">
				<input type="radio"
					name="bite" value = "4"><small>Yes</small></input>
				</label>

			<label for="bite-2">
				<input type="radio"
					name="bite" value = "1"><small>No</small></input>
				</label>
		
			</div>

                        
            <button type="submit" value="submit">
			Submit
		</button>
	</form>
</div>>
</body>

</html>
