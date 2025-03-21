absences;
+---------------------+---------------------+------+-----+---------------------+-------------------------------+
| Field               | Type                | Null | Key | Default             | Extra                         |
+---------------------+---------------------+------+-----+---------------------+-------------------------------+
| id                  | bigint(20) unsigned | NO   | PRI | NULL                | auto_increment                |
| external_id         | varchar(255)        | NO   |     | NULL                |                               |
| reason              | varchar(255)        | NO   |     | NULL                |                               |
| comment             | text                | YES  |     | NULL                |                               |
| start_at            | timestamp           | NO   |     | current_timestamp() | on update current_timestamp() |
| end_at              | timestamp           | NO   |     | 0000-00-00 00:00:00 |                               |
| medical_certificate | tinyint(1)          | YES  |     | NULL                |                               |
| user_id             | int(10) unsigned    | YES  | MUL | NULL                |                               |
| created_at          | timestamp           | YES  |     | NULL                |                               |
| updated_at          | timestamp           | YES  |     | NULL                |                               |
+---------------------+---------------------+------+-----+---------------------+-------------------------------+

activities;
+-------------+---------------------+------+-----+---------+----------------+
| Field       | Type                | Null | Key | Default | Extra          |
+-------------+---------------------+------+-----+---------+----------------+
| id          | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)        | NO   |     | NULL    |                |
| log_name    | varchar(255)        | YES  |     | NULL    |                |
| causer_id   | bigint(20) unsigned | YES  |     | NULL    |                |
| causer_type | varchar(255)        | YES  |     | NULL    |                |
| text        | varchar(255)        | NO   |     | NULL    |                |
| source_type | varchar(255)        | NO   |     | NULL    |                |
| source_id   | bigint(20) unsigned | YES  |     | NULL    |                |
| ip_address  | varchar(64)         | NO   |     | NULL    |                |
| properties  | longtext            | YES  |     | NULL    |                |
| created_at  | timestamp           | YES  |     | NULL    |                |
| updated_at  | timestamp           | YES  |     | NULL    |                |
| deleted_at  | timestamp           | YES  |     | NULL    |                |
+-------------+---------------------+------+-----+---------+----------------+

appointments;
+-------------+---------------------+------+-----+---------+----------------+
| Field       | Type                | Null | Key | Default | Extra          |
+-------------+---------------------+------+-----+---------+----------------+
| id          | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)        | NO   |     | NULL    |                |
| title       | varchar(255)        | NO   |     | NULL    |                |
| description | varchar(255)        | YES  |     | NULL    |                |
| source_type | varchar(255)        | YES  | MUL | NULL    |                |
| source_id   | bigint(20) unsigned | YES  |     | NULL    |                |
| color       | varchar(10)         | NO   |     | NULL    |                |
| user_id     | int(10) unsigned    | NO   | MUL | NULL    |                |
| client_id   | int(10) unsigned    | YES  | MUL | NULL    |                |
| start_at    | timestamp           | YES  |     | NULL    |                |
| end_at      | timestamp           | YES  |     | NULL    |                |
| created_at  | timestamp           | YES  |     | NULL    |                |
| updated_at  | timestamp           | YES  |     | NULL    |                |
| deleted_at  | timestamp           | YES  |     | NULL    |                |
+-------------+---------------------+------+-----+---------+----------------+

business_hours;
+-------------+---------------------+------+-----+---------+----------------+
| Field       | Type                | Null | Key | Default | Extra          |
+-------------+---------------------+------+-----+---------+----------------+
| id          | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| day         | varchar(255)        | NO   |     | NULL    |                |
| open_time   | time                | YES  |     | NULL    |                |
| close_time  | time                | YES  |     | NULL    |                |
| settings_id | int(10) unsigned    | YES  | MUL | NULL    |                |
| created_at  | timestamp           | YES  |     | NULL    |                |
| updated_at  | timestamp           | YES  |     | NULL    |                |
+-------------+---------------------+------+-----+---------+----------------+

