<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
<<<<<<< HEAD
        $this->call('StatusTableSeeder'); //oui
        $this->call('UsersTableSeeder'); //oui
        $this->call('IndustriesTableSeeder'); //oui
        $this->call('DepartmentsTableSeeder'); //oui
        $this->call('SettingsTableSeeder'); //oui
        $this->call('PermissionsTableSeeder'); //oui
        $this->call('RolesTablesSeeder'); //oui
        $this->call('RolePermissionTableSeeder'); //oui
        $this->call('UserRoleTableSeeder'); //oui
=======
        // Exécuter les seeders une seule fois
        $this->call('StatusTableSeeder');
        $this->call('UsersTableSeeder');
        $this->call('IndustriesTableSeeder');
        $this->call('DepartmentsTableSeeder');
        $this->call('SettingsTableSeeder');
        $this->call('PermissionsTableSeeder');
        $this->call('RolesTablesSeeder');
        $this->call('RolePermissionTableSeeder');
        $this->call('UserRoleTableSeeder');
>>>>>>> c6
    }
}
