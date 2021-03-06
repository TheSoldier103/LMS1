<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Lesson;
use App\User;


class LessonsController extends Controller
{
	public $show_action = true;
	public $view_col = 'lesson_title';
	public $listing_cols = ['id', 'lesson_title', 'course_id', 'description', 'full_text', 'published', 'lesson_image'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Lessons', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Lessons', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Lessons.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Lessons');
		
		if(Module::hasAccess($module->id)) {
			return View('la.lessons.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new lesson.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created lesson in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Lessons", "create")) {
		
			$rules = Module::validateRules("Lessons", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Lessons", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.lessons.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified lesson.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */

	public function show_lesson($course_id, $lesson_slug)
    {
        $lesson = Lesson::where('lesson_title', $lesson_slug)->where('course_id', $course_id)->firstOrFail();

        if (\Auth::check())
        {
            if ($lesson->students()->where('user_id', \Auth::id())->count() == 0) {
                $lesson->students()->attach(\Auth::id());
            }
        }

       // $test_result = NULL;
       // if ($lesson->test) {
        //    $test_result = TestsResult::where('test_id', $lesson->test->id)
        //        ->where('user_id', \Auth::id())
        //        ->first();
        //}

        $previous_lesson = Lesson::where('course_id', $lesson->course_id)
            ->where('position', '<', $lesson->position)
            ->orderBy('position', 'desc')
            ->first();
        $next_lesson = Lesson::where('course_id', $lesson->course_id)
            ->where('position', '>', $lesson->position)
            ->orderBy('position', 'asc')
            ->first();

		$enrolled_course = $lesson->course->students()->where('user_id', \Auth::id())->count() > 0;
		
		$los = $lesson->learning_objects;

		$file_link = DB::table('learning_objects')
				->join('uploads', 'uploads.id', '=', 'learning_objects.file')
				->select('uploads.path','learning_objects.lo_title','uploads.hash','uploads.name')
				->where('learning_objects.lesson_id', '=', $lesson->id)->get();

        $test_exists = FALSE;
        if ($lesson->test && $lesson->test->questions->count() > 0) {
            $test_exists = TRUE;
		}
		
		#$python = `python3 /home/ufuoma/Documents/ontologyOutput.py`;
		#dd($python);
		$user = User::find(Auth::id());
		$user_name = $user->name;
		$userLOs = escapeshellcmd("python3 /home/ufuoma/Documents/ontologyOutput.py $user_name");
		$output = shell_exec($userLOs);
		$lo_array = json_decode($output);

		$db_lo_array = [];
		foreach ($file_link as $key => $value) {
			 array_push($db_lo_array, $value->lo_title);
		}

		$suitedLos = array_intersect ($db_lo_array, $lo_array);
	

		return view('lesson', compact('lesson', 'previous_lesson', 'next_lesson', 'test_result',
            'enrolled_course', 'test_exists', 'file_link','suitedLos'));
    }



	public function show($id)
	{
		if(Module::hasAccess("Lessons", "view")) {
			
			$lesson = Lesson::find($id);
			if(isset($lesson->id)) {
				$module = Module::get('Lessons');
				$module->row = $lesson;
				
				return view('la.lessons.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('lesson', $lesson);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("lesson"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified lesson.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Lessons", "edit")) {			
			$lesson = Lesson::find($id);
			if(isset($lesson->id)) {	
				$module = Module::get('Lessons');
				
				$module->row = $lesson;
				
				return view('la.lessons.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('lesson', $lesson);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("lesson"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified lesson in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Lessons", "edit")) {
			
			$rules = Module::validateRules("Lessons", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Lessons", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.lessons.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified lesson from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Lessons", "delete")) {
			Lesson::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.lessons.index');
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
	
	/**
	 * Datatable Ajax fetch
	 *
	 * @return
	 */
	public function dtajax()
	{
		$values = DB::table('lessons')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Lessons');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/lessons/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Lessons", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/lessons/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Lessons", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.lessons.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}
}
