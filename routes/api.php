<?php

use Illuminate\Http\Request;
<<<<<<< HEAD
=======
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\RestController;
use App\Http\Controllers\Api\DashboardController;
>>>>>>> c6

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

<<<<<<< HEAD
Route::group(['namespace' => 'App\Api\v1\Controllers'], function () {
    Route::group(['middleware' => 'auth:api'], function () {
        Route::get('users', ['uses' => 'UserController@index']);
    });
=======
// Routes publiques
Route::post('/login', [ApiController::class, 'login']);
Route::get('/clients', [ApiController::class, 'getAllClients']);
Route::get('/projects', [ApiController::class, 'getAllProjects']);
Route::get('/tasks', [ApiController::class, 'getAllTasks']);
Route::get('/offers', [ApiController::class, 'getAllOffers']);
Route::get('/invoices', [ApiController::class, 'getAllInvoices']);
Route::get('/payments', [ApiController::class, 'getAllPayments']);

// Dashboard Routes
Route::prefix('dashboard')->group(function () {
    Route::get('/clients/count', [DashboardController::class, 'getClientsCount']);
    Route::get('/projects/count', [DashboardController::class, 'getProjectsCount']);
    Route::get('/tasks/count', [DashboardController::class, 'getTasksCount']);
    Route::get('/offers/count', [DashboardController::class, 'getOffersCount']);
    Route::get('/invoices/count', [DashboardController::class, 'getInvoicesCount']);
    Route::get('/payments/count', [DashboardController::class, 'getPaymentsCount']);
    Route::get('/stats/payments', [DashboardController::class, 'getPaymentStats']);
    Route::get('/stats/projects', [DashboardController::class, 'getProjectStats']);
    Route::get('/stats/invoices', [DashboardController::class, 'getInvoiceStats']);
    Route::get('/{type}', [DashboardController::class, 'getDetails'])
        ->where('type', 'clients|projects|tasks|offers|invoices|payments');
    Route::get('payments/{external_id}', [\App\Http\Controllers\PaymentsController::class, 'getPaymentByExternalId']);
    Route::put('payments/{external_id}', [\App\Http\Controllers\PaymentsController::class, 'updatePayment']);
    Route::delete('payments/{external_id}', [\App\Http\Controllers\PaymentsController::class, 'deletePayment']);
});

// Routes protégées
Route::middleware('auth:sanctum')->group(function () {
});

Route::group([], function () {
    Route::get('/users', [RestController::class, 'getAllUsers']);
    Route::get('/users/{id}', [RestController::class, 'getUserById']);
    Route::get('/clients', [RestController::class, 'getAllClients']);
    Route::get('/clients/{id}', [RestController::class, 'clientShow']);
    Route::get('/leads', [RestController::class, 'getAllLeads']);
>>>>>>> c6
});
