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
        $this->call('StatusTableSeeder'); //oui
        $this->call('UsersTableSeeder'); //oui
        $this->call('IndustriesTableSeeder'); //oui
        $this->call('DepartmentsTableSeeder'); //oui
        $this->call('SettingsTableSeeder'); //oui
        $this->call('PermissionsTableSeeder'); //oui
        $this->call('RolesTablesSeeder'); //oui
        $this->call('RolePermissionTableSeeder'); //oui
        $this->call('UserRoleTableSeeder'); //oui
    }
}
