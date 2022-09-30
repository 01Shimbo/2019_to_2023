# mysql-duke-development-db
resource "google_sql_database_instance" "mysql-duke-development-db" {
  name             = "mysql-duke0-development-db"
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}
resource "google_sql_user" "development-user" {
  name            = "mysql-development-user"
  instance        = google_sql_database_instance.mysql-duke-development-db.name
  password        = "6133Esunrd"
}

# mysql-duke-integrationtest-db
resource "google_sql_database_instance" "mysql-duke-integrationtest-db" {
  name             = "mysql-duke0-integrationtest-db"
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}
resource "google_sql_user" "mysql-integrationtest" {
  name            = "mysql-integrationtest-user"
  instance        = google_sql_database_instance.mysql-duke-integrationtest-db.name
  password        = "6133Esunrd"
}

# mysql-duke-qa-db
resource "google_sql_database_instance" "mysql-duke-qa-db" {
  name             = "mysql-duke0-qa-db"
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}
resource "google_sql_user" "mysql-qa" {
  name            = "mysql-qa-user"
  instance        = google_sql_database_instance.mysql-duke-qa-db.name
  password        = "6133Esunrd"
}

# postgres-duke-development-db
resource "google_sql_database_instance" "postgres-duke-development-db" {
  name             = "postgres-duke0-development-db"
  database_version = "POSTGRES_14"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}
resource "google_sql_user" "postgres-development" {
  name            = "postgres-development-user"
  instance        = google_sql_database_instance.postgres-duke-development-db.name
  password        = "6133Esunrd"
}
# postgres-duke-integrationtest-db
resource "google_sql_database_instance" "postgres-duke-integrationtest-db" {
  name             = "postgres-duke0-integrationtest-db"
  database_version = "POSTGRES_14"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}
resource "google_sql_user" "postgres-integrationtest" {
  name            = "postgres-integrationtest-user"
  instance        = google_sql_database_instance.postgres-duke-integrationtest-db.name
  password        = "6133Esunrd"
}
# postgres-duke-qa-db
resource "google_sql_database_instance" "postgres-duke-qa-db" {
  name             = "postgres-duke0-qa-db"
  database_version = "POSTGRES_14"
  region           = "us-central1"
  deletion_protection = false
  settings {
    tier = "db-f1-micro"
  }
}
resource "google_sql_user" "postgres-qa" {
  name            = "postgres-qa-user"
  instance        = google_sql_database_instance.postgres-duke-qa-db.name
  password        = "6133Esunrd"
}