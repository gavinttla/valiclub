<?php

namespace App\Http\Manager\Auth\Database;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class Image extends Model
{
    /**
     * @var array
     */
    protected $fillable = ['name', 'slug', 'http_method', 'http_path'];
    
    /**
     * @var array
     */
    public static $httpMethods = [
        'GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS', 'HEAD',
    ];
    
    /**
     * Create a new Eloquent model instance.
     *
     * @param array $attributes
     */
    public function __construct(array $attributes = [])
    {

        $this->setTable(config('admin.database.permissions_table'));
        
        parent::__construct($attributes);
    }
    
    /**
     * Permission belongs to many roles.
     *
     * @return BelongsToMany
     */
    public function roles() : BelongsToMany
    {
        $pivotTable = config('admin.database.role_permissions_table');
        
        $relatedModel = config('admin.database.roles_model');
        
        return $this->belongsToMany($relatedModel, $pivotTable, 'permission_id', 'role_id');
    }
    

    /**
     * Detach models from the relationship.
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        
        static::deleting(function ($model) {
            $model->roles()->detach();
        });
    }
}
