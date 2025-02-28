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
  - this route can be filtered by title,category and created_by
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

## Implementation Process

### Git Commit Workflow

#### Initial Setup:

- `feat: set up Django project with PostgreSQL`

#### Feature Development:

- `feat: implement job posting and filtering APIs`
- `feat: add role-based authentication for admins and users`

#### Optimization:

- `perf: optimize job search queries with indexing`

#### Documentation:

- `feat: integrate Swagger for API documentation`
- `docs: update README with usage details`

## Submission Details

- Deployment: Host the API and Swagger documentation

## Evaluation Criteria

### Functionality

- APIs handle job and category CRUD operations effectively.
- Role-based authentication works as intended.

### Code Quality

- Code is modular and follows Django best practices.
- Database schema is normalized and efficient.

### Performance

- Job search is fast and responsive.
- Indexed queries enhance filtering efficiency.

### Documentation

- Swagger documentation is detailed and hosted.
- README provides clear setup instructions.
