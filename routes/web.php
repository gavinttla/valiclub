<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});

Route::get('/homepage', 'HomeController@index')->name('homepage');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/logout', 'HomeController@logout')->name('logout');


// controller can put it into a sub folder, here is: admin
Route::get('/ggadmin', 'Admin\AdminController@index');


// the following for admin routes
Route::group(['prefix' => 'ggadmin', 'namespace' => 'Admin'], function () {

	// the following is hardcode one controller/admin
	Route::get('user/list', 'UserController@listUser');
	
	// execute login authentication
	Route::post('login', 'AdminController@login')->name('adminlogin');
	
	// execute logout
	Route::post('logout', 'AdminController@logout')->name('adminlogout');
	
});






