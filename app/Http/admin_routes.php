<?php

/* ================== Homepage ================== */
//Route::get('/', 'HomeController@index');
//Route::get('/welcome', 'HomeController@show');

Route::get('/home', 'HomeController@index');
//Route::get('/metadata', 'LA\Learning_ObjectsController@add_metadata');

Route::auth();

/* ================== Access Uploaded Files ================== */
Route::get('files/{hash}/{name}', 'LA\UploadsController@get_file');

/*
|--------------------------------------------------------------------------
| Admin Application Routes
|--------------------------------------------------------------------------
*/

$as = "";
if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
	$as = config('laraadmin.adminRoute').'.';
	
	// Routes for Laravel 5.3
	Route::get('/logout', 'Auth\LoginController@logout');
}

Route::group(['as' => $as, 'middleware' => ['auth', 'permission:ADMIN_PANEL']], function () {
	
	/* ================== Dashboard ================== */
	
	Route::get(config('laraadmin.adminRoute'), 'LA\DashboardController@index');
	Route::get(config('laraadmin.adminRoute'). '/dashboard', 'LA\DashboardController@index');
	
	/* ================== Users ================== */
	Route::resource(config('laraadmin.adminRoute') . '/users', 'LA\UsersController');
	Route::get(config('laraadmin.adminRoute') . '/user_dt_ajax', 'LA\UsersController@dtajax');
	
	/* ================== Uploads ================== */
	Route::resource(config('laraadmin.adminRoute') . '/uploads', 'LA\UploadsController');
	Route::post(config('laraadmin.adminRoute') . '/upload_files', 'LA\UploadsController@upload_files');
	Route::get(config('laraadmin.adminRoute') . '/uploaded_files', 'LA\UploadsController@uploaded_files');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_caption', 'LA\UploadsController@update_caption');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_filename', 'LA\UploadsController@update_filename');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_public', 'LA\UploadsController@update_public');
	Route::post(config('laraadmin.adminRoute') . '/uploads_delete_file', 'LA\UploadsController@delete_file');
	
	/* ================== Roles ================== */
	Route::resource(config('laraadmin.adminRoute') . '/roles', 'LA\RolesController');
	Route::get(config('laraadmin.adminRoute') . '/role_dt_ajax', 'LA\RolesController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/save_module_role_permissions/{id}', 'LA\RolesController@save_module_role_permissions');
	
	/* ================== Permissions ================== */
	Route::resource(config('laraadmin.adminRoute') . '/permissions', 'LA\PermissionsController');
	Route::get(config('laraadmin.adminRoute') . '/permission_dt_ajax', 'LA\PermissionsController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/save_permissions/{id}', 'LA\PermissionsController@save_permissions');
	
	
	

	/* ================== Backups ================== */
	Route::resource(config('laraadmin.adminRoute') . '/backups', 'LA\BackupsController');
	Route::get(config('laraadmin.adminRoute') . '/backup_dt_ajax', 'LA\BackupsController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/create_backup_ajax', 'LA\BackupsController@create_backup_ajax');
	Route::get(config('laraadmin.adminRoute') . '/downloadBackup/{id}', 'LA\BackupsController@downloadBackup');

	/* ================== Courses ================== */
	Route::resource(config('laraadmin.adminRoute') . '/courses', 'LA\CoursesController');
	Route::get(config('laraadmin.adminRoute') . '/course_dt_ajax', 'LA\CoursesController@dtajax');
	Route::get('course/{slug}', ['uses' => 'LA\CoursesController@show_course', 'as' => 'courses.show']);
	Route::post('course/enrollment', ['uses' => 'LA\CoursesController@enrollment', 'as' => 'courses.enrollment']);

	/* ================== Lessons ================== */
	Route::resource(config('laraadmin.adminRoute') . '/lessons', 'LA\LessonsController');
	Route::get(config('laraadmin.adminRoute') . '/lesson_dt_ajax', 'LA\LessonsController@dtajax');
	Route::get('lesson/{course_id}/{slug}', ['uses' => 'LA\LessonsController@show_lesson', 'as' => 'lessons.show']);

	/* ================== Learning_Objects ================== */
	Route::resource(config('laraadmin.adminRoute') . '/learning_objects', 'LA\Learning_ObjectsController');
	Route::get(config('laraadmin.adminRoute') . '/learning_object_dt_ajax', 'LA\Learning_ObjectsController@dtajax');
	Route::post('{/admin/learning_objects/', 'LA\Learning_ObjectsController@LOMetadata');

	/* ================== Data_Elements ================== */
	Route::resource(config('laraadmin.adminRoute') . '/data_elements', 'LA\Data_ElementsController');
	Route::get(config('laraadmin.adminRoute') . '/data_element_dt_ajax', 'LA\Data_ElementsController@dtajax');



	/* ================== P_Parameters ================== */
	Route::resource(config('laraadmin.adminRoute') . '/p_parameters', 'LA\P_ParametersController');
	Route::get(config('laraadmin.adminRoute') . '/p_parameter_dt_ajax', 'LA\P_ParametersController@dtajax');

	/* ================== DElement_PParameters ================== */
	Route::resource(config('laraadmin.adminRoute') . '/delement_pparameters', 'LA\DElement_PParametersController');
	Route::get(config('laraadmin.adminRoute') . '/delement_pparameter_dt_ajax', 'LA\DElement_PParametersController@dtajax');

	/* ================== Quizzes ================== */
	Route::resource(config('laraadmin.adminRoute') . '/quizzes', 'LA\QuizzesController');
	Route::get(config('laraadmin.adminRoute') . '/quiz_dt_ajax', 'LA\QuizzesController@dtajax');

	/* ================== Questions ================== */
	Route::resource(config('laraadmin.adminRoute') . '/questions', 'LA\QuestionsController');
	Route::get(config('laraadmin.adminRoute') . '/question_dt_ajax', 'LA\QuestionsController@dtajax');
});
