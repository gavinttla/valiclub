<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
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

        return view('admin.home');
    }
    
    
    public function listuser()
    {
    	
    	echo "here";
    	
    }
    
    public function show()
    {
    	echo "show user3";
    }
    
    public function addcredit()
    {
    	echo "add credit";
    }    
    
}
