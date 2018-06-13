<?php

namespace App\Http\Manager\Auth\Database;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    protected $fillable = ['product_name', 'user_id', 'price', 'url', 'total', 'memo'];
    
    /**
     * Create a new Eloquent model instance.
     *
     * @param array $attributes
     */
    public function __construct(array $attributes = [])
    {

        $this->setTable(config('manager.database.product_table'));
        
        parent::__construct($attributes);
    }
    
    /**
     * A role belongs to many users.
     *
     * @return BelongsToMany
     */
    public function administrators() : BelongsToMany
    {
        $pivotTable = config('admin.database.role_users_table');
        
        $relatedModel = config('admin.database.users_model');
        
        return $this->belongsToMany($relatedModel, $pivotTable, 'role_id', 'user_id');
    }
    
    /**
     * A role belongs to many permissions.
     *
     * @return BelongsToMany
     */
    public function images() : HasMany
    {
        $pivotTable = config('manager.database.image_table');
        
        $relatedModel = config('manager.database.image_model');
        
        //return $this->belongsToMany($relatedModel, $pivotTable, 'role_id', 'permission_id');
        return $this->hasMany($relatedModel, 'product_id', 'id');
    }
    
    /**
     * A role belongs to many permissions.
     *
     * @return BelongsToMany
     */
    public function imagesOld() : BelongsToMany
    {
        $pivotTable = config('manager.database.image_table');
        
        $relatedModel = config('manager.database.image_model');
        
        //return $this->belongsToMany($relatedModel, $pivotTable, 'role_id', 'permission_id');
        return $this->belongsToMany($relatedModel, $pivotTable, 'role_id', 'permission_id');
    }
    
    
    /**
     * Check user has permission.
     *
     * @param $permission
     *
     * @return bool
     */
    public function can(string $permission) : bool
    {
        return $this->permissions()->where('slug', $permission)->exists();
    }
    
    /**
     * Check user has no permission.
     *
     * @param $permission
     *
     * @return bool
     */
    public function cannot(string $permission) : bool
    {
        return !$this->can($permission);
    }
    
    /**
     * Detach models from the relationship.
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();
        
        /*
        static::deleting(function ($model) {
            $model->administrators()->detach();
            
            $model->permissions()->detach();
        });
        */
    }
}
