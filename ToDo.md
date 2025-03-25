# Installation

[x] Requires
_Node 16
_PHP 17

[x] Create an empty database
_Create database MySql : forge

[x] Config
_Change database config for Mysql : config/database
_Create file .env
_Copy .env.example to .env

[x] Commande
_Clear db : php artisan migrate:fresh --seed
_Add admin (first) : php artisan db:seed 
_Dummy data : php artisan db:seed --class=DummyDatabaseSeeder

# Prise en main

## Debug

[x] Error 404 
_Delete Project from : http://127.0.0.1:8000/projects :
    -Function destroy in controller/ProjectsController :
        return redirect()->back(); => return redirect()->route('projects.index');

[x] Error upload file
_In config/filesystems :
    -default : 's3' => default : 'public'

[x] User duplicate entry
_In UsersController : 
    -Add a try/catch block :
        try{
            $user->save();
        }
        catch (Exception $e) {
            Session::flash('flash_message', __('Email '.$user->email.' already exists.'));
            return view('users.create')
            ->withRoles($this->allRoles()->pluck('display_name', 'id'))
            ->withDepartments(Department::pluck('name', 'id'));
        }

[x] Redirect error 
_Redirection error after absence destroy
    -return response("OK"); => Session::flash('flash_message', __('Absence      deleted'));
    return redirect()->back();

## New functions
[] Data import
_Create function for importing data from csv files

[x] Reinit db
_Create script sql to reset data

[x] Extract table
_Extract table from db



[x] Payment verification
-Verify if amount requested is not greater tahn amount due
-Add an error message if amount requested is greater than tahn amount due

## functions
[] Delete all data
    -create new controller datacontroller for the function
    -create new route for the function
    -create button clear data 
[] Data import
    -install php extension
    -create new migration for table authorizations
    -create function import file : csv, xlx, ...
    -create new navigation import data
    -create new page for data import
    -create button import function
[] Generate data
    -create function generate data in datacontroller
    -create new navigation generate data 
    -create new page for data generate
    -create button generate function 
    -configure root(redirection controller, get function in datacontroller)


### Create API configuration
[] Create API configuration
    -import routes/api.php

### Login with NewApp
[] Login with NewApp
    -create new page for login with NewApp
    -edit app.php (provider)
    -add middleware Sanctum in kernel.php
    -create class Model PersonalAccessToken
    -Modif AppServiceProvider

[x] Configuration de base
    - [x] Installation de Sanctum
    - [x] Publication des configurations
    - [x] Migration des tables

[x] Modèles et Controllers
    - [x] Création du modèle PersonalAccessToken
    - [x] Modification du modèle User
    - [x] Configuration du ApiController

[x] Configuration
    - [x] Configuration de Sanctum (sanctum.php)
    - [x] Modification de AppServiceProvider
    - [x] Configuration des routes API

[x] Sécurité
    - [x] Middleware Sanctum dans Kernel.php
    - [x] Configuration CORS pour l'API
    - [x] Gestion des tokens d'authentification

[] New App
    _[] Dashboard
        - [x] Client data
        - [] Project
        - Task
        - Offer
        - Invoice
        - Payment
        - 3 Graphics
        - Total type data
            . Details on clique
            . Details update
                > Update payment amount
                > Delete payment
    _[] Reduction rate
        - Add a global rate for invoice



# Implémentation du système de remise globale

## 1. Migrations ✅
- [x] Créer migration pour la table `global_configs`
- [x] Créer migration pour ajouter les champs de remise à la table `invoices`
- [ ] Exécuter les migrations : `php artisan migrate`

## 2. Modèles ✅
- [x] Créer le modèle `GlobalConfig`
- [x] Modifier le modèle [Invoice](cci:2://file:///d:/CRM-Final/DaybydayCRM-master/app/Models/Invoice.php:20:0-196:1) (ajout des champs et méthode calculateTotal)

## 3. Contrôleurs à créer
- [ ] Créer `ConfigController` avec :
  - [ ] Méthode `getDiscountConfig()`
  - [ ] Méthode `updateDiscountConfig()`
- [ ] Modifier `InvoiceController` :
  - [ ] Ajouter méthode `toggleDiscount()`
  - [ ] Mettre à jour les méthodes create/update pour gérer les remises

## 4. Routes API à ajouter
- [ ] Routes pour la configuration :
  ```php
  Route::prefix('config')->group(function () {
      Route::get('/discount', [ConfigController::class, 'getDiscountConfig']);
      Route::post('/discount', [ConfigController::class, 'updateDiscountConfig']);
  });

## 5. Interface utilisateur (Vue/Templates)
-[ ] Créer page de configuration des remises
-[ ] Ajouter switch pour activer/désactiver la remise sur le formulaire de facture
-[ ] Ajouter affichage des informations de remise sur la vue détaillée des factures




