<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ListingsController;
use App\Http\Controllers\ProfileController;
use App\Http\Middleware\Admin;
use Illuminate\Support\Facades\Route;



Route::middleware(['auth'])->group(function(){
    Route::get('/dashboard',[DashboardController::class,'index'])->middleware('verified')->name('dashboard');
    Route::get('/profile',[ProfileController::class,'edit'])->middleware('password.confirm')->name('profile.edit');

   

    // update profile
    Route::patch('/profile',[ProfileController::class,'updateInfo'])->name('porfile.update');
    Route::put('/profile',[ProfileController::class,'updatePassword'])->name('profile.password');
    Route::delete('/profile',[ProfileController::class,'destroy'])->name('profile.delete');
});

// Listing route
Route::get('/', [ListingsController::class,'index'])->name('home');
Route::resource('listing',ListingsController::class)->except('index');

// Admin Route
Route::middleware(['auth','verified',Admin::class])->group(function(){
    Route::get('/admin',[AdminController::class,'index'])->name('admin.index');
    Route::put('/admin/{user}/role',[AdminController::class,'role'])->name('admin.role');
    Route::get('/admin/{user}',[AdminController::class,'show'])->name('admin.show');
    Route::put('/admin/{listing}/approve',[AdminController::class,'approve'])->name('admin.approve');
});


// Auth route
require __DIR__.'/auth.php';