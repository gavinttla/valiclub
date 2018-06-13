<?php

namespace App\Http\Manager\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * Class Admin.
 *
 * @method static \App\Http\Manager\Grid grid($model, \Closure $callable)
 * @method static \App\Http\Manager\Form form($model, \Closure $callable)
 * @method static \App\Http\Manager\Tree tree($model, \Closure $callable = null)
 * @method static \App\Http\Manager\Layout\Content content(\Closure $callable = null)
 * @method static \Illuminate\Contracts\View\Factory|\Illuminate\View\View|void css($css = null)
 * @method static \Illuminate\Contracts\View\Factory|\Illuminate\View\View|void js($js = null)
 * @method static \Illuminate\Contracts\View\Factory|\Illuminate\View\View|void script($script = '')
 * @method static \Illuminate\Contracts\Auth\Authenticatable|null user()
 * @method static string title()
 * @method static void navbar(\Closure $builder = null)
 * @method static void registerAuthRoutes()
 * @method static void extend($name, $class)
 */
class Manager extends Facade
{
    protected static function getFacadeAccessor()
    {
        return \App\Http\Manager\Manager::class;
        //return 'manager';
    }
}