clients;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| id            | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id   | varchar(255)     | NO   |     | NULL    |                |
| address       | varchar(255)     | YES  |     | NULL    |                |
| zipcode       | varchar(255)     | YES  |     | NULL    |                |
| city          | varchar(255)     | YES  |     | NULL    |                |
| company_name  | varchar(255)     | NO   |     | NULL    |                |
| vat           | varchar(255)     | YES  |     | NULL    |                |
| company_type  | varchar(255)     | YES  |     | NULL    |                |
| client_number | bigint(20)       | YES  |     | NULL    |                |
| user_id       | int(10) unsigned | NO   | MUL | NULL    |                |
| industry_id   | int(10) unsigned | NO   | MUL | NULL    |                |
| deleted_at    | timestamp        | YES  |     | NULL    |                |
| created_at    | timestamp        | YES  |     | NULL    |                |
| updated_at    | timestamp        | YES  |     | NULL    |                |
+---------------+------------------+------+-----+---------+----------------+

comments;
+-------------+---------------------+------+-----+---------+----------------+
| Field       | Type                | Null | Key | Default | Extra          |
+-------------+---------------------+------+-----+---------+----------------+
| id          | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)        | NO   |     | NULL    |                |
| description | longtext            | YES  |     | NULL    |                |
| source_type | varchar(255)        | NO   | MUL | NULL    |                |
| source_id   | bigint(20) unsigned | NO   |     | NULL    |                |
| user_id     | int(10) unsigned    | NO   | MUL | NULL    |                |
| deleted_at  | timestamp           | YES  |     | NULL    |                |
| created_at  | timestamp           | YES  |     | NULL    |                |
| updated_at  | timestamp           | YES  |     | NULL    |                |
+-------------+---------------------+------+-----+---------+----------------+

contacts;
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| id               | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id      | varchar(255)     | NO   |     | NULL    |                |
| name             | varchar(255)     | NO   |     | NULL    |                |
| email            | varchar(255)     | NO   |     | NULL    |                |
| primary_number   | varchar(255)     | YES  |     | NULL    |                |
| secondary_number | varchar(255)     | YES  |     | NULL    |                |
| client_id        | int(10) unsigned | NO   | MUL | NULL    |                |
| is_primary       | tinyint(1)       | NO   |     | NULL    |                |
| deleted_at       | timestamp        | YES  |     | NULL    |                |
| created_at       | timestamp        | YES  |     | NULL    |                |
| updated_at       | timestamp        | YES  |     | NULL    |                |
+------------------+------------------+------+-----+---------+----------------+

department_user;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| id            | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| department_id | int(10) unsigned | NO   | MUL | NULL    |                |
| user_id       | int(10) unsigned | NO   | MUL | NULL    |                |
| created_at    | timestamp        | YES  |     | NULL    |                |
| updated_at    | timestamp        | YES  |     | NULL    |                |
+---------------+------------------+------+-----+---------+----------------+

departments;
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| id          | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)     | NO   |     | NULL    |                |
| name        | varchar(255)     | NO   |     | NULL    |                |
| description | text             | YES  |     | NULL    |                |
| created_at  | timestamp        | YES  |     | NULL    |                |
| updated_at  | timestamp        | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+

documents;
+-------------------+---------------------+------+-----+---------+----------------+
| Field             | Type                | Null | Key | Default | Extra          |
+-------------------+---------------------+------+-----+---------+----------------+
| id                | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| external_id       | varchar(255)        | NO   |     | NULL    |                |
| size              | varchar(255)        | NO   |     | NULL    |                |
| path              | varchar(255)        | NO   |     | NULL    |                |
| original_filename | varchar(255)        | NO   |     | NULL    |                |
| mime              | varchar(255)        | NO   |     | NULL    |                |
| integration_id    | varchar(255)        | YES  |     | NULL    |                |
| integration_type  | varchar(255)        | NO   |     | NULL    |                |
| source_type       | varchar(255)        | NO   | MUL | NULL    |                |
| source_id         | bigint(20) unsigned | NO   |     | NULL    |                |
| deleted_at        | timestamp           | YES  |     | NULL    |                |
| created_at        | timestamp           | YES  |     | NULL    |                |
| updated_at        | timestamp           | YES  |     | NULL    |                |
+-------------------+---------------------+------+-----+---------+----------------+

