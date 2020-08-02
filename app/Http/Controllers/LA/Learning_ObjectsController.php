<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use App\Http\Requests;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Learning_Object;

class Learning_ObjectsController extends Controller
{
	public $show_action = true;
	public $view_col = 'lo_title';
	public $listing_cols = ['id', 'lesson_id', 'lo_title', 'file', 'format'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Learning_Objects', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Learning_Objects', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Learning_Objects.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Learning_Objects');
		
		if(Module::hasAccess($module->id)) {
			return View('la.learning_objects.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new learning_object.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	public function add_metadata()
	{
		//$activity_type = ['Topic list','Lesson','Announcement','Forum','Quiz','Survey/Poll','Exercise','Assignment','Glossary','Email/Chat','Wiki','Workshop','References'];
        $media_format = ['text','audio','PPT','video','multimedia'];
        $difficulty_level = ['beginner','intermediate','advanced'];
        //$learning_mode = ['independent','collaborative','group work','mixed'];
        $learning_goal = ['knowledge','comprehension','application'];

        //$lesson_unit = Lesson_unit::find($id);
        //$course = Course::find($id);
        //$concepts = [$lesson_unit->concepts];
        //return view('courses.lessons')->with($data);

        //return view ('learning_objects.create', compact('difficulty_level','media_format','activity_type','learning_mode','concepts','lesson_unit'));
        return view ('la.learning_objects.metadata', compact('difficulty_level','media_format','learning_goal','course'));
	}

	public function LOMetadata(Request $request)
    {
	
		//dd($request->all());
		//dd(request()->Language);

		$LO_id = request()->id;
		$language = request()->Language;
		$interactivity_type = request()->Interactivity_Type;
		$interactivity_level = request()->Interactivity_Level;
		$resource_type = request()->Learning_Resource_Type;
		$format = request()->Format;
		$structure = request()->Structure;
		$difficulty = request()->Difficulty;
		$semantic_density = request()->Semantic_Density;
		$purpose = request()->Purpose;

		DB::insert('insert into lo_properties 
		(lo, language, interactivity_type, interactivity_level, resource_type, format, structure, difficulty, semantic_density, purpose) 
		values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', 
		[$LO_id, $language, $interactivity_type, $interactivity_level, $resource_type, $format, $structure, $difficulty, $semantic_density, $purpose]);
         
        return redirect ('/home')->with('success','Metadata added');

        //return redirect ('/courses')->with('success', 'Course Created');
    }

	/**
	 * Store a newly created learning_object in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Learning_Objects", "create")) {
		
			$rules = Module::validateRules("Learning_Objects", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Learning_Objects", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.learning_objects.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified learning_object.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Learning_Objects", "view")) {
			//$media_format = ['text','audio','PPT','video','multimedia'];
			$learning_object = Learning_Object::find($id);
			if(isset($learning_object->id)) {
				$module = Module::get('Learning_Objects');
				$module->row = $learning_object;
				//$media_format = ['text','audio','PPT','video','multimedia'];
				//$interactivity_level = ['very low','low','medium','high','very high'];
				
				$interactivity_typeV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Interactivity Type')->get();

				$interactivity_levelV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.interactivity_level')
				->get();

				$lrtV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Learning Resource Type')->get();

				$formatV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Format')->get();

				$structureV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Structure')->get();

				$difficultyV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Difficulty')->get();

				$semantic_densityV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Semantic Density')->get();

				$purposeV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Purpose')->get();

				$languageV = DB::table('delement_pparameters')
				->join('data_elements', 'data_elements.id', '=', 'delement_pparameters.data_element')
				->select('delement_pparameters.metadata_value')
				->where('data_elements.element_name', '=', 'Language')->get();

			/*	$interactivity_typeV = DB::table('delement_pparameters')
				->join('p_parameters', 'p_parameters.id', '=', 'delement_pparameters.parameter')
				->select('delement_pparameters.linguistic_term')
				->where('p_parameters.parameter', '=', 'Language Preference')->get(); */


				//$media = DB::select(DB::raw("SELECT delement_pparameters.linguistic_term FROM p_parameters INNER JOIN delement_pparameters ON p_parameters.id = delement_pparameters.parameter WHERE p_parameters.parameter ='Felder/Silverman LS'"));
				
				$language = [];
				foreach ($languageV as $value) {
					 $language[$value->metadata_value]=$value->metadata_value;
				}

				$interactivity_type = [];
				foreach ($interactivity_typeV as $value) {
					 $interactivity_type[$value->metadata_value]=$value->metadata_value;
				}

				$interactivity_level = [];
				foreach ($interactivity_levelV as $value) {
					 $interactivity_level[$value->interactivity_level]=$value->interactivity_level;
				}


				$lrt = [];
				foreach ($lrtV as $value) {
					 $lrt[$value->metadata_value]=$value->metadata_value;
				}

				$format = [];
				foreach ($formatV as $value) {
					 $format[$value->metadata_value]=$value->metadata_value;
				}

				$structure = [];
				foreach ($structureV as $value) {
					 $structure[$value->metadata_value]=$value->metadata_value;
				}

				$difficulty = [];
				foreach ($difficultyV as $value) {
					 $difficulty[$value->metadata_value]=$value->metadata_value;
				}

				$semantic_density = [];
				foreach ($semantic_densityV as $value) {
					 $semantic_density[$value->metadata_value]=$value->metadata_value;
				}

				$purpose = [];
				foreach ($purposeV as $value) {
					 $purpose[$value->metadata_value]=$value->metadata_value;
				}

				//$language = [];
				//foreach ($languageV as $value) {
					 //array_push($language, $value->linguistic_term);
				//	 $language[$value->linguistic_term]=$value->linguistic_term;
				//}
				//dd($language);
				//$languages = ['English', 'French'];

				//dd($languages);
				
				return view('la.learning_objects.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('learning_object', $learning_object)
				
				->with('language', $language)
				->with('interactivity_type', $interactivity_type)
				->with('interactivity_level', $interactivity_level)
				->with('lrt', $lrt)
				->with('format', $format)
				->with('structure', $structure)
				->with('difficulty', $difficulty)
				->with('semantic_density', $semantic_density)
				->with('purpose', $purpose)
				->with('id', $id);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("learning_object"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified learning_object.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Learning_Objects", "edit")) {			
			$learning_object = Learning_Object::find($id);
			if(isset($learning_object->id)) {	
				$module = Module::get('Learning_Objects');
				
				$module->row = $learning_object;
				
				return view('la.learning_objects.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('learning_object', $learning_object);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("learning_object"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified learning_object in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Learning_Objects", "edit")) {
			
			$rules = Module::validateRules("Learning_Objects", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Learning_Objects", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.learning_objects.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified learning_object from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Learning_Objects", "delete")) {
			Learning_Object::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.learning_objects.index');
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
		$values = DB::table('learning_objects')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Learning_Objects');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/learning_objects/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Learning_Objects", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/learning_objects/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Learning_Objects", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.learning_objects.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
