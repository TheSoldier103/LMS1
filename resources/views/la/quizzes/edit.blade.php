@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/quizzes') }}">Quiz</a> :
@endsection
@section("contentheader_description", $quiz->$view_col)
@section("section", "Quizzes")
@section("section_url", url(config('laraadmin.adminRoute') . '/quizzes'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Quizzes Edit : ".$quiz->$view_col)

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
				{!! Form::model($quiz, ['route' => [config('laraadmin.adminRoute') . '.quizzes.update', $quiz->id ], 'method'=>'PUT', 'id' => 'quiz-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'title')
					@la_input($module, 'description')
					@la_input($module, 'published')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/quizzes') }}">Cancel</a></button>
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
	$("#quiz-edit-form").validate({
		
	});
});
</script>
@endpush
