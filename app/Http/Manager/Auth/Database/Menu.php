<?php

namespace App\Http\Manager\Auth\Database;

use App\Http\Manager\Traits\AdminBuilder;
use App\Http\Manager\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Facades\DB;

/**
 * Class Menu.
 *
 * @property int $id
 *
 * @method where($parent_id, $id)
 */
class Menu extends Model
{
    use AdminBuilder, ModelTree {
        ModelTree::boot as treeBoot;
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['parent_id', 'order', 'title', 'icon', 'uri'];

    /**
     * Create a new Eloquent model instance.
     *
     * @param array $attributes
     */
    public function __construct(array $attributes = [])
    {
        /*
        $connection = config('admin.database.connection') ?: config('database.default');

        $this->setConnection($connection);

        $this->setTable(config('admin.database.menu_table'));

        parent::__construct($attributes);
        */
    }

    /**
     * A Menu belongs to many roles.
     *
     * @return BelongsToMany
     */
    public function roles() : BelongsToMany
    {
        $pivotTable = config('admin.database.role_menu_table');

        $relatedModel = config('admin.database.roles_model');

        return $this->belongsToMany($relatedModel, $pivotTable, 'menu_id', 'role_id');
    }

    /**
     * @return array
     */
    public function allNodes() : array
    {
        /*
        $orderColumn = DB::getQueryGrammar()->wrap($this->orderColumn);
        $byOrder = $orderColumn.' = 0,'.$orderColumn;

        return static::with('roles')->orderByRaw($byOrder)->get()->toArray();
        */

        $arrResult = array();

        $arrResult[] = array(
                'id' => 1,
                'parent_id' => 0,
                'order' => 1,
                'title' => 'Dashboard',
                'icon' => 'fa-home',
                'uri' => '/',
                'created_at' => null,
                'updated_at' => null,
                'roles' => array('buyer', 'seller')
                );

        $arrResult[] = array(
                'id' => 2,
                'parent_id' => 0,
                'order' => 2,
                'title' => 'Products',
                'icon' => 'fa-gift',
                'uri' => '/auth/product',
                'created_at' => null,
                'updated_at' => null,
                'roles' => array('buyer', 'seller')
                );

        $arrResult[] = array(
                'id' => 3,
                'parent_id' => 0,
                'order' => 3,
                'title' => 'Seller',
                'icon' => 'fa-university',
                'uri' => null,
                'created_at' => null,
                'updated_at' => null,
                'roles' => array('buyer', 'seller')
                );

        $arrResult[] = array(
                'id' => 4,
                'parent_id' => 3,
                'order' => 3,
                'title' => 'Listing',
                'icon' => 'fa-bars',
                'uri' => '/auth/sellerproduct',
                'created_at' => null,
                'updated_at' => null,
                'roles' => array('buyer', 'seller')
        );

        $arrResult[] = array(
            'id' => 5,
            'parent_id' => 3,
            'order' => 4,
            'title' => 'Billing',
            'icon' => 'fa-envelope-open-o',
            'uri' => '/auth/sellerproduct',
            'created_at' => null,
            'updated_at' => null,
            'roles' => array('buyer', 'seller')
        );

        $arrResult[] = array(
                'id' => 6,
                'parent_id' => 0,
                'order' => 4,
                'title' => 'Orders',
                'icon' => 'fa-shopping-cart',
                'uri' => '/auth/order',
                'created_at' => null,
                'updated_at' => null,
                'roles' => array('buyer', 'seller')
            );


        $arrResult[] = array(
                'id' => 7,
                'parent_id' => 0,
                'order' => 5,
                'title' => 'Message',
                'icon' => 'fa-paper-plane-o',
                'uri' => '/auth/message',
                'created_at' => null,
                'updated_at' => null,
                'roles' => array('buyer', 'seller')
            );



        return $arrResult;


    }

    /**
     * Detach models from the relationship.
     *
     * @return void
     */
    protected static function boot()
    {
        static::treeBoot();

        static::deleting(function ($model) {
            $model->roles()->detach();
        });
    }
}
