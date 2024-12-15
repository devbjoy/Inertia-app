<?php

namespace App\Http\Controllers;

use App\Models\Listings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;


class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $listings = $request->user()->role !== 'suspended' ? $request->user()->listings()->paginate(5) : null;
        // $listings = Listings::with('user')->where('user_id',Auth::user()->id)->get();

        return Inertia::render('Dashboard',['listings' => $listings,'status' => session('status')]);
    }
}
