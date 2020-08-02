<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('home');
});

/* ================== Homepage + Admin Routes ================== */

require __DIR__.'/admin_routes.php';
Route::get('course/{slug}', ['uses' => 'LA\CoursesController@show_course', 'as' => 'courses.show']);
Route::post('course/enrollment', ['uses' => 'LA\CoursesController@enrollment', 'as' => 'courses.enrollment']);

Route::post('course/{course_id}/rating', ['uses' => 'LA\CoursesController@rating', 'as' => 'courses.rating']);
