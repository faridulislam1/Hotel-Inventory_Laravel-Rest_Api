<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HotelController;
use App\Http\Controllers\RoomController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BookController;
use App\Helpers\Routes\RouteHelper;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();

});

Route::get('/dashboard',[DashboardController::class,'index'])->name('dashboard');
Route::get('/add-room',[RoomController::class,'storeroom'])->name('store.room');
Route::post('/new-room',[RoomController::class,'saveroom'])->name('new.room');
Route::get('/manage-room',[RoomController::class,'manageProduct'])->name('manage.room');


Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
    Route::delete('/delete/{id}/', [AuthController::class, 'delete']);
    Route::delete('/destroy/{id}/', [AuthController::class, 'destroy']);
    Route::get('show/{id}', [AuthController::class, 'show']);
    Route::get('showroom/{id}', [AuthController::class, 'showroom']);
    Route::get('/search', [AuthController::class, 'search']);

//room info
    Route::get('/add-itenary',[AuthController::class,'storeroom'])->name('store.itenary');
    Route::post('/new-itenary',[AuthController::class,'saveroom'])->name('new.itenary');
    Route::get('/manage-itenary',[AuthController::class,'manageroom'])->name('manage.itenary');
    Route::get('/edit-room/{id}',[AuthController::class,'roomEdit'])->name('edit.room');
    Route::post('/destroy',[AuthController::class,'destroy'])->name('delete.room');
    Route::post('/update-room',[AuthController::class,'roomUpdate'])->name('update.room');
    Route::get('/product/detail/{id}',[AuthController::class,'detail'])->name('product.detail');
    Route::get('/search-hotel',[AuthController::class,'searchHotel'])->name('search.hotel');
    Route::get('/product/get-subcategory-by-category',[AuthController::class,'getSubCategoryByCategory'])->name('product.get-subcategory-by-category');
    Route::get('/product/hotel',[AuthController::class,'hotel'])->name('product.hotel');


//hotel info
    Route::get('/add-hotel',[AuthController::class,'storehotel'])->name('store.hotel');
    Route::post('/new-hotel',[AuthController::class,'savehotel'])->name('new.hotel');
    Route::get('/manage-product',[AuthController::class,'manageProduct'])->name('manage.product');
    Route::get('/edit-product/{id}',[AuthController::class,'productEdit'])->name('edit.product');
    Route::post('/delete-product/{id}',[AuthController::class,'productDelete'])->name('delete.product');
    Route::post('/update-product',[AuthController::class,'productUpdate'])->name('update.product');
    Route::get('/restricted-route',[AuthController::class, 'getBooks']);

   // passenger info

   Route::post('/create-passenger', [AuthController::class, 'createPassenger']);
   Route::get('/manage-passenger', [AuthController::class, 'managepassenger']);

   Route::get('/index', [AuthController::class, 'index']);

});

