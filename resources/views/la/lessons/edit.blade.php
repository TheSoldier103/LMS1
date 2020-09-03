@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/lessons') }}">Lesson</a> :
@endsection
@section("contentheader_description", $lesson->$view_col)
@section("section", "Lessons")
@section("section_url", url(config('laraadmin.adminRoute') . '/lessons'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Lessons Edit : ".$lesson->$view_col)

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
				{!! Form::model($lesson, ['route' => [config('laraadmin.adminRoute') . '.lessons.update', $lesson->id ], 'method'=>'PUT', 'id' => 'lesson-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'lesson_title')
					@la_input($module, 'course')
					@la_input($module, 'description')
					@la_input($module, 'published')
					@la_input($module, 'lesson_image')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/lessons') }}">Cancel</a></button>
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
	$("#lesson-edit-form").validate({
		
	});
});
</script>
@endpush
