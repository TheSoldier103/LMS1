@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/courses') }}">Course</a> :
@endsection
@section("contentheader_description", $course->$view_col)
@section("section", "Courses")
@section("section_url", url(config('laraadmin.adminRoute') . '/courses'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Courses Edit : ".$course->$view_col)

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
				{!! Form::model($course, ['route' => [config('laraadmin.adminRoute') . '.courses.update', $course->id ], 'method'=>'PUT', 'id' => 'course-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'course_title')
					@la_input($module, 'description')
					@la_input($module, 'start_date')
					@la_input($module, 'published')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/courses') }}">Cancel</a></button>
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
	$("#course-edit-form").validate({
		
	});
});
</script>
@endpush
