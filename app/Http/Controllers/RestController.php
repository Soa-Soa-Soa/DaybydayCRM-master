<?php

namespace App\Http\Controllers;

use App\Http\Controllers\UsersController;
use App\Http\Controllers\ClientsController;
use App\Models\Client;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Setting;
use App\Models\Status;
use App\Models\Integration;
use App\Models\Invoice;
use App\Models\Lead;
use App\Models\Project;
use App\Models\Task;
use App\Services\Storage\GetStorageProvider;

class RestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getAllUsers()
    {
        $users = User::all();
        return response()->json($users);
    }

    /**
     * Display a listing of the resource.
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function getUserById($id)
    {
        $userController = new UsersController();
        $user = $userController->findByExternalId($id);
        return response()->json($user);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllClients()
    {
        $clients = Client::all();
        return response()->json($clients);
    }

    /**
     * Display a listing of the resource.
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function getClientById($id)
    {
        $clientController = new ClientsController();
        $client = $clientController->findByExternalId($id);
        return response()->json($client);
    }

    /**
     * Display a listing of the resource.
     * @param  string  $external_id
     * @return \Illuminate\Http\Response
     */
    public function clientShow($external_id)
    {
        // Récupérer le client avec l'ID externe
        $clientController = new ClientsController();
        
        $client = $clientController->findByExternalId($external_id);
    
        // Vérifier si le client existe
        if (!$client) {
            return response()->json(['error' => 'Client not found'], 404);
        }
    
        // Récupérer les données supplémentaires
        $user = User::with('department')->where('id', $client->user_id)->first();
        $contactInfo = $client->contacts()->get();
        $invoices = $clientController->getInvoices($client);
        $leads = Lead::with('status')->where('client_id', $client->id)->get();
        $projects = Project::with('status')->where('client_id', $client->id)->get();
        $recentAppointments = $client->appointments()
            ->orderBy('start_at', 'desc')
            ->where('end_at', '>', now()->subMonths(3))
            ->limit(7)
            ->get();
    
        // Retourner les données au format JSON
        return response()->json([
            'client' => $client,
            'contactInfo' => $contactInfo,
            'invoices' => $invoices,
            'user' => $user,
            'leads' => $leads,
            'projects' => $projects,
            'recent_appointments' => $recentAppointments
        ]);
    }

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function getAllLeads()
    {
        $leads = Lead::with('status')->get();
        return response()->json($leads);
    }

    
}
