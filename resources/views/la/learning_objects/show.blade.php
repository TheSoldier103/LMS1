@extends('la.layouts.app')

@section('htmlheader_title')
	Learning Object View
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
					<h4 class="name">{{ $learning_object->$view_col }}</h4>
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
			@la_access("Learning_Objects", "edit")
				<a href="{{ url(config('laraadmin.adminRoute') . '/learning_objects/'.$learning_object->id.'/edit') }}" class="btn btn-xs btn-edit btn-default"><i class="fa fa-pencil"></i></a><br>
			@endla_access
			
			@la_access("Learning_Objects", "delete")
				{{ Form::open(['route' => [config('laraadmin.adminRoute') . '.learning_objects.destroy', $learning_object->id], 'method' => 'delete', 'style'=>'display:inline']) }}
					<button class="btn btn-default btn-delete btn-xs" type="submit"><i class="fa fa-times"></i></button>
				{{ Form::close() }}
			@endla_access
		</div>
	</div>

	<ul data-toggle="ajax-tab" class="nav nav-tabs profile" role="tablist">
		<li class=""><a href="{{ url(config('laraadmin.adminRoute') . '/learning_objects') }}" data-toggle="tooltip" data-placement="right" title="Back to Learning Objects"><i class="fa fa-chevron-left"></i></a></li>
		<li class="active"><a role="tab" data-toggle="tab" class="active" href="#tab-general-info" data-target="#tab-info"><i class="fa fa-bars"></i> General Info</a></li>
		
		<li class=""><a role="tab" data-toggle="tab" class="active" href="#tab-general-info" data-target="#tab-metadata"><i class="fa fa-bars"></i> Metadata</a></li>
		
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active fade in" id="tab-info">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-default panel-heading">
						<h4>General Info</h4>
					</div>
					<div class="panel-body">
						@la_display($module, 'lesson_id')
						@la_display($module, 'lo_title')
						@la_display($module, 'concept')
						@la_display($module, 'file')
						
					</div>
				</div>
			</div>
		</div>

		<div role="tabpanel" class="tab-pane active fade in" id="tab-metadata">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-default panel-heading">
						<h4>Metadata</h4>
					</div>
					<div class="panel-body">
					{{Form::open(['action'=> 'LA\Learning_ObjectsController@LOMetadata', 'method' => 'POST'])}}
						
						<div class="form-group">
							{{Form::label('language', 'Language')}}
							{{Form::select('Language', $language, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('interactivity_type', 'Interactivity Type')}}
							{{Form::select('Interactivity Type', $interactivity_type, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('interactivity_level', 'Interactivity Level')}}
							{{Form::select('Interactivity Level', $interactivity_level, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('lrt', 'Learning Resource Type')}}
							{{Form::select('Learning Resource Type', $lrt, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('format', 'Format')}}
							{{Form::select('Format', $format, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('structure', 'Structure')}}
							{{Form::select('Structure', $structure, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('difficulty', 'Difficulty')}}
							{{Form::select('Difficulty', $difficulty, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('semantic_density', 'Semantic Density')}}
							{{Form::select('Semantic Density', $semantic_density, '', ['class'=>'form-control']) }}
						</div>

						<div class="form-group">
							{{Form::label('purpose', 'Purpose')}}
							{{Form::select('Purpose', $purpose, '', ['class'=>'form-control']) }}
						</div>


						<div class="form-group">
							{{Form::hidden('id', $id) }}
						</div>



					{{Form::submit('Submit', ['class'=>'btn btn-primary'])}}
    				{{Form::close()}}
					</div>

@endsection
