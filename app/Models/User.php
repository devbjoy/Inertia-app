<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function listings()
    {
        return $this->hasMany(Listings::class);
    }

    public function scopeFilter($query,array $filters)
    {
        // filter by search keyword
        if($filters['search'] ?? false){
            $query->where(function($q){
                $q->where('name','like','%'.request('search').'%')
                ->orWhere('email','like','%'.request('search').'%');
            });  
        }

        if($filters['user_role'] ?? false){
            $query->where('role',request('user_role'));
        }
    }
}
