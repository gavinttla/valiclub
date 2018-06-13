<?php

use Illuminate\Routing\Router;

use App\Http\Manager\Facades\Manager;

Manager::registerAuthRoutes();

Route::group([
    'prefix'        => config('manager.route.prefix'),
    'namespace'     => config('manager.route.namespace'),
    'middleware'    => config('manager.route.middleware'),
], function (Router $router) {

    $router->get('/', 'DashboardController@index');

});
