<div class="sidebar-nav navbar-collapse">

    <ul class="nav" id="side-menu">
        <li class="sidebar-search">
            <div class="input-group custom-search-form">
                <input type="text" class="form-control" placeholder="{{ __('admin.search') }}...">
                <span class="input-group-btn">
                <button class="btn btn-default" type="button">
                    <i class="fa fa-search"></i>
                </button>
            </span>
            </div>
            <!-- /input-group -->
        </li>
        <li>
            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> {{ __('admin.dashboard') }}</a>
        </li>
        <li>
            <a href="#"><i class="fa fa-user-circle fa-fw"></i> {{ __('admin.user') }}<span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <li>
                    <a href="flot.html">{{ __('admin.create_user') }}</a>
                </li>
                <li>
                    <a href="flot.html">{{ __('admin.manage_user') }}</a>
                </li>
                <li>
                    <a href="flot.html">{{ __('admin.user_group') }}</a>
                </li>
                <li>
                    <a href="flot.html">{{ __('admin.user_permission') }}</a>
                </li>
            </ul>
            <!-- /.nav-second-level -->
        </li>
        <li>
            <a href="tables.html"><i class="fa fa-gift fa-fw"></i>{{ __('admin.promote_product') }}<span class="fa arrow"></span></a>
            
            <ul class="nav nav-second-level">
                <li>
                    <a href="flot.html">{{ __('admin.create_product') }}</a>
                </li>
                <li>
                    <a href="flot.html">{{ __('admin.manage_product') }}</a>
                </li>
            </ul>
                        
        </li>
        
    </ul>


</div>