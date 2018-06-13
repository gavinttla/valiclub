<?php

namespace App\Http\Manager\Controllers;

use App\Http\Manager\Auth\Database\Permission;
use App\Http\Manager\Auth\Database\Product;
use App\Http\Manager\Facades\Manager;
use App\Http\Manager\Form;
use App\Http\Manager\Grid;
use App\Http\Manager\Layout\Content;
use Illuminate\Routing\Controller;

use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Manager::content(function (Content $content) {
            $content->header(trans('manager.product'));
            $content->description(trans('manager.product_list'));
            $content->body($this->grid()->render());
        });
    }



    public function sellerlist()
    {

        //dd('here');

        return Manager::content(function (Content $content) {
            $content->header(trans('manager.product'));
            $content->description(trans('manager.product_list'));
            $content->body($this->grid()->render());
        });


    }


    public function buyerlist()
    {


    }


    /**
     * Edit interface.
     *
     * @param $id
     *
     * @return Content
     */
    public function edit($id)
    {
        return Manager::content(function (Content $content) use ($id) {
            $content->header(trans('manager.product'));
            $content->description(trans('manager.edit'));
            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Manager::content(function (Content $content) {
            $content->header(trans('manager.product'));
            $content->description(trans('manager.create'));
            $content->body($this->form());
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

        return Manager::grid(Product::class, function (Grid $grid) {

            //$grid->id('ID')->sortable();

            $grid->model()->where('is_approved', '=', 1)
                          ->where('is_active', '=', 1);


            $grid->product_name(trans('manager.product_name'))->display(function($name){
                return "<a href='" . $this->url . "' target='_blank'>" . str_limit($name, 80) . "</a>";

            })->sortable();

            $grid->price(trans('manager.price'))->sortable();

            $grid->total(trans('manager.total'))->sortable();
            $grid->total_left(trans('manager.total_left'))->sortable();


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


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function gridSeller()
    {

        //dd(Auth::user()->id);

        return Manager::grid(Product::class, function (Grid $grid) {
            $grid->id('ID')->sortable();

            $grid->model()->where('user_id', '=', Auth::id())
            ->where('is_active', '=', 1);


            $grid->product_name(trans('manager.product_name'))->display(function($name){
                return "<a href='" . $this->url . "' target='_blank'>" . str_limit($name, 80) . "</a>";

            });

                $grid->price(trans('manager.price'));

                $grid->total(trans('manager.total'));
                $grid->total_left(trans('manager.total_left'));


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

        });
    }






    /**
     * Make a form builder.
     *
     * @return Form
     */
    public function form()
    {
        return Manager::form(Product::class, function (Form $form) {

            $form->display('id', 'ID');

            //dd($form->text("myname", 'myname'));

            $form->text('product_name', trans('manager.product_name'))->rules('required');
            $form->text('price', trans('manager.price'))->rules('required');
            $form->text('url', trans('manager.product_url'))->rules('required');
            $form->text('total', trans('manager.total'))->rules('required');

            $form->textarea('memo', trans('manager.memo'));

            //$form->listbox('permissions', trans('admin.permissions'))->options(Permission::all()->pluck('name', 'id'));

            $form->display('created_at', trans('admin.created_at'));
            $form->display('updated_at', trans('admin.updated_at'));

            $form->saving(function (Form $form) {

                $form->hidden('user_id');
                $form->user_id = Manager::user()->id;

                $form->hidden('total_left');
                $form->total_left = $form->total;

            });

        });
    }
}
