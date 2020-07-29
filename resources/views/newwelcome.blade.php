@extends("la.layouts.home_global")


@section('main')

    
        <h3>My courses</h3>
        <div class="row">

        
            <div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                  <img src="{{asset(!empty($course->course_image)?'uploads/'.$course->course_image:'http://placehold.it/320x150') }}" alt="" height="320" width="300">
                    <div class="caption">

                    </div>
                    <div class="ratings">
                        <p>Progress:  lessons</p>
                    </div>
                </div>
            </div>
        
        </div>
        <hr />

   

  

    <h3>All courses</h3>
    <div class="row">
    
        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
                 <div class="caption">
                    </h4>
                    <p>course description </p>
                </div>
                <div class="ratings">
                    <p class="pull-right">Students: </p>
                    <p>
                        
                    </p>
                </div>
           
        </div>
   
    </div>

@endsection