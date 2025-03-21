CREATE TABLE statuses (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    source_type varchar(255) NOT NULL,
    color varchar(255) NOT NULL DEFAULT '#000000',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE industries (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE departments (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    description text DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE migrations (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    migration varchar(255) NOT NULL,
    batch int(11) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(60) NOT NULL,
    address varchar(255) DEFAULT NULL,
    primary_number varchar(255) DEFAULT NULL,
    secondary_number varchar(255) DEFAULT NULL,
    image_path varchar(255) DEFAULT NULL,
    remember_token varchar(100) DEFAULT NULL,
    language varchar(2) NOT NULL DEFAULT 'EN',
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE clients (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    address varchar(255) DEFAULT NULL,
    zipcode varchar(255) DEFAULT NULL,
    city varchar(255) DEFAULT NULL,
    company_name varchar(255) NOT NULL,
    vat varchar(255) DEFAULT NULL,
    company_type varchar(255) DEFAULT NULL,
    client_number bigint(20) DEFAULT NULL,
    user_id int(10) unsigned NOT NULL,
    industry_id int(10) unsigned NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE projects (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    description text NOT NULL,
    status_id int(10) unsigned NOT NULL,
    user_assigned_id int(10) unsigned NOT NULL,
    user_created_id int(10) unsigned NOT NULL,
    client_id int(10) unsigned NOT NULL,
    invoice_id int(10) unsigned DEFAULT NULL,
    deadline date NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tasks (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    description text NOT NULL,
    status_id int(10) unsigned NOT NULL,
    user_assigned_id int(10) unsigned NOT NULL,
    user_created_id int(10) unsigned NOT NULL,
    client_id int(10) unsigned NOT NULL,
    project_id int(10) unsigned DEFAULT NULL,
    deadline date NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE leads (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    description text NOT NULL,
    status_id int(10) unsigned NOT NULL,
    user_assigned_id int(10) unsigned NOT NULL,
    client_id int(10) unsigned NOT NULL,
    user_created_id int(10) unsigned NOT NULL,
    qualified tinyint(1) NOT NULL DEFAULT 0,
    result varchar(255) DEFAULT NULL,
    deadline datetime NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE comments (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    description longtext DEFAULT NULL,
    source_type varchar(255) NOT NULL,
    source_id bigint(20) unsigned NOT NULL,
    user_id int(10) unsigned NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE documents (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    size varchar(255) NOT NULL,
    path varchar(255) NOT NULL,
    original_filename varchar(255) NOT NULL,
    mime varchar(255) NOT NULL,
    integration_id varchar(255) DEFAULT NULL,
    integration_type varchar(255) NOT NULL,
    source_type varchar(255) NOT NULL,
    source_id bigint(20) unsigned NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE activities (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    log_name varchar(255) DEFAULT NULL,
    causer_id bigint(20) unsigned DEFAULT NULL,
    causer_type varchar(255) DEFAULT NULL,
    text varchar(255) NOT NULL,
    source_type varchar(255) NOT NULL,
    source_id bigint(20) unsigned DEFAULT NULL,
    ip_address varchar(64) NOT NULL,
    properties longtext DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE appointments (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    description varchar(255) DEFAULT NULL,
    source_type varchar(255) DEFAULT NULL,
    source_id bigint(20) unsigned DEFAULT NULL,
    color varchar(10) NOT NULL,
    user_id int(10) unsigned NOT NULL,
    client_id int(10) unsigned DEFAULT NULL,
    start_at timestamp NULL DEFAULT NULL,
    end_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE settings (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    client_number int(11) NOT NULL,
    invoice_number int(11) NOT NULL,
    country varchar(255) DEFAULT NULL,
    company varchar(255) DEFAULT NULL,
    currency varchar(3) NOT NULL DEFAULT 'USD',
    vat smallint(6) NOT NULL DEFAULT 725,
    max_users int(11) NOT NULL,
    language varchar(2) NOT NULL DEFAULT 'EN',
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE business_hours (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    day varchar(255) NOT NULL,
    open_time time DEFAULT NULL,
    close_time time DEFAULT NULL,
    settings_id int(10) unsigned DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE contacts (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    primary_number varchar(255) DEFAULT NULL,
    secondary_number varchar(255) DEFAULT NULL,
    client_id int(10) unsigned NOT NULL,
    is_primary tinyint(1) NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE department_user (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    department_id int(10) unsigned NOT NULL,
    user_id int(10) unsigned NOT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE integrations (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    client_id int(11) DEFAULT NULL,
    user_id int(11) DEFAULT NULL,
    client_secret int(11) DEFAULT NULL,
    api_key varchar(255) DEFAULT NULL,
    api_type varchar(255) DEFAULT NULL,
    org_id varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_lines (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL,
    comment text NOT NULL,
    price int(11) NOT NULL,
    invoice_id int(10) unsigned DEFAULT NULL,
    offer_id int(10) unsigned DEFAULT NULL,
    type varchar(255) DEFAULT NULL,
    quantity int(11) DEFAULT NULL,
    product_id varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    status varchar(255) NOT NULL,
    invoice_number bigint(20) DEFAULT NULL,
    sent_at datetime DEFAULT NULL,
    due_at datetime DEFAULT NULL,
    integration_invoice_id varchar(255) DEFAULT NULL,
    integration_type varchar(255) DEFAULT NULL,
    source_type varchar(255) DEFAULT NULL,
    source_id bigint(20) unsigned DEFAULT NULL,
    client_id int(10) unsigned NOT NULL,
    offer_id int(10) unsigned DEFAULT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE mails (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    subject varchar(255) NOT NULL,
    body varchar(255) DEFAULT NULL,
    template varchar(255) DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    user_id int(10) unsigned DEFAULT NULL,
    send_at timestamp NULL DEFAULT NULL,
    sent_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE notifications (
    id char(36) NOT NULL,
    type varchar(255) NOT NULL,
    notifiable_type varchar(255) NOT NULL,
    notifiable_id bigint(20) unsigned NOT NULL,
    data text NOT NULL,
    read_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE offers (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    sent_at datetime DEFAULT NULL,
    source_type varchar(255) DEFAULT NULL,
    source_id bigint(20) unsigned DEFAULT NULL,
    client_id int(10) unsigned NOT NULL,
    status varchar(255) NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE password_resets (
    email varchar(255) NOT NULL,
    token varchar(255) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (email, token)
);

CREATE TABLE payments (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    amount int(11) NOT NULL,
    description varchar(255) NOT NULL,
    payment_source varchar(255) NOT NULL,
    payment_date date NOT NULL,
    integration_payment_id varchar(255) DEFAULT NULL,
    integration_type varchar(255) DEFAULT NULL,
    invoice_id int(10) unsigned NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE permission_role (
    permission_id int(10) unsigned NOT NULL,
    role_id int(10) unsigned NOT NULL,
    PRIMARY KEY (permission_id, role_id)
);

CREATE TABLE permissions (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    name varchar(255) NOT NULL UNIQUE,
    display_name varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    grouping varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    external_id varchar(255) NOT NULL,
    description text DEFAULT NULL,
    number varchar(255) NOT NULL,
    default_type varchar(255) NOT NULL,
    archived tinyint(1) NOT NULL,
    integration_type varchar(255) DEFAULT NULL,
    integration_id bigint(20) unsigned DEFAULT NULL,
    price int(11) NOT NULL,
    deleted_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE role_user (
    user_id int(10) unsigned NOT NULL,
    role_id int(10) unsigned NOT NULL,
    PRIMARY KEY (user_id, role_id)
);

CREATE TABLE roles (
    id int(10) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    display_name varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE subscriptions (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    user_id bigint(20) unsigned NOT NULL,
    name varchar(255) NOT NULL,
    stripe_id varchar(255) NOT NULL,
    stripe_status varchar(255) NOT NULL,
    stripe_plan varchar(255) NOT NULL,
    quantity int(11) NOT NULL,
    trial_ends_at timestamp NULL DEFAULT NULL,
    ends_at timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE absences (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    external_id varchar(255) NOT NULL,
    reason varchar(255) NOT NULL,
    comment text DEFAULT NULL,
    start_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    end_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    medical_certificate tinyint(1) DEFAULT NULL,
    user_id int(10) unsigned DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (id)
);