<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\User;
use App\Models\Course;

/**
 * Class HomeController
 * @package App\Http\Controllers
 */
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        
    }

    /**
     * Show the application dashboard.
     *
     * @return Response
     */
   /* public function index()
    {
        $roleCount = \App\Role::count();
		if($roleCount != 0) {
			if($roleCount != 0) {
				return view('home');
			}
		} else {
			return view('errors.error', [
				'title' => 'Migration not completed',
				'message' => 'Please run command <code>php artisan db:seed</code> to generate required table data.',
			]);
		}
    }*/

    public function show()
    {
        $purchased_courses = NULL;

        $courses = User::where('type', 'Employee')->orderBy('id', 'desc')->get();
        return view('newwelcome', compact('courses', 'purchased_courses'));
    }

    public function index()
    {
        $enrolled_courses = NULL;
       if (\Auth::check()) {
            $enrolled_courses = Course::whereHas('students', function($query) {
                $query->where('user_id', \Auth::id());
            })
            ->orderBy('id', 'desc')
            ->get();
        } 
        $courses = Course::where('published', 1)->orderBy('id', 'desc')->get();
        return view('newwelcome', compact('courses', 'enrolled_courses'));
    }


}