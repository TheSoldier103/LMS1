@extends('la.layouts.app')

@section("contentheader_title", "Courses")
@section("contentheader_description", "Uploaded images & files")
@section("section", "Courses")
@section("sub_section", "Listing")
@section("htmlheader_title", "Uploaded images & files")


@section('main-content')

        @if (!is_null($enrolled_courses))
        <h3>My courses</h3>
        <div class="row">

        @foreach($enrolled_courses as $course)
            <div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                  <img src="{{asset(!empty($course->course_image)?'uploads/'.$course->course_image:'http://placehold.it/320x150') }}" alt="" height="320" width="320">
                    <div class="caption">
                        <h4><a href="{{ route('courses.show', [$course->course_title]) }}">{{ $course->course_title }}</a></h4>
                        
                        <p>{{ $course->description }}</p>
                    </div>
                    <div class="ratings">
                        <p>Progress:  {{ Auth::user()->lessons()->where('course_id', $course->id)->count() }}
                            of {{ $course->lessons->count() }} lessons</p>
                    </div>
                </div>
            </div>
        @endforeach
        </div>
        <hr/>
        @endif

    

    <h3>All courses</h3>
    <div class="row">
    @foreach($courses as $course)
    <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
            <img src="{{asset(!empty($course->course_image)?'uploads/'.$course->course_image:'http://placehold.it/320x150') }}" alt="" height="320" width="320">
                <div class="caption">
                    
                    <h4><a href="{{ route('courses.show', [$course->course_title]) }}">{{ $course->course_title }}</a>
                    </h4>
                    <p>{{ $course->description }}</p>
                </div>
                <div class="ratings">
                    <p class="pull-right">Students: {{ $course->students()->count() }}</p>
                    <p>
                        @for ($star = 1; $star <= 5; $star++)
                            @if ($course->rating >= $star)
                                <span class="glyphicon glyphicon-star"></span>
                            @else
                                <span class="glyphicon glyphicon-star-empty"></span>
                            @endif
                        @endfor
                    </p>
                </div>
            </div>
        </div>
    @endforeach
    </div>

@endsection
