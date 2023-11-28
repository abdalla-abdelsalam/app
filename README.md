# app
This project is a Docker Compose configuration that simplifies the deployment of a full-stack application comprising a Laravel API, Nuxt.js client, MySQL database, and Nginx server with HTTPS support. The following sections provide an overview of the project structure, services, usage instructions, prerequisites, technologies used, and additional details.

## Technologies Used

* Docker: Containerization technology for packaging and deploying applications.
* Docker Compose: Tool for defining and running multi-container Docker applications.
* Laravel: PHP web application framework for building robust APIs.
* Nuxt.js: Vue.js framework for building modern, server-side rendered web applications.
* MySQL: Relational database management system.
* Nginx: Web server and reverse proxy server for serving static content and handling HTTPS.

## Directories

* api: Contains the Laravel API source code and configuration files.
* client: Holds the Nuxt.js client application files and configurations.
* certs: Contains the self-signed SSL * certificate and private key for HTTPS support.
* .env: Stores MySQL environment variables for * configuring the MySQL container.
* nginx.conf: Nginx configuration file for routing and HTTPS settings.
* docker-compose.yaml: The Docker Compose configuration file orchestrating the services.

## Docker compose Services

1. MySQL:
    * Image: MySQL latest
    * Environment Variables:
        * MYSQL_ROOT_PASSWORD
        * MYSQL_DATABASE
        * MYSQL_USER
        * MYSQL_PASSWORD
    * Networking: app-network

1. Laravel API:
    * Built from the ./api context
    * Depends on MySQL
    * Networking: app-network

1. Nuxt.js Client:
    * Built from the ./client context
    * Depends on the API
    * Networking: your_network_name

1. Nginx:
    * Image: Nginx latest
    * Ports: 443 (HTTPS)
    * Volumes: nginx.conf and certs directory
    * Depends on the Nuxt.js client
    * Networking: your_network_name

## Prerequisites

Before you begin, ensure you have the following prerequisites installed on your machine:

* Docker
* Docker Compose
* Git

## usage
1. clone the repo
    ```sh
    git clone https://github.com/abdalla-abdelsalam/app.git
    cd app
    ```
1. MySQL Environment Variables:

    * Open .env and replace the placeholder values with your desired MySQL credentials.

1. Certificates:

    * If using HTTPS, ensure your SSL certificate (server.crt) and private key (server.key) are in the certs directory.

1. Nginx Configuration:

    * Review and customize nginx.conf based on your specific requirements.

1. Building and Running:

    * Run **docker-compose build**  to build the Docker images.
    * Run **docker-compose up -d** to start the containers in the background.

1. Accessing the app:
   * https://localhost

## Notes and Considerations
* Ensure your Laravel API .env file is configured correctly to connect to MySQL.
* The Nginx setup uses self-signed certificates for HTTPS, which may result in browser security warnings.
* This README provides a high-level overview. Further details on each service and customization options are available in their respective directories.
* .env file should not be included in in the your repo uncomment the file in .gitignore file