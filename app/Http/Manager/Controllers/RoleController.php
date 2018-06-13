<?php

namespace App\Http\Manager\Controllers;

use App\Http\Manager\Auth\Database\Permission;
use App\Http\Manager\Auth\Database\Role;
use App\Http\Manager\Facades\Manager;
use App\Http\Manager\Form;
use App\Http\Manager\Grid;
use App\Http\Manager\Layout\Content;
use Illuminate\Routing\Controller;

class RoleController extends Controller
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
            $content->header(trans('admin.roles'));
            $content->description(trans('admin.list'));
            $content->body($this->grid()->render());
        });
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
            $content->header(trans('admin.roles'));
            $content->description(trans('admin.edit'));
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
            $content->header(trans('admin.roles'));
            $content->description(trans('admin.create'));
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
        return Manager::grid(Role::class, function (Grid $grid) {
            $grid->id('ID')->sortable();
            $grid->slug(trans('admin.slug'));
            $grid->name(trans('admin.name'));

            $grid->permissions(trans('admin.permission'))->pluck('name')->label();

            $grid->created_at(trans('admin.created_at'));
            $grid->updated_at(trans('admin.updated_at'));

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
        return Manager::form(Role::class, function (Form $form) {
            $form->display('id', 'ID');

            $form->text('slug', trans('admin.slug'))->rules('required');
            $form->text('name', trans('admin.name'))->rules('required');
            $form->listbox('permissions', trans('admin.permissions'))->options(Permission::all()->pluck('name', 'id'));

            $form->display('created_at', trans('admin.created_at'));
            $form->display('updated_at', trans('admin.updated_at'));
        });
    }
}