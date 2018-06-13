<?php

namespace App\Http\Manager\Controllers;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

use App\Http\Manager\Controllers\Dashboard;
use App\Http\Manager\Facades\Manager;
use App\Http\Manager\Layout\Column;
use App\Http\Manager\Layout\Content;
use App\Http\Manager\Layout\Row;

//use Illuminate\Foundation\Auth\AuthenticatesUsers;

class DashboardController extends Controller
{
    
    //use AuthenticatesUsers;
    
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //echo "here"; exit;
        //return view('home'); 
        
        return Manager::content(function (Content $content) {
        
            $content->header('Dashboard');
            $content->description('Description...');
        
            $content->row(Dashboard::title());
        
            $content->row(function (Row $row) {
        
                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::environment());
                });
        
                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });
        
                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            });
        });
        
    }
}
