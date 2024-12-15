<?php

namespace App\Policies;

use App\Models\Listings;
use App\Models\User;
use Illuminate\Auth\Access\Response;
use Illuminate\Support\Facades\Auth;

class ListingsPolicy
{
    

    /**
     * Determine whether the user can view the model.
     */
    public function view(?User $user, $listing): bool
    {
        // dd($listings);
        // return $listing->user->role !== 'general';
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        //
    }

    

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function modify(?User $user, $listing = null): bool
    {
        return Auth::user()->role !== 'suspended';
    }
}
