<?php


use Illuminate\Routing\Router;
//use App\Admin\Controllers\ProductController;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->resource('product', ProductController::class);

    $router->get('/', 'HomeController@index');

});

