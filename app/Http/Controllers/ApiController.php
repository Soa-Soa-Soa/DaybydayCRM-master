<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Client;
use App\Models\Project;
use App\Models\Task;
use App\Models\Offer;
use App\Models\Invoice;
use App\Models\Payment;
use Illuminate\Support\Facades\Log;

class ApiController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'status' => 'success',
                'token' => $token,
                'user' => $user
            ]);
        }

        return response()->json([
            'status' => 'error',
            'message' => 'Invalid credentials'
        ], 401);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllClients(){
        $clients = Client::all();
        return response()->json($clients);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllProjects(){
        $projects = Project::with('client')->get();
        return response()->json($projects);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllTasks(){
        $tasks = Task::all();
        return response()->json($tasks);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllOffers(){
        $offers = Offer::all();
        return response()->json($offers);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllInvoices(){
        $invoices = Invoice::all();
        return response()->json($invoices);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllPayments(){
        $payments = Payment::all();
        return response()->json($payments);
    }

    public function updatePayment(Request $request, $id) {
        $payment = Payment::findOrFail($id);
        $payment->update($request->all());
        return response()->json(['message' => 'Paiement mis à jour avec succès']);
    }

    public function deletePayment($id) {
        $payment = Payment::findOrFail($id);
        $payment->delete();
        return response()->json(['message' => 'Paiement supprimé avec succès']);
    }
}