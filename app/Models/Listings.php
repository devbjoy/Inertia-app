<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;

class Listings extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeFilter($query,array $filters)
    {
        // filter by search keyword
        if($filters['search'] ?? false){
            $query->where(function($q){
                $q->where('title','like','%'.request('search').'%')
                ->orWhere('desc','like','%'.request('search').'%');
            });  
        }

        // filter by user
        if($filters['user_id'] ?? false){
            $query->where('user_id',request('user_id'));
        }

        // filter by tag
        if($filters['tag'] ?? false){
            $query->where('tags','like','%'.request('tag').'%');
        }

        // filter by approved

        if($filters['disapproved'] ?? false){
            $query->where('approved',false);
        }
    }

}
