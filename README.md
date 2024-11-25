# CertVault: Certificate Management Platform

## Overview

CertVault is a Rails-based application designed to manage SSL/TLS certificates efficiently. This project showcases core Rails concepts, including MVC architecture, data modeling, routing, authentication, and authorization. It also follows best practices for clean, modular, and maintainable code.

---

## Features

### Admin Functionality
- Full access to all certificates grouped by users.
- Ability to manage certificates (CRUD operations) for all users.
- Enhanced admin views styled for clarity and ease of use.

### Developer Functionality
- Developers can register applications to generate API access tokens.
- Ability to manage certificates scoped to the developer's API token.
- Token-based API authentication for secure access to the certificate endpoints.

### User Functionality
- Standard users can manage their own certificates via a user-friendly interface.
- Secure and intuitive navigation for certificate management.

### API Endpoints
- Fully RESTful API under `/api/v1/certificates` with:
  - Token-based authentication for API access.
  - CRUD operations scoped to the authenticated developer.

---

## Key Technologies

- **Ruby on Rails**: Full-stack framework to build and manage the application.
- **Tailwind CSS**: For clean and modern UI styling.
- **Pundit**: For flexible and secure authorization policies.
- **StimulusJS**: For lightweight interactivity within views.
- **Turbo Rails**: For faster navigation and updates without a full-page reload.
- **PostgreSQL**: Relational database for secure and efficient data storage.

---

## Installation

### Prerequisites
- Ruby `3.2.2`
- Rails `7.0.8`
- PostgreSQL

### Steps to Run the Application

1. Clone the Repository:
   ```bash
   git clone https://github.com/MuhammedZatar/CertVault.git
   cd CertVault
   ```
2. Clone the Repository:
    ```bash
   bundle install
   ```
3. Setup the Database:
   ```
   rails db:create db:migrate
   ```
4. Start the Server:
   ```
   rails server
   ```
5. Visit the Application: Open your browser and navigate to http://localhost:3000

---

## API Documentation

### Base URL
http://localhost:3000/api/v1


### Endpoints

#### **Get All Certificates**
- **Endpoint**: `GET /certificates`
- **Headers**:
  ```json
  {
    "Authorization": "Bearer <access_token>"
  }
  ```
- Response:
```
[
  {
    "id": 1,
    "name": "Certificate Name",
    "domain": "domain.test",
    "file_path": "/path/to/certificate"
  }
]
```

#### **Create a Certificate**
- **Endpoint**: `POST /certificates`
- **Headers**:
  ```json
  {
    "Authorization: Bearer <access_token>"
  }
  ```
- Response:
```
{
  "certificate": {
    "name": "New Cert",
    "domain": "example.com",
    "file_path": "/path/to/new/certificate"
  }
}
```

#### **Update a Certificate**
- **Endpoint**: `PUT /certificates/:id`
- **Headers**:
  ```json
  {
    "Authorization: Bearer <access_token>"
  }
  ```
- Response:
```
{
  "certificate": {
    "name": "Updated Cert Name"
  }
}

```

#### **Delete a Certificate**
- **Endpoint**: `DELETE /certificates/:id`
- **Headers**:
  ```json
  {
    "Authorization: Bearer <access_token>"
  }
  ```
- Response:
```
{
  "message": "Certificate deleted successfully."
}
```

---
## Code Highlights

### 1. MVC Architecture
This project strictly adheres to the **Model-View-Controller (MVC)** architecture, ensuring separation of concerns:
- **Models**: Handle data logic, validations, and associations.
- **Controllers**: Contain business logic and interact with models and views.
- **Views**: Render data to the user interface.

### 2. Authentication with Access Tokens
Implemented a token-based authentication system using `before_action :authenticate_with_token!` for API endpoints:
```ruby
# app/controllers/api/base_controller.rb
class Api::BaseController < ActionController::API
  before_action :authenticate_with_token!

  private

  def authenticate_with_token!
    token = request.headers["Authorization"]&.split(" ")&.last
    @current_user = User.joins(:apps).find_by(apps: { access_token: token })

    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
  end
end
```

### 3. Role-Based Authorization with Pundit
Integrated Pundit for role-based access control:

- **Admin:** Full access to certificates.
- **Developer:** Limited access to their own certificates and apps.
- Defined custom policies for each role to manage scope and permissions.

### 4. API Namespace and Routing
Scoped API endpoints under api/v1 namespace for a clear structure:
```ruby
# config/routes.rb
namespace :api do
  namespace :v1 do
    resources :certificates, only: [:index, :create, :update, :destroy]
  end
end
```
---
## Screenshots
### Admin Dashboard
View certificates grouped by user email with full CRUD capabilities.
![Screenshot 2024-11-25 at 11 18 14 AM](https://github.com/user-attachments/assets/17952ed3-74ae-4e85-b1d6-e016661bb234)


### Developer Applications
![Screenshot 2024-11-25 at 11 18 38 AM](https://github.com/user-attachments/assets/05686ee9-017d-4ff3-994d-0139bde310ba)


### User Interface
![Screenshot 2024-11-25 at 11 26 15 AM](https://github.com/user-attachments/assets/2fbb9af4-cf30-48aa-a995-b7922b1a4e5f)

---

## Testing
Tested the application for:
1. **CRUD Operations:** Verified certificates and apps can be created, updated, and deleted as expected.
2. **Authorization:** Ensured access is scoped based on roles (Admin, Developer).
3. **API Requests:** Used Postman to validate API behavior and response formats.

---

## Future Improvements
1. Add RSpec tests for all models, controllers, and policies.
2. Implement a dashboard for real-time analytics of certificates and API usage.
3. Enhance the developer experience with more robust API documentation and examples.
4. Introduce rate-limiting and error-tracking mechanisms.

---

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
