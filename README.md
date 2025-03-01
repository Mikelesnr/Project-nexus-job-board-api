# Job Board Backend

## Real-World Application

This project prepares developers to build robust backend systems for platforms requiring complex role management and efficient data retrieval. Participants gain experience with:

- Role-based access control and secure authentication.
- Designing efficient database schemas.
- Optimizing query performance for large datasets.

## Overview

This case study focuses on creating a backend for a Job Board Platform. The backend facilitates job postings, role-based access control, and efficient job search features. It integrates advanced database optimization and comprehensive API documentation.

## Project Goals

The primary objectives of the job board backend are:

### API Development

- Build APIs for managing job postings, categories, and applications.

### Access Control

- Implement role-based access control for admins and users.

### Database Efficiency

- Optimize job search with advanced query indexing.

## Technologies Used

| Technology | Purpose                                           |
| ---------- | ------------------------------------------------- |
| Django     | High-level Python framework for rapid development |
| PostgreSQL | Database for storing job board data               |
| JWT        | Secure role-based authentication                  |
| Swagger    | API endpoint documentation                        |

## Key Features

### Job Posting Management

- APIs for creating, updating, deleting, and retrieving job postings.
- Categorize jobs by industry, location, and type.

### Role-Based Authentication

- Admins can manage jobs and categories.
- Users can apply for jobs and manage applications.

### Optimized Job Search

- Use indexing and optimized queries for efficient job filtering.
- Implement location-based and category-based filtering.

### API Documentation

- Use Swagger for detailed API documentation.
- Host documentation at `/swagger/` for frontend integration.

## Routes and Deliverables

### Job Postings

- **GET /api/jobs/**: Retrieve all job postings.
  - Deliverable: List of job postings with details (title, description, location, company_name, category, created_by).
  - This route can be filtered by title, category, and created_by.
- **GET /api/jobs/{id}/**: Retrieve a specific job posting by ID.
  - Deliverable: Details of the specified job posting.
- **POST /api/jobs/**: Create a new job posting.
  - Deliverable: Newly created job posting details.
- **PUT /api/jobs/{id}/**: Update an existing job posting by ID.
  - Deliverable: Updated job posting details.
- **DELETE /api/jobs/{id}/**: Delete an existing job posting by ID.
  - Deliverable: Confirmation of job posting deletion.

### Job Categories

- **GET /api/categories/**: Retrieve all job categories.
  - Deliverable: List of job categories.
- **POST /api/categories/**: Create a new job category.
  - Deliverable: Newly created job category details.
- **PUT /api/categories/{id}/**: Update an existing job category by ID.
  - Deliverable: Updated job category details.
- **DELETE /api/categories/{id}/**: Delete an existing job category by ID.
  - Deliverable: Confirmation of job category deletion.

### Job Applications

- **POST /api/jobs/{id}/apply/**: Apply for a job posting by ID.
  - Deliverable: Confirmation of job application submission.
- **GET /api/users/{id}/applications/**: Retrieve all job applications for a user by user ID.
  - Deliverable: List of job applications with details.

### Authentication

- **POST /api/auth/login/**: User login.
  - Deliverable: JWT token for authenticated access.
- **POST /api/auth/register/**: User registration.
  - Deliverable: Confirmation of user registration.

## Project Setup

### Prerequisites

- Python (version 3.8 or higher)
- PostgreSQL
- Virtualenv

### Step 1: Clone the Repository

- bash:
- git clone https://github.com/your-repo/job-board-backend.git
- cd job-board-backend

### Step 2: Set Up Virtual Environment

- bash:
- python -m venv venv
- source venv/bin/activate

### Step 3: Install Dependencies

- pip install -r requirements.txt (requrements.txt is inside the job_board_api app)

### Step 4: Set Up PostgreSQL Database

- install PostgreSQL (google how to do this for your os)
- Start PostgreSQL service:
  - For Ubuntu: sudo systemctl start postgresql
  - For macOS (using Homebrew): brew services start postgresql
- Create a new PostgreSQL user:
  - bash:
  - sudo -i -u postgres
  - createuser --interactive
- Create a new PostgreSQL database:
  - bash:
  - createdb job_board_db
- Set a password for the PostgreSQL user:
  - bash
  - psql
- In the PostgreSQL prompt, set a password for the user you just created:
  - Sql
  - ALTER USER your_postgres_user WITH PASSWORD 'your_password';
  - \q

### Step 5: Configure Django to Use PostgreSQL

- Install PostgreSQL dependencies:pip
  - install psycopg2-binary
- Update settings.py file:

  - python:
  - DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.postgresql',
    'NAME': 'job_board_db',
    'USER': 'your_postgres_user',
    'PASSWORD': 'your_password',
    'HOST': 'localhost',
    'PORT': '5432',
    }
    }

### Step 6: Apply Migrations

- bash:
- python manage.py migrate

### Step 7: Run the Development Server

- python manage.py runserver

### Step 8: Access the Application

- Open your web browser and navigate to:
- http://127.0.0.1:8000

### Useful Sites

Here are some useful documentation sites for the technologies used in this project:

- **Django Documentation**

  - [Django Official Documentation](https://docs.djangoproject.com/en/stable/)
  - Comprehensive guide for Django, including tutorials, references, and how-to guides.

- **PostgreSQL Documentation**

  - [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)
  - Detailed documentation for PostgreSQL, including setup, configuration, and SQL commands.

- **JWT (JSON Web Tokens) Documentation**

  - [JWT Introduction](https://jwt.io/introduction/)
  - An overview of JSON Web Tokens and how they work.
  - [PyJWT Documentation](https://pyjwt.readthedocs.io/en/stable/)
  - Documentation for the PyJWT library used for encoding and decoding JWT in Python.

- **Swagger Documentation**
  - [Swagger Official Documentation](https://swagger.io/docs/)
  - Documentation for Swagger, including OpenAPI Specification, tools, and tutorials.
  - [drf-yasg Documentation](https://drf-yasg.readthedocs.io/en/stable/)
  - Documentation for drf-yasg, a tool for generating real Swagger/OpenAPI 2.0 specifications from a Django Rest Framework API.
