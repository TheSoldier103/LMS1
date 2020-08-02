@extends('la.layouts.app2')

@section('sidebar')
    <p class="lead">{{ $lesson->course->lesson_title }}</p>

    <div class="list-group">
        @foreach ($lesson->course->publishedLessons as $list_lesson)
            <a href="{{ route('lessons.show', [$list_lesson->course_id, $list_lesson->lesson_title]) }}" class="list-group-item"
                @if ($list_lesson->id == $lesson->id) style="font-weight: bold" @endif> {{ $list_lesson->lesson_title }}</a>
        @endforeach
    </div>
@endsection

@section('main-content')

    <h2>{{ $lesson->lesson_title }}</h2>

    @if ($enrolled_course)
        {!! $lesson->full_text !!}

        @if ($test_exists)
            <hr />
            <h3>Test: {{ $lesson->test->title }}</h3>
            @if (!is_null($test_result))
                <div class="alert alert-info">Your test score: {{ $test_result->test_result }}</div>
            @else
            <form action="{{ route('lessons.test', [$lesson->slug]) }}" method="post">
                {{ csrf_field() }}
                @foreach ($lesson->test->questions as $question)
                    <b>{{ $loop->iteration }}. {{ $question->question }}</b>
                    <br />
                    @foreach ($question->options as $option)
                        <input type="radio" name="questions[{{ $question->id }}]" value="{{ $option->id }}" /> {{ $option->option_text }}<br />
                    @endforeach
                    <br />
                @endforeach
                <input type="submit" value=" Submit results " />
            </form>
            @endif
            <hr />
        @endif
    @else
        Please <a href="{{ route('courses.show', [$lesson->course->slug]) }}">go back</a> and buy the course.
    @endif

    @if ($previous_lesson)
        <p><a href="{{ route('lessons.show', [$previous_lesson->course_id, $previous_lesson->lesson_title]) }}"><< {{ $previous_lesson->lesson_title }}</a></p>
    @endif
    @if ($next_lesson)
        <p><a href="{{ route('lessons.show', [$next_lesson->course_id, $next_lesson->lesson_title]) }}">{{ $next_lesson->lesson_title }} >></a></p>
    @endif

    <h3 style="color:#FF0000">Downloadable files</h3>
    
    <!-- <a href="{{URL::to('/')}}/files/4idzmi7pixexg78zcwtj/LMS.pdf  " target="_blank">
     <button class="btn"><i class="fa fa-download"></i> Download File</button>
    </a> -->

    @foreach ($file_link as $file_link)
    <a href="{{URL::to('/')}}/files/{{$file_link->hash}}/{{$file_link->name}}  " target="_blank">
     <button class="btn"><i class="fa fa-download"></i><h3 >{{$file_link->lo_title}}</h3></button>
    </a>
    
    @endforeach

@endsection