industries;
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| id          | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)     | NO   |     | NULL    |                |
| name        | varchar(255)     | NO   |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+

integrations;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| id            | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name          | varchar(255)     | NO   |     | NULL    |                |
| client_id     | int(11)          | YES  |     | NULL    |                |
| user_id       | int(11)          | YES  |     | NULL    |                |
| client_secret | int(11)          | YES  |     | NULL    |                |
| api_key       | varchar(255)     | YES  |     | NULL    |                |
| api_type      | varchar(255)     | YES  |     | NULL    |                |
| org_id        | varchar(255)     | YES  |     | NULL    |                |
| created_at    | timestamp        | YES  |     | NULL    |                |
| updated_at    | timestamp        | YES  |     | NULL    |                |
+---------------+------------------+------+-----+---------+----------------+

invoice_lines;
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| id          | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)     | NO   |     | NULL    |                |
| title       | varchar(255)     | NO   |     | NULL    |                |
| comment     | text             | NO   |     | NULL    |                |
| price       | int(11)          | NO   |     | NULL    |                |
| invoice_id  | int(10) unsigned | YES  | MUL | NULL    |                |
| offer_id    | int(10) unsigned | YES  | MUL | NULL    |                |
| type        | varchar(255)     | YES  |     | NULL    |                |
| quantity    | int(11)          | YES  |     | NULL    |                |
| product_id  | varchar(255)     | YES  |     | NULL    |                |
| created_at  | timestamp        | YES  |     | NULL    |                |
| updated_at  | timestamp        | YES  |     | NULL    |                |
| deleted_at  | timestamp        | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+

invoices;
+------------------------+---------------------+------+-----+---------+----------------+
| Field                  | Type                | Null | Key | Default | Extra          |
+------------------------+---------------------+------+-----+---------+----------------+
| id                     | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| external_id            | varchar(255)        | NO   |     | NULL    |                |
| status                 | varchar(255)        | NO   |     | NULL    |                |
| invoice_number         | bigint(20)          | YES  |     | NULL    |                |
| sent_at                | datetime            | YES  |     | NULL    |                |
| due_at                 | datetime            | YES  |     | NULL    |                |
| integration_invoice_id | varchar(255)        | YES  |     | NULL    |                |
| integration_type       | varchar(255)        | YES  |     | NULL    |                |
| source_type            | varchar(255)        | YES  | MUL | NULL    |                |
| source_id              | bigint(20) unsigned | YES  |     | NULL    |                |
| client_id              | int(10) unsigned    | NO   | MUL | NULL    |                |
| offer_id               | int(10) unsigned    | YES  | MUL | NULL    |                |
| deleted_at             | timestamp           | YES  |     | NULL    |                |
| created_at             | timestamp           | YES  |     | NULL    |                |
| updated_at             | timestamp           | YES  |     | NULL    |                |
+------------------------+---------------------+------+-----+---------+----------------+

leads;
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| id               | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id      | varchar(255)     | NO   |     | NULL    |                |
| title            | varchar(255)     | NO   |     | NULL    |                |
| description      | text             | NO   |     | NULL    |                |
| status_id        | int(10) unsigned | NO   | MUL | NULL    |                |
| user_assigned_id | int(10) unsigned | NO   | MUL | NULL    |                |
| client_id        | int(10) unsigned | NO   | MUL | NULL    |                |
| user_created_id  | int(10) unsigned | NO   | MUL | NULL    |                |
| qualified        | tinyint(1)       | NO   | MUL | 0       |                |
| result           | varchar(255)     | YES  |     | NULL    |                |
| deadline         | datetime         | NO   |     | NULL    |                |
| deleted_at       | timestamp        | YES  |     | NULL    |                |
| created_at       | timestamp        | YES  |     | NULL    |                |
| updated_at       | timestamp        | YES  |     | NULL    |                |
+------------------+------------------+------+-----+---------+----------------+

