<!DOCTYPE html>
<html lang="en">

@section('htmlheader')
	@include('la.layouts.partials.htmlheader')
@show
<body class="{{ LAConfigs::getByKey('skin') }} {{ LAConfigs::getByKey('layout') }} @if(LAConfigs::getByKey('layout') == 'sidebar-mini') sidebar-collapse @endif" bsurl="{{ url('') }}" adminRoute="{{ config('laraadmin.adminRoute') }}">
<div class="wrapper">

	@include('la.layouts.partials.mainheader')

	@if(LAConfigs::getByKey('layout') != 'layout-top-nav')
		@include('la.layouts.partials.sidebar')
	@endif

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		@if(LAConfigs::getByKey('layout') == 'layout-top-nav') <div class="container"> @endif
		@if(!isset($no_header))
			@include('la.layouts.partials.contentheader')
		@endif
		
		<!-- Main content -->
 
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    @yield('sidebar')
                </div>
                <div class="col-md-7">
                    <div class="row justify-content-md-center text-justify">
                        @yield('main-content')
                    </div>
                </div>
            </div>
        </div> 
		<!-- /.container -->

		@if(LAConfigs::getByKey('layout') == 'layout-top-nav') </div> @endif
	</div><!-- /.content-wrapper -->

	@include('la.layouts.partials.controlsidebar')

	@include('la.layouts.partials.footer')

</div><!-- ./wrapper -->

@include('la.layouts.partials.file_manager')

@section('scripts')
	@include('la.layouts.partials.scripts')
@show



</body>

</html>
