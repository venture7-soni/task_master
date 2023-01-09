<?php
$accesslevel = 11;
require '../pageincludes/config.php';
require (INCLUDES_DIR . 'logincheck.php');

$testLocation = 'Test Profile ICF';
$testDev = 'tmpdev';
$profile_id = "LAST_INSERT_ID()";

if(isset($_GET['create_user'])){
	$query = "INSERT INTO user (user_name, user_class, user_id, user_title, user_location, first_name, middle_initial, last_name,auto_gen_password,updatetime,password_date,user_type) VALUES('testdummy',11,1163,'Acme Agent','WD123','Wile','E','Coyote',1,'2020-06-16 13:52:00','2020-06-16 13:52:00',38)";

	run_query($query);
}

if(isset($_GET['delete'])){

// Delete all test data from assigned scheduler_shift_schedules;
	$query = "DELETE FROM scheduler_profiles where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM scheduler_profiles_shifts where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM scheduler_profile_programs where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM scheduler_profile_locations where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM scheduler_profile_intensities where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM scheduler_profile_capacities where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM scheduler_shifts where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM scheduler_shift_schedules where created_by = '$testDev'";

	run_query($query);

	$query = "DELETE FROM user WHERE user_name = 'testdummy'";

	run_query($query);

	$query = "DELETE FROM user_restrictions where user = 'testdummy'";

	run_query($query);

}

if(isset($_POST['create_profile'])){

	// TODO: Insert data into all tables below.
	// TODO: Insert scheduler_profiles and select profile_id where created_by = 'tmpdev'

	$query = "INSERT INTO scheduler_profiles(profile_id, name, created_by) VALUE(1, 'Test Profile ICF', 'tmpdev')";
	run_query($query);

	$query = "INSERT INTO scheduler_profiles_shifts(shift_profile_id, profile_id, profile_type_id, shift_type_id, sunday, monday, tuesday, wednesday, thursday, friday, saturday, allday, start_time, end_time, created_by) VALUES(1,1,0,1,0,1,0,1,0,1,0,0,'03:30:00', '10:30:00','tmpdev')";
	run_query($query);

	$query = "INSERT INTO scheduler_profile_programs(profile_id, program_id, created_by) VALUES(1,6,'tmpdev')";
	run_query($query);

	$query = "INSERT INTO scheduler_profile_locations(profile_id, loc_code, created_by) VALUES(1,'0000000001','tmpdev')";
	run_query($query);

	$query = "INSERT INTO scheduler_profile_intensities(profile_id, intensity_id, created_by) VALUES(1,1,'tmpdev')";
	run_query($query);

	$query = "INSERT INTO scheduler_profile_capacities(profile_id, capacity, created_by) VALUES(1,'3','tmpdev')";
	run_query($query);
}

if(isset($_POST['create_scheduler'])){
	$query = "INSERT INTO scheduler_shifts(profile_shift_id, start_time, end_time, loc_code, sunday, monday, tuesday, wednesday, thursday, friday, saturday, created_by) VALUES(1, '03:30:00', '10:30:00', '0000000001', 0,1,0,1,0,1,0,'tmpdev')";
	run_query($query);
}

if(isset($_POST['set_restriction'])){

	$query = "INSERT INTO user_restrictions(user, type, code) VALUES('testdummy', 'location', '0000000001')";

	run_query($query);
}

if(isset($_POST['delete_restriction'])){
	$query = "DELETE FROM user_restrictions WHERE user = 'tmpdev'";
	run_query($query);
}

if(isset($_POST['get_client_id'])){
	$query = run_query("SELECT * FROM client ORDER BY lname LIMIT 15");

  while($row = get_row($query)){
		$results = $row['qmrp_id'];
		$id[] = $results;
		//		echo $row['qmrp_id'] . ' | ';
	}
	echo json_encode($id);
}

if(isset($_POST['excel_reader'])){
	require '../../laravel/vendor/phpoffice/phpspreadsheet/samples/Header.php';

	$inputFileName = 'C:/Users/fight/downloads/reports.xlsx';
	$helper->log('Loading file ' . pathinfo($inputFileName, PATHINFO_BASENAME) . ' using IOFactory to identify the format');
	$spreadsheet = IOFactory::load($inputFileName);
	$sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
	/*	var_dump($sheetData);*/
	return $sheetData;

}

if(isset($_POST['get_sdl_codes'])){
	$query = run_query("SELECT * FROM settings_sandbox.service_delivery_codes");
	while($row = get_row($query)){
		$results = $row['code'];
		$id[] = $results;
	}
	echo json_encode($id);
}