mails;
+------------+---------------------+------+-----+---------+----------------+
| Field      | Type                | Null | Key | Default | Extra          |
+------------+---------------------+------+-----+---------+----------------+
| id         | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| subject    | varchar(255)        | NO   |     | NULL    |                |
| body       | varchar(255)        | YES  |     | NULL    |                |
| template   | varchar(255)        | YES  |     | NULL    |                |
| email      | varchar(255)        | YES  |     | NULL    |                |
| user_id    | int(10) unsigned    | YES  | MUL | NULL    |                |
| send_at    | timestamp           | YES  |     | NULL    |                |
| sent_at    | timestamp           | YES  |     | NULL    |                |
| created_at | timestamp           | YES  |     | NULL    |                |
| updated_at | timestamp           | YES  |     | NULL    |                |
+------------+---------------------+------+-----+---------+----------------+

migrations;
+-----------+------------------+------+-----+---------+----------------+
| Field     | Type             | Null | Key | Default | Extra          |
+-----------+------------------+------+-----+---------+----------------+
| id        | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| migration | varchar(255)     | NO   |     | NULL    |                |
| batch     | int(11)          | NO   |     | NULL    |                |
+-----------+------------------+------+-----+---------+----------------+

notifications;
+-----------------+---------------------+------+-----+---------+-------+
| Field           | Type                | Null | Key | Default | Extra |
+-----------------+---------------------+------+-----+---------+-------+
| id              | char(36)            | NO   | PRI | NULL    |       |
| type            | varchar(255)        | NO   |     | NULL    |       |
| notifiable_type | varchar(255)        | NO   | MUL | NULL    |       |
| notifiable_id   | bigint(20) unsigned | NO   |     | NULL    |       |
| data            | text                | NO   |     | NULL    |       |
| read_at         | timestamp           | YES  |     | NULL    |       |
| created_at      | timestamp           | YES  |     | NULL    |       |
| updated_at      | timestamp           | YES  |     | NULL    |       |
+-----------------+---------------------+------+-----+---------+-------+

offers;
+-------------+---------------------+------+-----+---------+----------------+
| Field       | Type                | Null | Key | Default | Extra          |
+-------------+---------------------+------+-----+---------+----------------+
| id          | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)        | NO   |     | NULL    |                |
| sent_at     | datetime            | YES  |     | NULL    |                |
| source_type | varchar(255)        | YES  | MUL | NULL    |                |
| source_id   | bigint(20) unsigned | YES  |     | NULL    |                |
| client_id   | int(10) unsigned    | NO   | MUL | NULL    |                |
| status      | varchar(255)        | NO   |     | NULL    |                |
| deleted_at  | timestamp           | YES  |     | NULL    |                |
| created_at  | timestamp           | YES  |     | NULL    |                |
| updated_at  | timestamp           | YES  |     | NULL    |                |
+-------------+---------------------+------+-----+---------+----------------+

password_resets;
+------------+--------------+------+-----+---------------------+-------------------------------+
| Field      | Type         | Null | Key | Default             | Extra                         |
+------------+--------------+------+-----+---------------------+-------------------------------+
| email      | varchar(255) | NO   | MUL | NULL                |                               |
| token      | varchar(255) | NO   | MUL | NULL                |                               |
| created_at | timestamp    | NO   |     | current_timestamp() | on update current_timestamp() |
+------------+--------------+------+-----+---------------------+-------------------------------+

payments;
+------------------------+---------------------+------+-----+---------+----------------+
| Field                  | Type                | Null | Key | Default | Extra          |
+------------------------+---------------------+------+-----+---------+----------------+
| id                     | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id            | varchar(255)        | NO   |     | NULL    |                |
| amount                 | int(11)             | NO   |     | NULL    |                |
| description            | varchar(255)        | NO   |     | NULL    |                |
| payment_source         | varchar(255)        | NO   |     | NULL    |                |
| payment_date           | date                | NO   |     | NULL    |                |
| integration_payment_id | varchar(255)        | YES  |     | NULL    |                |
| integration_type       | varchar(255)        | YES  |     | NULL    |                |
| invoice_id             | int(10) unsigned    | NO   | MUL | NULL    |                |
| deleted_at             | timestamp           | YES  |     | NULL    |                |
| created_at             | timestamp           | YES  |     | NULL    |                |
| updated_at             | timestamp           | YES  |     | NULL    |                |
+------------------------+---------------------+------+-----+---------+----------------+

