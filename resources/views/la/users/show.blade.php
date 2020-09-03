@extends('la.layouts.app')

@section('htmlheader_title')
	User View
@endsection


@section('main-content')

<div id="page-content" class="profile2">
	<div class="bg-primary clearfix">
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-3">
					<!--<img class="profile-image" src="{{ asset('la-assets/img/avatar5.png') }}" alt="">-->
					<div class="profile-icon text-primary"><i class="fa {{ $module->fa_icon }}"></i></div>
				</div>
				<div class="col-md-9">
					<h4 class="name">{{ $user->$view_col }}</h4>
					<div class="row stats">
						<div class="col-md-4"><i class="fa fa-facebook"></i> 234</div>
						<div class="col-md-4"><i class="fa fa-twitter"></i> 12</div>
						<div class="col-md-4"><i class="fa fa-instagram"></i> 89</div>
					</div>
					<p class="desc">Test Description in one line</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="dats1"><div class="label2">Admin</div></div>
			<div class="dats1"><i class="fa fa-envelope-o"></i> superadmin@gmail.com</div>
			<div class="dats1"><i class="fa fa-map-marker"></i> Pune, India</div>
		</div>
		<div class="col-md-4">
			<!--
			<div class="teamview">
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user1-128x128.jpg') }}" alt=""><i class="status-online"></i></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user2-160x160.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user3-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user4-128x128.jpg') }}" alt=""><i class="status-online"></i></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user5-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user6-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user7-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user8-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user5-128x128.jpg') }}" alt=""></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user6-128x128.jpg') }}" alt=""><i class="status-online"></i></a>
				<a class="face" data-toggle="tooltip" data-placement="top" title="John Doe"><img src="{{ asset('la-assets/img/user7-128x128.jpg') }}" alt=""></a>
			</div>
			-->
			<div class="dats1 pb">
				<div class="clearfix">
					<span class="pull-left">Task #1</span>
					<small class="pull-right">20%</small>
				</div>
				<div class="progress progress-xs active">
					<div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">20% Complete</span>
					</div>
				</div>
			</div>
			<div class="dats1 pb">
				<div class="clearfix">
					<span class="pull-left">Task #2</span>
					<small class="pull-right">90%</small>
				</div>
				<div class="progress progress-xs active">
					<div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 90%" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">90% Complete</span>
					</div>
				</div>
			</div>
			<div class="dats1 pb">
				<div class="clearfix">
					<span class="pull-left">Task #3</span>
					<small class="pull-right">60%</small>
				</div>
				<div class="progress progress-xs active">
					<div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 60%" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
						<span class="sr-only">60% Complete</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-1 actions">
			@la_access("Users", "edit")
				<a href="{{ url(config('laraadmin.adminRoute') . '/users/'.$user->id.'/edit') }}" class="btn btn-xs btn-edit btn-default"><i class="fa fa-pencil"></i></a><br>
			@endla_access
			
			@la_access("Users", "delete")
				{{ Form::open(['route' => [config('laraadmin.adminRoute') . '.users.destroy', $user->id], 'method' => 'delete', 'style'=>'display:inline']) }}
					<button class="btn btn-default btn-delete btn-xs" type="submit"><i class="fa fa-times"></i></button>
				{{ Form::close() }}
			@endla_access
		</div>
	</div>

	<ul data-toggle="ajax-tab" class="nav nav-tabs profile" role="tablist">
		<li class=""><a href="{{ url(config('laraadmin.adminRoute') . '/users') }}" data-toggle="tooltip" data-placement="right" title="Back to Users"><i class="fa fa-chevron-left"></i></a></li>
		<li class="active"><a role="tab" data-toggle="tab" class="active" href="#tab-general-info" data-target="#tab-info"><i class="fa fa-bars"></i> General Info</a></li>
		<li class=""><a role="tab" data-toggle="tab" class="active" href="#tab-general-info" data-target="#tab-metadata"><i class="fa fa-bars"></i> User Preferences</a></li>
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active fade in" id="tab-info">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-default panel-heading">
						<h4>General Info</h4>
					</div>
					<div class="panel-body">
						@la_display($module, 'name')
						@la_display($module, 'context_id')
						@la_display($module, 'email')
						@la_display($module, 'password')
						@la_display($module, 'type')
					</div>
				</div>
			</div>
		</div>
		
		<div role="tabpanel" class="tab-pane active fade in" id="tab-metadata">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-default panel-heading">
					
					{{Form::open(['action'=> 'LA\UsersController@userPreferences', 'method' => 'POST'])}}
						
					
						
						<div class="form-group">
							<div class="row col-md-12">
								<div class = 'col-md-3'>

									{{Form::label('active_reflective', 'Active/Reflective FSLS')}}
									{{Form::select('Active_Reflective FSLS', $active_reflective, '', ['class'=>'form-control']) }}
								
								</div>
								<div class='col-md-3'>
								{{Form::label('degree', 'Active/Reflective Degree')}}
								{{Form::select('Active_Reflective Degree', $degree, '', ['class'=>'form-control','col']) }}
								</div>
							</div>	

						</div>

						<div class="form-group">
							{{Form::label('visual_verbal', 'Visual/Verbal FSLS')}}
							{{Form::select('Visual_Verbal FSLS', $visual_verbal, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('sequential_global', 'Sequential/Global FSLS')}}
							{{Form::select('Sequential_Global FSLS', $sequential_global, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							<div class="row col-md-12">
								<div class = 'col-md-3'>

									{{Form::label('activist_reflector', 'Activist/Reflector Honey-Mumford')}}
									{{Form::select('Activist_Reflector Honey_Mumford', $activist_reflector, '', ['class'=>'form-control']) }}
								
								</div>
								<div class='col-md-3'>
								{{Form::label('degree', 'Activist/Reflector Degree')}}
								{{Form::select('Activist_Reflector Degree', $degree, '', ['class'=>'form-control','col']) }}
								</div>
							</div>	

						</div>

						<div class="form-group">
							{{Form::label('media_preference', 'Media Preference')}}
							{{Form::select('Media Preference', $media_preference, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('navigation_preference', 'Navigation Preference')}}
							{{Form::select('Navigation Preference', $navigation_preference, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::hidden('id', $id) }}
						</div>

					{{Form::submit('Submit', ['class'=>'btn btn-primary'])}}
    				{{Form::close()}}
					</div>

			</ul>
			<!--<div class="text-center p30"><i class="fa fa-list-alt" style="font-size: 100px;"></i> <br> No posts to show</div>-->
		</div>
		
	</div>
	</div>
	</div>
</div>


@endsection
