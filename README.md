# Access Management System

A comprehensive Ruby on Rails application for managing age-based Access Management System, organization memberships, and parental consent requirements. This system enables organizations to manage user access based on age groups, implement parental consent workflows for minors, and maintain role-based permissions.

## Features

- **Age-based Access Management System**: Automatic categorization of users into age groups (Little Ones, Adolescents, Emerging Adults, Middle-Aged, Golden Years)
- **Organization Management**: Create and manage organizations with different membership roles
- **Parental Consent System**: Required consent workflows for users under 18
- **Role-based Permissions**: Admin and member roles with different access levels
- **User Authentication**: Secure login system with session management
- **Invitation System**: Email-based organization invitations
- **Dashboard Analytics**: Organization insights and membership statistics

## Tech Stack

- **Ruby on Rails 7.x**
- **PostgreSQL** (Database)
- **Tailwind CSS** (Styling)
- **Stimulus** (JavaScript framework)
- **Kamal** (Deployment)
- **Docker** (Containerization)

## Setup Instructions

### Prerequisites

- Ruby 3.x
- Rails 7.x
- PostgreSQL
- Node.js and npm

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd access_control_app
   ```

2. **Install Ruby dependencies**

   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies**

   ```bash
   npm install
   ```

4. **Setup the database**

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the development server**

   ```bash
   bin/dev
   ```

   Or run Rails and Tailwind separately:

   ```bash
   rails server
   # In another terminal:
   rails tailwindcss:watch
   ```

6. **Visit the application**
   Navigate to `http://localhost:3000`

## Test Users

The application comes with pre-seeded test users for development:

- **Adult User**: michael.chen@example.com / securepass456

  - Full access, admin role in CloudVision Technologies

- **Minor User**: emma.williams@example.com / securepass456
  - Requires parental consent, member role in Ocean Conservation Alliance

## Organizations

Two sample organizations are created:

- **CloudVision Technologies** (Company)
- **Ocean Conservation Alliance** (Nonprofit)

## Development

### Running Tests

```bash
# Run all tests
rails test

# Run specific test files
rails test test/models/user_test.rb
```

### Code Quality

```bash
# Run RuboCop
bin/rubocop

# Run Brakeman security scanner
bin/brakeman
```

### Database Management

```bash
# Reset database with fresh seed data
rails db:reset

# Create a new migration
rails generate migration AddColumnToTable column_name:string
```

## Deployment

This application is configured for deployment with Kamal:

```bash
# Deploy to production
kamal deploy

# Setup application on server
kamal setup
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.
