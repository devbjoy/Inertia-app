<?php

namespace App\Http\Controllers;

use App\Models\Listings;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Request as FacadesRequest;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

class AdminController extends Controller
{
    public function index(Request $request)
    {
        $users = User::with('listings')
        ->filter(request(['search','user_role']))
        ->paginate(6)
        ->withQueryString();

        return Inertia::render('Admin/AdminDashboard',[
            'users' => $users,
            'status' => Session('status'),
        ]);
    }

    public function role(Request $request, User $user)
    {
        $validate = $request->validate([
            'role' => 'required|string'
        ]);

        $user->update(['role' => $request->role]);

        return redirect()->route('admin.index')->with('status',"User role change {$request->role} successfully");
  
    }


    public function show(User $user)
    {
        $user_listings = $user->listings()
                                ->filter(request(['search','disapproved']))
                                ->latest()
                                ->paginate(6)
                                ->withQueryString();

        return Inertia::render('Admin/Show',[
            'user' => $user,
            'listings' => $user_listings,
            'status' => Session('status')
        ]);
    }

    public function approve(Listings $listing)
    {
        $listing->update(['approved' => !$listing->approved]);

        $msg = $listing->approved ? 'Approved' : 'Disapproved';
        return back()->with('status',"Listing {$msg} Successfully!");
    }
}