permission_role;
+---------------+------------------+------+-----+---------+-------+
| Field         | Type             | Null | Key | Default | Extra |
+---------------+------------------+------+-----+---------+-------+
| permission_id | int(10) unsigned | NO   | PRI | NULL    |       |
| role_id       | int(10) unsigned | NO   | PRI | NULL    |       |
+---------------+------------------+------+-----+---------+-------+

permissions;
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| id           | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id  | varchar(255)     | NO   |     | NULL    |                |
| name         | varchar(255)     | NO   | UNI | NULL    |                |
| display_name | varchar(255)     | YES  |     | NULL    |                |
| description  | varchar(255)     | YES  |     | NULL    |                |
| grouping     | varchar(255)     | YES  |     | NULL    |                |
| created_at   | timestamp        | YES  |     | NULL    |                |
| updated_at   | timestamp        | YES  |     | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+

products;
+------------------+---------------------+------+-----+---------+----------------+
| Field            | Type                | Null | Key | Default | Extra          |
+------------------+---------------------+------+-----+---------+----------------+
| id               | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| name             | varchar(255)        | NO   |     | NULL    |                |
| external_id      | varchar(255)        | NO   |     | NULL    |                |
| description      | text                | YES  |     | NULL    |                |
| number           | varchar(255)        | NO   |     | NULL    |                |
| default_type     | varchar(255)        | NO   |     | NULL    |                |
| archived         | tinyint(1)          | NO   |     | NULL    |                |
| integration_type | varchar(255)        | YES  | MUL | NULL    |                |
| integration_id   | bigint(20) unsigned | YES  |     | NULL    |                |
| price            | int(11)             | NO   |     | NULL    |                |
| deleted_at       | timestamp           | YES  |     | NULL    |                |
| created_at       | timestamp           | YES  |     | NULL    |                |
| updated_at       | timestamp           | YES  |     | NULL    |                |
+------------------+---------------------+------+-----+---------+----------------+

projects;
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| id               | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id      | varchar(255)     | NO   |     | NULL    |                |
| title            | varchar(255)     | NO   |     | NULL    |                |
| description      | text             | NO   |     | NULL    |                |
| status_id        | int(10) unsigned | NO   | MUL | NULL    |                |
| user_assigned_id | int(10) unsigned | NO   | MUL | NULL    |                |
| user_created_id  | int(10) unsigned | NO   | MUL | NULL    |                |
| client_id        | int(10) unsigned | NO   | MUL | NULL    |                |
| invoice_id       | int(10) unsigned | YES  | MUL | NULL    |                |
| deadline         | date             | NO   |     | NULL    |                |
| deleted_at       | timestamp        | YES  |     | NULL    |                |
| created_at       | timestamp        | YES  |     | NULL    |                |
| updated_at       | timestamp        | YES  |     | NULL    |                |
+------------------+------------------+------+-----+---------+----------------+

role_user;
+---------+------------------+------+-----+---------+-------+
| Field   | Type             | Null | Key | Default | Extra |
+---------+------------------+------+-----+---------+-------+
| user_id | int(10) unsigned | NO   | PRI | NULL    |       |
| role_id | int(10) unsigned | NO   | PRI | NULL    |       |
+---------+------------------+------+-----+---------+-------+

roles;
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| id           | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id  | varchar(255)     | NO   |     | NULL    |                |
| name         | varchar(255)     | NO   |     | NULL    |                |
| display_name | varchar(255)     | YES  |     | NULL    |                |
| description  | varchar(255)     | YES  |     | NULL    |                |
| created_at   | timestamp        | YES  |     | NULL    |                |
| updated_at   | timestamp        | YES  |     | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+

