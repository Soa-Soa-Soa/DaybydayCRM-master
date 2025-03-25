<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use App\Models\Client;
use App\Models\Project;
use App\Models\Task;
use App\Models\Offer;
use App\Models\Invoice;
use App\Models\Payment;
use App\Models\User;
use App\Models\Status;
use App\Models\InvoiceLine;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;

class DashboardController extends Controller
{
    /**
     * Get count of clients
     */
    public function getClientsCount(): JsonResponse
    {
        $count = Client::count();
        Log::info('Nombre de clients: ' . $count);
        return response()->json($count);
    }

    /**
     * Get count of projects
     */
    public function getProjectsCount(): JsonResponse
    {
        return response()->json(Project::count());
    }

    /**
     * Get count of tasks
     */
    public function getTasksCount(): JsonResponse
    {
        return response()->json(Task::count());
    }

    /**
     * Get count of offers
     */
    public function getOffersCount(): JsonResponse
    {
        return response()->json(Offer::count());
    }

    /**
     * Get count of invoices
     */
    public function getInvoicesCount(): JsonResponse
    {
        return response()->json(Invoice::count());
    }

    /**
     * Get count of payments
     */
    public function getPaymentsCount(): JsonResponse
    {
        return response()->json(Payment::count());
    }

    /**
     * Get details by type
     */
    public function getDetails(string $type): JsonResponse
    {
        try {
            switch ($type) {
                case 'clients':
                    $clients = Client::all();
                    $result = $clients->map(function ($client) {
                        return [
                            'client' => $client,
                            'contactInfo' => $client->contacts()->get(),
                            'user' => User::with('department')->where('id', $client->user_id)->first()
                        ];
                    });
                
                    return response()->json($result);
                    break;
                case 'projects':
                    $projects = Project::all();
                    $result = $projects->map(function ($project) {
                        return [
                            'project' => $project,
                            'status' => Status::where('id', $project->status_id)->first(),
                            'user' => User::with('department')->where('id', $project->user_id)->first(),
                            'client' => Client::where('id', $project->client_id)->first()
                        ];
                    });
                
                    return response()->json($result);
                    break;
                case 'tasks':
                    $tasks = Task::all();
                    $result = $tasks->map(function ($task) {
                        return [
                            'task' => $task,
                            'status' => Status::where('id', $task->status_id)->first(),
                            'user' => User::with('department')->where('id', $task->user_assigned_id)->first(),
                            'client' => Client::where('id', $task->client_id)->first(),
                            'project' => Project::where('id', $task->project_id)->first()
                        ];
                    });
                
                    return response()->json($result);
                    break;
                case 'offers':
                    $offers = Offer::all();
                    $result = $offers->map(function ($offer) {
                        $invoice = $offer->invoice()->first();
                        $line = InvoiceLine::where('invoice_id', $invoice->id)->first();
                        return [
                            'offer' => $offer,
                            'amount' => $line->getPriceConvertedAttribute()
                        ];
                    });

                    return response()->json($result);
                    break;
                case 'invoices':
                    $invoices = Invoice::all();
                    $result = $invoices->map(function ($invoice) {
                        return [
                            'invoice' => $invoice,
                            'amount' => $invoice->getTotalPriceAttribute()->getAmount(),
                            'client' => Client::where('id', $invoice->client_id)->first(),
                            'lines' => InvoiceLine::where('invoice_id', $invoice->id)->get(),
                            'lineNumber' => InvoiceLine::where('invoice_id', $invoice->id)->count()
                        ];
                    });
                
                    return response()->json($result);
                    break;
                case 'payments':
                    $payments = Payment::all();
                    $result = $payments->map(function ($payment) {
                        return [
                            'payment' => $payment,
                            'invoice' => Invoice::where('id', $payment->invoice_id)->first()
                        ];
                    });
                
                    return response()->json($result);
                    break;
            }
            
            return response()->json($result);
        } catch (\Exception $e) {
            Log::error('Erreur lors de la récupération des détails:', [
                'type' => $type,
                'error' => $e->getMessage()
            ]);
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function getPaymentStats()
    {
        $payments = Payment::selectRaw('MONTH(payment_date) as month, SUM(amount) as total')
            ->whereYear('payment_date', date('Y'))
            ->groupBy('month')
            ->get();
        return response()->json($payments);
    }
    
    public function getProjectStats()
    {
        $projects = Project::join('statuses', 'projects.status_id', '=', 'statuses.id')
            ->selectRaw('COALESCE(statuses.title, "Non défini") as status, COUNT(*) as count')
            ->groupBy('statuses.title')
            ->get()
            ->map(function($item) {
                return [
                    'status' => $item->status,
                    'count' => (int)$item->count
                ];
            });
        return response()->json($projects);
    }

    public function getInvoiceStats()
    {
        $invoices = Invoice::selectRaw('MONTH(created_at) as month, COUNT(*) as count')
            ->whereYear('created_at', date('Y'))
            ->groupBy('month')
            ->orderBy('month')
            ->get()
            ->map(function($item) {
                return [
                    'month' => (int)$item->month,
                    'count' => (int)$item->count
                ];
            });
        return response()->json($invoices);
    }
}