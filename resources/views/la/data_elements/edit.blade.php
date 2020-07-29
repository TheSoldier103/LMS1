@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/data_elements') }}">Data Element</a> :
@endsection
@section("contentheader_description", $data_element->$view_col)
@section("section", "Data Elements")
@section("section_url", url(config('laraadmin.adminRoute') . '/data_elements'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Data Elements Edit : ".$data_element->$view_col)

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
				{!! Form::model($data_element, ['route' => [config('laraadmin.adminRoute') . '.data_elements.update', $data_element->id ], 'method'=>'PUT', 'id' => 'data_element-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'element_nr')
					@la_input($module, 'element_name')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/data_elements') }}">Cancel</a></button>
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
	$("#data_element-edit-form").validate({
		
	});
});
</script>
@endpush