settings;
+----------------+------------------+------+-----+---------+----------------+
| Field          | Type             | Null | Key | Default | Extra          |
+----------------+------------------+------+-----+---------+----------------+
| id             | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| client_number  | int(11)          | NO   |     | NULL    |                |
| invoice_number | int(11)          | NO   |     | NULL    |                |
| country        | varchar(255)     | YES  |     | NULL    |                |
| company        | varchar(255)     | YES  |     | NULL    |                |
| currency       | varchar(3)       | NO   |     | USD     |                |
| vat            | smallint(6)      | NO   |     | 725     |                |
| max_users      | int(11)          | NO   |     | NULL    |                |
| language       | varchar(2)       | NO   |     | EN      |                |
| created_at     | timestamp        | YES  |     | NULL    |                |
| updated_at     | timestamp        | YES  |     | NULL    |                |
+----------------+------------------+------+-----+---------+----------------+

statuses;
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| id          | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id | varchar(255)     | NO   |     | NULL    |                |
| title       | varchar(255)     | NO   |     | NULL    |                |
| source_type | varchar(255)     | NO   |     | NULL    |                |
| color       | varchar(255)     | NO   |     | #000000 |                |
| created_at  | timestamp        | YES  |     | NULL    |                |
| updated_at  | timestamp        | YES  |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+

subscriptions;
+---------------+---------------------+------+-----+---------+----------------+
| Field         | Type                | Null | Key | Default | Extra          |
+---------------+---------------------+------+-----+---------+----------------+
| id            | bigint(20) unsigned | NO   | PRI | NULL    | auto_increment |
| user_id       | bigint(20) unsigned | NO   | MUL | NULL    |                |
| name          | varchar(255)        | NO   |     | NULL    |                |
| stripe_id     | varchar(255)        | NO   |     | NULL    |                |
| stripe_status | varchar(255)        | NO   |     | NULL    |                |
| stripe_plan   | varchar(255)        | NO   |     | NULL    |                |
| quantity      | int(11)             | NO   |     | NULL    |                |
| trial_ends_at | timestamp           | YES  |     | NULL    |                |
| ends_at       | timestamp           | YES  |     | NULL    |                |
| created_at    | timestamp           | YES  |     | NULL    |                |
| updated_at    | timestamp           | YES  |     | NULL    |                |
+---------------+---------------------+------+-----+---------+----------------+

tasks;
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| id               | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id      | varchar(255)     | NO   |     | NULL    |                |
| title            | varchar(255)     | NO   |     | NULL    |                |
| description      | text             | NO   |     | NULL    |                |
| status_id        | int(10) unsigned | NO   | MUL | NULL    |                |
| user_assigned_id | int(10) unsigned | NO   | MUL | NULL    |                |
| user_created_id  | int(10) unsigned | NO   | MUL | NULL    |                |
| client_id        | int(10) unsigned | NO   | MUL | NULL    |                |
| project_id       | int(10) unsigned | YES  | MUL | NULL    |                |
| deadline         | date             | NO   |     | NULL    |                |
| deleted_at       | timestamp        | YES  |     | NULL    |                |
| created_at       | timestamp        | YES  |     | NULL    |                |
| updated_at       | timestamp        | YES  |     | NULL    |                |
+------------------+------------------+------+-----+---------+----------------+

users;
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| id               | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| external_id      | varchar(255)     | NO   |     | NULL    |                |
| name             | varchar(255)     | NO   |     | NULL    |                |
| email            | varchar(255)     | NO   | UNI | NULL    |                |
| password         | varchar(60)      | NO   |     | NULL    |                |
| address          | varchar(255)     | YES  |     | NULL    |                |
| primary_number   | varchar(255)     | YES  |     | NULL    |                |
| secondary_number | varchar(255)     | YES  |     | NULL    |                |
| image_path       | varchar(255)     | YES  |     | NULL    |                |
| remember_token   | varchar(100)     | YES  |     | NULL    |                |
| language         | varchar(2)       | NO   |     | EN      |                |
| deleted_at       | timestamp        | YES  |     | NULL    |                |
| created_at       | timestamp        | YES  |     | NULL    |                |
| updated_at       | timestamp        | YES  |     | NULL    |                |
+------------------+------------------+------+-----+---------+----------------+