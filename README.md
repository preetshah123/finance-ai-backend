# Finance AI Budget Tracker - Backend

A Ruby on Rails API backend for an intelligent personal finance and budget tracking application powered by AI.

## Project Overview

This is a RESTful API backend built with Rails 8.1 that serves as the core engine for the Finance AI budget tracker. The application helps users manage their finances, track expenses, set budgets, and receive AI-powered financial insights. The backend handles user authentication, financial data management, and integration with AI services for budget optimization and financial analysis.

## Technology Stack

- **Framework:** Ruby on Rails 8.1.3
- **Ruby Version:** 3.3.x (Ruby 3.1+ required by Rails 8.1)
- **Database:** SQLite3
- **Web Server:** Puma
- **Job Queue:** Solid Queue
- **Caching:** Solid Cache
- **WebSocket Support:** Solid Cable
- **Deployment:** Docker + Kamal

## System Requirements

- Ruby 3.3.x (or 3.1+)
- SQLite3
- Node.js (for asset compilation, if needed)
- Git
- Docker (for containerized development/deployment)

## Project Structure

```
app/
├── controllers/        # HTTP request handlers for API endpoints
├── jobs/              # Background jobs for async tasks
├── mailers/           # Email sending logic
├── models/            # Data models and business logic
└── views/             # View templates (primarily JSON responses for API)

config/
├── initializers/      # Application initialization setup
├── environments/      # Environment-specific configuration
├── routes.rb          # API route definitions
├── database.yml       # Database configuration
├── puma.rb           # Puma server configuration
├── cable.yml         # WebSocket configuration
└── credentials.yml.enc # Encrypted credentials

db/
├── migrate/          # Database migrations (auto-generated)
├── schema.rb         # Database schema snapshot
└── seeds.rb          # Initial database seed data

lib/
├── tasks/            # Custom Rake tasks

test/
├── controllers/      # Controller tests
├── models/           # Model tests
├── integration/      # Integration tests
└── fixtures/         # Test data files

public/               # Static files served by the server
storage/              # Active Storage uploads
```

## Key Gems & Dependencies

- **Rails 8.1.3** - Web framework
- **sqlite3** - Database adapter
- **puma** - Web server
- **solid_cache** - Database-backed caching
- **solid_queue** - Database-backed job queue
- **solid_cable** - Database-backed WebSockets
- **kamal** - Docker deployment tool
- **thruster** - HTTP asset caching acceleration
- **image_processing** - Image transformation (for profile pictures, receipts, etc.)
- **bootsnap** - Faster boot times
- **brakeman** - Security vulnerability scanner
- **bundler-audit** - Gem dependency auditing
- **rubocop-rails-omakase** - Code style enforcement

## Setup & Installation

### 1. Clone the Repository
```bash
git clone <repository-url>
cd finance-ai-backend
```

### 2. Install Dependencies
```bash
bundle install
```

### 3. Setup Environment
```bash
bin/setup
```

This command will:
- Create and initialize the database
- Run migrations
- Seed the database (if applicable)

### 4. Verify Installation
```bash
bundle exec rails -v
bundle exec rails db:version
```

## Database

### Configuration
Database settings are defined in `config/database.yml`. By default, SQLite3 is configured for all environments.

### Creating & Migrating the Database
```bash
# Create database
bundle exec rails db:create

# Run migrations
bundle exec rails db:migrate

# Seed initial data (if applicable)
bundle exec rails db:seed

# Reset database (development/test only)
bundle exec rails db:reset
```

## Running the Application

### Development Server
```bash
bin/dev
# or
bundle exec rails server
```

The API will be available at `http://localhost:3000`

### Production Build
```bash
RAILS_ENV=production bundle exec rails server
```

## Running Tests

```bash
# Run all tests
bundle exec rails test

# Run specific test file
bundle exec rails test test/models/user_test.rb

# Run tests with coverage
COVERAGE=true bundle exec rails test
```

## Code Quality & Security

### Security Scanning
```bash
# Scan for security vulnerabilities
bundle exec brakeman

# Audit gems for known vulnerabilities
bundle exec bundler-audit
```

### Code Style
```bash
# Check code style (uses Omakase Ruby styling)
bundle exec rubocop

# Auto-fix code style issues
bundle exec rubocop -A
```

## Background Jobs

Jobs are managed through Solid Queue and should be placed in `app/jobs/`. Examples:
- Email notifications
- Data processing tasks
- API integrations
- Financial calculations

To process background jobs:
```bash
bundle exec solid_queue:work
```

## Where to Add Files

| Component | Location | Description |
|-----------|----------|-------------|
| **API Endpoints** | `app/controllers/` | Create new controllers for resource endpoints (e.g., `budgets_controller.rb`) |
| **Models** | `app/models/` | Define data models and business logic (e.g., `User`, `Budget`, `Transaction`) |
| **Background Jobs** | `app/jobs/` | Async task execution (e.g., `ProcessTransactionJob`) |
| **Mailers** | `app/mailers/` | Email templates and logic |
| **Migrations** | `db/migrate/` | Auto-generated; never manually edit existing ones |
| **Tests** | `test/` | Mirror the structure of `app/` (e.g., `test/models/`, `test/controllers/`) |
| **Utility Methods** | `lib/` | Shared utilities not belonging to a specific model/controller |
| **Rake Tasks** | `lib/tasks/` | Custom automation tasks |
| **Config** | `config/initializers/` | Application initialization setup |

## API Routes

Routes are defined in `config/routes.rb`. Example structure:
```ruby
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :budgets
      resources :transactions
      resources :users
    end
  end
end
```

## Environment Variables & Secrets

Sensitive configuration (API keys, database URLs, etc.) should be stored in:
- `config/credentials.yml.enc` (encrypted, Rails best practice)
- Environment variables (for Docker/production)

Edit credentials:
```bash
bundle exec rails credentials:edit
```

## Docker Support

### Build Image
```bash
docker build -t finance-ai-backend .
```

### Run Container
```bash
docker run -p 3000:3000 finance-ai-backend
```

### Deployment with Kamal
```bash
bundle exec kamal setup
bundle exec kamal deploy
```

## Deployment

This project is configured for deployment with Kamal (Docker-based deployment tool). Deployment configuration is in `config/deploy.yml`.

For production:
1. Ensure all credentials are set
2. Run security scans
3. Run full test suite
4. Deploy using Kamal

## Common Commands

```bash
# Generate new migration
bundle exec rails generate migration CreateBudgets

# Generate new model with migration
bundle exec rails generate model User email:string password_digest:string

# Generate new controller
bundle exec rails generate controller Api::V1::Budgets

# Run Rails console (interactive Ruby shell)
bundle exec rails console

# Check routes
bundle exec rails routes
```

## Development Workflow

1. Create a new branch: `git checkout -b feature/your-feature`
2. Make changes following code style guidelines
3. Write tests for new functionality
4. Run tests and security scans locally
5. Commit and push: `git push origin feature/your-feature`
6. Open a pull request

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Database locked | `bundle exec rails db:reset` to reset (dev only) |
| Gem conflicts | `bundle update` then `bundle install` |
| Port 3000 in use | `lsof -i :3000` to find process, then `kill -9 <pid>` |
| Migration errors | Check `db/migrate/` for conflicting migrations, run `bundle exec rails db:rollback` if needed |

## Contributing

Please follow the code style guidelines and ensure all tests pass before submitting changes. Run the following before committing:

```bash
bundle exec rubocop -A && bundle exec brakeman && bundle exec bundle-audit && bundle exec rails test
```

## License

[Add your license information here]

## Support

For issues or questions, please open an issue in the repository.
