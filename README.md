Tea Subscription Service (Backend)
Welcome to the Tea Subscription Service! This is a Ruby on Rails API project that enables customers to subscribe to tea services, cancel subscriptions, and view their subscription details. The backend of this service serves as a foundation for managing tea subscriptions. Below you'll find details on how to set up, use, and understand the API.

Ruby
Ruby on Rails
SQLite (database)
Bundler
Installation
Follow these steps to set up the project:

Clone the repository:

Copy code
git clone https://github.com/brad2412/tea_sub_service.git
cd tea_sub_service
Install dependencies:

Copy code
bundle install
Create the database and run migrations:

Copy code
rails db:create
rails db:migrate
Start the Rails server:

Copy code
rails server
Your API should now be up and running on http://localhost:3000. The following sections will guide you on how to use it.

Usage
Endpoints
Subscribe a Customer to a Tea Subscription

Endpoint: POST /api/v0/subscriptions
Request: Create a new subscription by providing the required parameters in the request body.
json
Copy code
{
  "title": "Green Tea Subscription",
  "price": 9.99,
  "status": "active",
  "frequency": "bi-monthly",
  "customer_id": 1,  // Customer's ID
  "tea_id": 1  // Tea's ID
}
Cancel a Customer's Tea Subscription

Endpoint: PUT /api/v0/subscriptions/:id
Request: Update an existing subscription to change its status to 'inactive'.
View All of a Customer's Subscriptions

Endpoint: GET /api/v0/customers/:id/subscriptions
Request: Retrieve all subscriptions for a specific customer.
Feel free to explore additional endpoints, but remember to prioritize MVP requirements.

Testing
The project follows a Test-Driven Development (TDD) approach. You can run the tests using RSpec. Execute the following command to run the tests:

bash
Copy code
rspec
Data Details
The project manages the following data entities:

Tea:

Title
Description
Temperature
Brew Time
Customer:

First Name
Last Name
Email
Address
Subscription:

Title
Price
Status
Frequency
You can use this structure as a guide or modify it as needed.

Contributing
Contributions to this project are welcome. You can fork the repository and submit a pull request to suggest improvements or features. Please follow best practices when contributing, and make sure your code is thoroughly tested.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Thank you for using the Tea Subscription Service API! If you have any questions or need further assistance, please don't hesitate to reach out.

Happy coding!