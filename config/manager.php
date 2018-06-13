<?php

return [

    /*
     * Laravel-admin name.
     */
    'name' => 'valiclub',

    /*
     * Logo in admin panel header.
     */
    'logo' => '<b>Valiclub</b>',

    /*
     * Mini-logo in admin panel header.
     */
    'logo-mini' => '<b>VC</b>',

    /*
     * Route configuration.
     */
    'route' => [

        'prefix' => 'manager',

        'namespace' => 'App\\Http\\Manager\\Controllers',

        //'middleware' => ['web', 'admin'],
        'middleware' => ['web', 'manager'],
    ],

    /*
     * Laravel-admin install directory.
     */
    'directory' => app_path('Http/Manager'),

    /*
     * Laravel-admin html title.
     */
    'title' => 'Manager',

    /*
     * Use `https`.
     */
    'secure' => false,

    /*
     * Laravel-admin auth setting.
     */

    'auth' => [
        'guards' => [
            'manager' => [
                'driver'   => 'session',
                'provider' => 'manager',
            ],
        ],

        'providers' => [
            'manager' => [
                'driver' => 'eloquent',
                //'model'  => Encore\Admin\Auth\Database\Administrator::class,
                'model'  => App\User::class,
            ],
        ],
    ],


    /*
     * Laravel-admin upload setting.
     */
    'upload' => [

        'disk' => 'admin',

        'directory' => [
            'image' => 'images',
            'file'  => 'files',
        ],
    ],

    /*
     * Laravel-admin database setting.
     */
    'database' => [

        // Database connection for following tables.
        'connection' => '',

        // User tables and model.
        //'users_table' => 'admin_users',
        'users_table' => 'users',
        'users_model' => Encore\Admin\Auth\Database\Administrator::class,
        
        'product_table' => 'products',
        'product_model' => App\Http\Manager\Auth\Database\Product::class,
        
        'image_table' => 'images',
        'image_model' => App\Http\Manager\Auth\Database\Image::class,

        // Role table and model.
        'roles_table' => 'users_roles',
        'roles_model' => GG\Admin\Member\Database\Role::class, // Encore\Admin\Auth\Database\Role::class,

        // Permission table and model.
        'permissions_table' => 'users_permissions',
        'permissions_model' => GG\Admin\Member\Database\Permission::class,

        // Menu table and model.
        'menu_table' => 'admin_menu',
        'menu_model' => GG\Admin\Member\Database\Menu::class,

        // Pivot table for table above.
        'operation_log_table'			=> 'admin_operation_log',
        'users_permissions_map'			=> 'users_permissions_map',
        'users_roles_map'				=> 'users_roles_map',
        'users_roles_permissions_map'	=> 'users_roles_permissions_map',
        'users_roles_menu_map'				=> 'users_roles_menu_map',
    ],

    /*
     * By setting this option to open or close operation log in laravel-admin.
     */
    'operation_log' => [

        'enable' => true,

        /*
         * Routes that will not log to database.
         *
         * All method to path like: admin/auth/logs
         * or specific method to path like: get:admin/auth/logs
         */
        'except' => [
            'admin/auth/logs*',
        ],
    ],

    /*
     * @see https://adminlte.io/docs/2.4/layout
     */
    'skin' => 'skin-blue-light',

    /*
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |
    |               | sidebar-mini                            |
    |---------------------------------------------------------|
     */
    'layout' => ['sidebar-mini', 'sidebar-collapse'],

    /*
     * Version displayed in footer.
     */
    'version' => '1.5.x-dev',

    /*
     * Settings for extensions.
     */
    'extensions' => [

    ],
];
