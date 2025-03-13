# Job Board Backend

This project demontrates how to build robust backend systems for platforms requiring complex role management and efficient data retrieval. Areas covered include with:

- Role-based access control and secure authentication.
- Designing efficient database schemas.

## Overview

This project focuses on creating a backend for a Job Board Platform. The backend facilitates job postings, role-based access control, and efficient job search features. It integrates advanced database optimization and comprehensive API documentation.

## Project Goals

The primary objectives of the job board backend are:

### API Development

- Build APIs for managing job postings, categories, and applications.

### Access Control

- Implement role-based access control for admins and users.

## Technologies Used

| Technology | Purpose                                           |
| ---------- | ------------------------------------------------- |
| Django     | High-level Python framework for rapid development |
| Postgresql | Database for storing job board data               |
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
- Use openai for detailed API documentation.
- Host documentation at `/redoc/` for frontend integration.

## Routes and Deliverables

### Job Postings

- **GET /api/jobs/**: Retrieve all job postings.

  - **Deliverable**: List of job postings with details (title, description, location, category, created_by).
  - **Filtering**: This route can be filtered by title, category, and created_by.

- **GET /api/jobs/{id}/**: Retrieve a specific job posting by ID.

  - **Deliverable**: Details of the specified job posting.

- **POST /api/jobs/**: Create a new job posting.

  - **Deliverable**: Newly created job posting details.

- **PUT /api/jobs/{id}/**: Update an existing job posting by ID.

  - **Deliverable**: Updated job posting details.

- **DELETE /api/jobs/{id}/**: Delete an existing job posting by ID.
  - **Deliverable**: Confirmation of job posting deletion.

### Job Categories

- **GET /api/categories/**: Retrieve all job categories.

  - **Deliverable**: List of job categories.

- **POST /api/categories/**: Create a new job category.

  - **Deliverable**: Newly created job category details.

- **PUT /api/categories/{id}/**: Update an existing job category by ID.

  - **Deliverable**: Updated job category details.

- **DELETE /api/categories/{id}/**: Delete an existing job category by ID.
  - **Deliverable**: Confirmation of job category deletion.

### Job Applications

- **POST /api/apply/**: Apply for a job.

  - **Deliverable**: Confirmation of job application submission.

- **GET /api/user/applications/**: Retrieve all job applications for the authenticated user.

  - **Deliverable**: List of job applications with details.

- **GET /api/employer/applications/**: Retrieve all job applications for job posts created by the authenticated employer.
  - **Deliverable**: List of job applications with details.

### Authentication

- **POST /api/auth/login/**: User login.

  - **Deliverable**: JWT token for authenticated access.

- **POST /api/auth/refresh/**: Refresh JWT token.

  - **Deliverable**: New JWT token.

- **POST /api/auth/register/**: User registration.

  - **Deliverable**: Confirmation of user registration.

- **GET /api/auth/profile/**: Retrieve the profile of the authenticated user.
  - **Deliverable**: Profile details of the authenticated user.

### Email Confirmation and User Activation

- **POST /api/send-email/**: Send a test email.

  - **Deliverable**: Confirmation of email sent.

- **GET /api/activate/{uidb64}/{token}/**: Activate the user account.
  - **Deliverable**: Confirmation of account activation.

### Password Reset

- **POST /api/password_reset/**: Request a password reset.

  - **Deliverable**: Confirmation of password reset email sent.

- **GET /api/password_reset/done/**: Confirmation page after password reset email is sent.

  - **Deliverable**: Password reset done page.

- **GET /api/reset/{uidb64}/{token}/**: Password reset confirmation link.

  - **Deliverable**: Password reset confirmation page.

- **POST /api/reset/done/**: Confirmation page after password is reset.
  - **Deliverable**: Password reset complete page.

### File Download

- **GET /api/download_cv/**: Download a CV file.
  - **Deliverable**: CV file download.

## Project Setup

### Prerequisites

- Python (version 3.8 or higher)
- MySQL/Postgresql/sqlite
- Virtualenv

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-repo/job-board-backend.git
cd job-board-backend
```

### Step 2: Set Up Virtual Environment

- python -m venv venv
- source venv/bin/activate

### Step 3: Install Dependencies

- pip install -r requirements.txt (you have to be in the directory with the requirements.txt)

### Step 4: Set Up MySQL Database or Postgresssql

- I will only document mysql though I used postgress for this project
- Install MySQL (Google how to do this for your OS)
- Start MySQL service:
- For Ubuntu: sudo systemctl start mysql
- For macOS (using Homebrew): brew services start mysql
- Create a new MySQL user:
- Bash
- sudo mysql
  CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
  GRANT ALL PRIVILEGES ON _._ TO 'user'@'localhost';
  FLUSH PRIVILEGES;
  EXIT;
- mysql -u user -p
  CREATE DATABASE job_board_db;
  EXIT;

### Step 5: Configure Django to Use MySQL

- Install MySQL dependencies:
- pip install mysqlclient
- Update settings.py file:
  change DATABASE SETTINGS from postgress to mysql
  'ENGINE': 'django.db.backends.mysql'
  'HOST': 'localhost',
  'PORT': '3306',
- run migrations
  python manage.py migrate

### Step 6: Setup smtp email

- google how to create an app password for your email provider: in my case gmail
- modidy the Email settings in settings.py (user regitration will not work without setting up email)

### Run app

- python manage.py runserver
