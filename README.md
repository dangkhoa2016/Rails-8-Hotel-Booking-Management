# Rails 8 Hotel Booking Management

> 🌐 Language / Ngôn ngữ: **English** | [Tiếng Việt](README.vi.md)

`Rails 8 Hotel Booking Management` is a Rails 8 application for managing hotel operations through a public landing page and an authenticated back-office area. The system covers the core business domains for hotel locations, rooms, room types, customers, bookings, reservations, payments, promotions, VIP benefits, reviews, additional services, and internal users.

## Main features

- Public landing page at `/` with service and contact sections.
- Authentication, registration, password recovery, and user profile management with Devise.
- Dashboard at `/dashboard` after sign-in, showing row counts across application tables.
- CRUD management for `customers`, `vip_customer_benefits`, `room_types`, `rooms`, `hotel_locations`, `facilities`, `additional_services`, `bookings`, `reservations`, `special_requests`, `booking_discounts`, `payments`, `promotions`, `reviews`, and `users`.
- Role-based authorization with Pundit using `normal`, `manager`, and `admin` roles.
- Automatic booking total recalculation from reservations, additional services, discounts, and VIP discounts.
- Locale switching for `en` and `vi` using cookies.
- `light`, `dark`, and `auto` theme modes via Stimulus and `localStorage`.
- Responsive Bootstrap 5 admin UI.
- Pagination with Pagy.

## Technologies used

- Ruby `3.4.1` from [.ruby-version](.ruby-version)
- Rails `8.0.2`
- SQLite for development/test, and SQLite-backed split production databases for primary/cache/queue/cable
- Hotwire: Turbo + Stimulus
- Importmap + Propshaft, with no Node-based frontend build required to run the app
- Bootstrap `5.3.3` and Bootstrap Icons
- Devise for authentication
- Pundit for authorization
- Pagy for pagination
- Solid Cache, Solid Queue, and Solid Cable
- Minitest, Capybara, and Selenium for automated testing
- Brakeman, RuboCop, and `bin/importmap audit` in CI

## Business model overview

- `Customer`: customer profile, type, and status
- `VipCustomerBenefit`: VIP discount rules by percentage or fixed amount
- `RoomType`, `Room`, `Facility`, `HotelLocation`: room catalog and hotel infrastructure
- `Booking`: top-level booking record linked to customers, reservations, discounts, and payments
- `Reservation`: actual room stays with check-in/check-out data and pricing
- `AdditionalService` and `BookingAdditionalService`: extra services attached to reservations
- `Promotion` and `BookingDiscount`: campaign and discount data applied to bookings
- `Payment`: one-time, installment, and subscription payments
- `Review`: customer feedback for room and service quality
- `User`: internal account with role and status

## Environment requirements

- Ruby `3.4.1`
- Bundler
- SQLite3
- Git
- `build-essential`, `libyaml-dev`, and `pkg-config` on Linux for native gem compilation when needed
- Google Chrome or Chromium for system tests

## Quick start

1. Install dependencies:

```bash
bundle install
```

2. Optionally copy the sample environment file if you want the provided port and logging settings:

```bash
cp .env.sample .env
```

3. Prepare the database:

```bash
bin/setup --skip-server
```

4. Start the application:

```bash
bin/rails server
```

Or run:

```bash
bin/setup
```

`bin/setup` installs gems, runs `db:prepare`, clears logs/tmp files, and starts the server.

## Accessing the app

- With `.env.sample`, the app runs at `http://localhost:4000`
- Without `.env`, Rails defaults to `http://localhost:3000`
- Public page: `/`
- Signed-in dashboard: `/dashboard`
- User profile: `/user/profile`

## Sample accounts and seed data

The seed file [db/seeds/users.rb](db/seeds/users.rb) defines these development accounts:

- Admin: `admin@admin.admin` / `adminadmin`
- Manager: `manager1@example.com` / `password`
- Manager: `manager2@example.com` / `password`
- Normal users: `user1@example.com` through `user5@example.com` / `password`

Outside development, admin credentials are loaded from:

- `ADMIN_EMAIL`
- `ADMIN_PASSWORD`
- or Rails credentials `admin_email` / `admin_password`

To seed the full dataset:

```bash
bin/rails db:seed
```

The current seed path has been verified after fixing the schema drift in promotion and room type seeds.

## Testing and quality checks

Run unit and integration tests:

```bash
bin/rails test
```

Run system tests:

```bash
bin/rails test:system
```

Run the same test command used in CI:

```bash
RAILS_ENV=test bin/rails db:test:prepare test test:system
```

Run linting and security checks:

```bash
bin/rubocop
bin/brakeman --no-pager
bin/importmap audit
```

CI currently runs four main groups of checks:

- Brakeman
- Importmap audit
- RuboCop
- Rails tests plus system tests

If a system test fails on GitHub Actions, the workflow uploads screenshots from `tmp/screenshots`.

## UI and UX notes

- Fixed admin sidebar on the left for back-office navigation
- Dashboard supports light and dark themes
- Locale switcher for `en` and `vi` on both the landing page and the admin area
- Theme switcher applies `data-bs-theme` on the root HTML element
- The app allows only modern browsers through `allow_browser versions: :modern`

## Important directories

- [app/models](app/models): domain models and business rules
- [app/controllers](app/controllers): controllers for the landing page, dashboard, and CRUD resources
- [db/seeds](db/seeds): sample data split by domain
- [test](test): Minitest, fixtures, and system tests
- [screenshots](screenshots): UI screenshot catalog
- [screenshots/README.md](screenshots/README.md): categorized screenshot documentation

## Current caveats

- [Dockerfile](Dockerfile) still sets `ARG RUBY_VERSION=3.2.7`, while [.ruby-version](.ruby-version) is `3.4.1`. These should be aligned before building the production image.

## Deployment

- The repository already includes a production [Dockerfile](Dockerfile).
- `kamal` and `thruster` are present in the dependency tree for Rails 8 style deployment.
- Production still defaults to SQLite databases under `storage/`.

## Related documentation

- Screenshot catalog: [screenshots/README.md](screenshots/README.md)
- Vietnamese documentation: [README.vi.md](README.vi.md)

## License

No dedicated project license is declared in this README at the moment.
