@extends('la.layouts.app')

@section('main-content')
<div class="col-md-3">
  <div class="row">
		
	</div>


</div>
  <div class="col-md-9">

      <div class="row">

        <h2>{{ $course->course_title }}</h2>

        @if ($enrolled_course)
            Rating: {{ $course->rating }} / 5
            <br />
            <b>Rate the course:</b>
            <br />
            <form action="{{ route('courses.rating', [$course->id]) }}" method="post">
                {{ csrf_field() }}
                <select name="rating">
                    <option value="1">1 - Awful</option>
                    <option value="2">2 - Not too good</option>
                    <option value="3">3 - Average</option>
                    <option value="4" selected>4 - Quite good</option>
                    <option value="5">5 - Awesome!</option>
                </select>
                <input type="submit" value="Rate" />
            </form>
            <hr />
        @endif

        <p>{{ $course->description }}</p>

        <p>
            @if (\Auth::check())
                @if ($course->students()->where('user_id', \Auth::id())->count() == 0)
                {{Form::open(['action'=> 'LA\CoursesController@enrollment', 'method' => 'POST'])}}
	                <div class="form-group">
                    <input type="hidden" name="course_id" value="{{ $course->id }}"/>
                    </div>
                {{Form::submit('Enroll', ['class'=>'btn btn-primary'])}}
                {{Form::close()}}
                @endif
            @else
                <a href="{{ route('auth.register') }}?redirect_url={{ route('courses.show', [$course->slug]) }}"
                   class="btn btn-primary">Buy course (${{ $course->price }})</a>
            @endif
        </p>


        @foreach ($course->publishedLessons as $lesson)
          
            <a href="{{ route('lessons.show', [$lesson->course_id, $lesson->lesson_title]) }}">{{ $lesson->lesson_title }}</a>
            <p>{{ $lesson->description }}</p>
            <hr />
        @endforeach

      </div>

  </div>


@endsection