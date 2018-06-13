<?php

namespace App\Http\Controllers\Admin;



use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdminController extends Controller
{
    //
    
    
	public $layout = 'layouts.ggadmin3';
	
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        
        $var = config('ggdev.ggname');
        
        //dd($var);
        
    	//dd(App::getLocale());
        //return "here2";
        return view('admin.home');
    }
    
    public function login()
    {
        
        
        
        
    }
    
    
    public function listUser()
    {
    	
    	echo "here";
    	
    }
    
}
