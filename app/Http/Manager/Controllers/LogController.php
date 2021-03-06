<?php

namespace App\Http\Manager\Controllers;

use App\Http\Manager\Auth\Database\Administrator;
use App\Http\Manager\Auth\Database\OperationLog;
use App\Http\Manager\Facades\Manager;
use App\Http\Manager\Grid;
use App\Http\Manager\Layout\Content;
use Illuminate\Routing\Controller;

class LogController extends Controller
{
    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Manager::content(function (Content $content) {
            $content->header(trans('admin.operation_log'));
            $content->description(trans('admin.list'));

            $grid = Manager::grid(OperationLog::class, function (Grid $grid) {
                $grid->model()->orderBy('id', 'DESC');

                $grid->id('ID')->sortable();
                $grid->user()->name('User');
                $grid->method()->display(function ($method) {
                    $color = array_get(OperationLog::$methodColors, $method, 'grey');

                    return "<span class=\"badge bg-$color\">$method</span>";
                });
                $grid->path()->label('info');
                $grid->ip()->label('primary');
                $grid->input()->display(function ($input) {
                    $input = json_decode($input, true);
                    $input = array_except($input, ['_pjax', '_token', '_method', '_previous_']);
                    if (empty($input)) {
                        return '<code>{}</code>';
                    }

                    return '<pre>'.json_encode($input, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE).'</pre>';
                });

                $grid->created_at(trans('admin.created_at'));

                $grid->actions(function (Grid\Displayers\Actions $actions) {
                    $actions->disableEdit();
                });

                $grid->disableCreation();

                $grid->filter(function ($filter) {
                    $filter->equal('user_id', 'User')->select(Administrator::all()->pluck('name', 'id'));
                    $filter->equal('method')->select(array_combine(OperationLog::$methods, OperationLog::$methods));
                    $filter->like('path');
                    $filter->equal('ip');
                });
            });

            $content->body($grid);
        });
    }

    public function destroy($id)
    {
        $ids = explode(',', $id);

        if (OperationLog::destroy(array_filter($ids))) {
            return response()->json([
                'status'  => true,
                'message' => trans('admin.delete_succeeded'),
            ]);
        } else {
            return response()->json([
                'status'  => false,
                'message' => trans('admin.delete_failed'),
            ]);
        }
    }
}
