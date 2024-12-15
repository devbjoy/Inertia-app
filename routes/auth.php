<?php

use App\Http\Controllers\Auth\AuthenticateController;
use App\Http\Controllers\Auth\ConfirmPasswordController;
use App\Http\Controllers\Auth\EmailVerificationController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\ResetPasswordController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest')->group(function(){
    // Register route
    Route::get('/register',[RegisterController::class,'create'])->name('register');
    Route::post('/register',[RegisterController::class,'store']);

    // Login route
    Route::get('/login',[AuthenticateController::class,'create'])->name('login');
    Route::post('/login',[AuthenticateController::class,'store']);

    // reset password route
    Route::get('/forgot-password', [ResetPasswordController::class,'resetPasword'])->name('password.request');
    Route::post('/forgot-password', [ResetPasswordController::class,'sendEmail'])->name('password.email');
    Route::get('/reset-password/{token}',[ResetPasswordController::class,'resetForm'])->name('password.reset');
    Route::post('/reset-password',[ResetPasswordController::class,'changePassword'])->name('password.update');
});

Route::middleware('auth')->group(function(){
    // logout route
    Route::post('/logout',[AuthenticateController::class,'logout'])->name('logout');

    // email verification route
    Route::get('/email/verify',[EmailVerificationController::class,'notice'])->name('verification.notice');
    Route::get('/email/verify/{id}/{hash}', [EmailVerificationController::class,'handler'])
    ->middleware('signed')->name('verification.verify');
    Route::post('/email/verification-notification', [EmailVerificationController::class,'resend'])
    ->middleware('throttle:6,1')->name('verification.send');

    // password confirmation
    Route::get('/confirm-password',[ConfirmPasswordController::class,'index'])->name('password.confirm');
    Route::post('/confirm-password',[ConfirmPasswordController::class,'store'])->middleware(['throttle:6,1']);

    
});