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

use App\Models\DElement_PParameter;

class DElement_PParametersController extends Controller
{
	public $show_action = true;
	public $view_col = 'linguistic_term';
	public $listing_cols = ['id', 'linguistic_term', 'parameter', 'data_element', 'metadata_value', 'degree'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('DElement_PParameters', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('DElement_PParameters', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the DElement_PParameters.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('DElement_PParameters');
		
		if(Module::hasAccess($module->id)) {
			return View('la.delement_pparameters.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new delement_pparameter.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created delement_pparameter in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("DElement_PParameters", "create")) {
		
			$rules = Module::validateRules("DElement_PParameters", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("DElement_PParameters", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.delement_pparameters.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified delement_pparameter.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("DElement_PParameters", "view")) {
			
			$delement_pparameter = DElement_PParameter::find($id);
			//dd($media_format = ['text','audio','PPT','video','multimedia']);

			$media = DB::table('delement_pparameters')
						->join('p_parameters', 'p_parameters.id', '=', 'delement_pparameters.parameter')
						->select('delement_pparameters.linguistic_term')
						->where('p_parameters.parameter', '=', 'Felder/Silverman LS')->get();
			//dd(gettype($media));


			if(isset($delement_pparameter->id)) {
				$module = Module::get('DElement_PParameters');
				$module->row = $delement_pparameter;
				
				return view('la.delement_pparameters.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('delement_pparameter', $delement_pparameter);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("delement_pparameter"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified delement_pparameter.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("DElement_PParameters", "edit")) {			
			$delement_pparameter = DElement_PParameter::find($id);
			if(isset($delement_pparameter->id)) {	
				$module = Module::get('DElement_PParameters');
				
				$module->row = $delement_pparameter;
				
				return view('la.delement_pparameters.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('delement_pparameter', $delement_pparameter);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("delement_pparameter"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified delement_pparameter in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("DElement_PParameters", "edit")) {
			
			$rules = Module::validateRules("DElement_PParameters", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("DElement_PParameters", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.delement_pparameters.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified delement_pparameter from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("DElement_PParameters", "delete")) {
			DElement_PParameter::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.delement_pparameters.index');
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
		$values = DB::table('delement_pparameters')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('DElement_PParameters');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/delement_pparameters/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("DElement_PParameters", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/delement_pparameters/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("DElement_PParameters", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.delement_pparameters.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
