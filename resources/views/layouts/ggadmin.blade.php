<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    
    <!-- Bootstrap Core CSS -->
    <link href="/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/admin/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        
</head>
<body>

    @guest
	 
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{{ __('admin.sign_in') }}</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" method="post" action="{{ route('adminlogin', [], false) }}">
                                {{ csrf_field() }}
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="{{ __('admin.username') }}" name="username" type="username" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="{{ __('admin.password') }}" name="password" type="password" value="">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <?php echo captcha_img(); ?>
                                        </span>
                                        <input class="form-control captcha" id="captcha" placeholder="{{ __('admin.enter_captcha') }}" type="text" name="captcha"> 
                                    </div>
                                    
                                    
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">{{ __('admin.remember_me') }}
                                        </label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <button type="submit" class="btn btn-lg btn-success btn-block">{{ __('admin.login') }}</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
	@else

        <div id="wrapper">
    
        	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        		@include('common.header')
        	</nav>
    		
    
    		<div id="page-wrapper">
    		    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Notifications</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <div class="row">
                	here2<hr>
    				@yield('content')
    			</div>
    		</div>
    		
    	</div>

    @endguest

    <!-- jQuery -->
    <script src="/admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/admin/vendor/raphael/raphael.min.js"></script>
    <script src="/admin/vendor/morrisjs/morris.min.js"></script>
    <!-- <script src="../data/morris-data.js"></script>  -->

    <!-- Custom Theme JavaScript -->
    <script src="/admin/js/admin.js"></script>	

    <!-- Scripts -->

</body>
</html>
