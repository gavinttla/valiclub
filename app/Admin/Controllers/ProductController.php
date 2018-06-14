<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Manager\Auth\Database\Product;

use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Grid;
use Encore\Admin\Form;

use Encore\Admin\Controllers\ModelForm;



class ProductController extends Controller
{

    use ModelForm;

    public function index()
    {
        return Admin::content(function (Content $content) {
            $content->header(trans('admin.product'));
            $content->description(trans('admin.product_list'));
            $content->body($this->grid()->render());
        });
    }





    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        //dd(Auth::user()->id);

        return Admin::grid(Product::class, function (Grid $grid) {

            //$grid->id('ID')->sortable();

            //$grid->model()->where('is_approved', '=', 1)
            //->where('is_active', '=', 1);


            $grid->product_name(trans('manager.product_name'))->display(function($name){
                return "<a href='" . $this->url . "' target='_blank'>" . str_limit($name, 80) . "</a>";

            })->sortable();

            $grid->user_id(trans('manager.username'))->display(function($user_id){
                return "<a href='" . $this->url . "' target='_blank'>" . str_limit($user_id, 80) . "</a>";

            })->sortable();

            $grid->price(trans('manager.price'))->sortable();


            $grid->total(trans('manager.total'))->sortable();
            $grid->total_left(trans('manager.total_left'))->sortable();

            $grid->is_approved(trans('manager.approve'))->display(function($value){
                return empty($value) ? trans('manager.approved') : trans('manager.approved_not');
            });



            $grid->disableCreateButton();
            $grid->disableExport();

            $grid->actions(function (Grid\Displayers\Actions $actions) {
                if ($actions->row->slug == 'administrator') {
                    $actions->disableDelete();
                }
            });

                $grid->tools(function (Grid\Tools $tools) {

                    $tools->batch(function (Grid\Tools\BatchActions $actions) {
                        $actions->disableDelete();

                    });

                });

                    $grid->filter(function ($filter){



                    });


        });
    }










}
