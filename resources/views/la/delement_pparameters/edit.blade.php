@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/delement_pparameters') }}">DElement PParameter</a> :
@endsection
@section("contentheader_description", $delement_pparameter->$view_col)
@section("section", "DElement PParameters")
@section("section_url", url(config('laraadmin.adminRoute') . '/delement_pparameters'))
@section("sub_section", "Edit")

@section("htmlheader_title", "DElement PParameters Edit : ".$delement_pparameter->$view_col)

@section("main-content")

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="box">
	<div class="box-header">
		
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				{!! Form::model($delement_pparameter, ['route' => [config('laraadmin.adminRoute') . '.delement_pparameters.update', $delement_pparameter->id ], 'method'=>'PUT', 'id' => 'delement_pparameter-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'linguistic_term')
					@la_input($module, 'parameter')
					@la_input($module, 'data_element')
					@la_input($module, 'metadata_value')
					@la_input($module, 'degree')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/delement_pparameters') }}">Cancel</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('scripts')
<script>
$(function () {
	$("#delement_pparameter-edit-form").validate({
		
	});
});
</script>
@endpush
