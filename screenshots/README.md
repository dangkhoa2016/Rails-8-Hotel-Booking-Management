# Screenshot Documentation

> 🌐 Language / Ngôn ngữ: **English** | [Tiếng Việt](README.vi.md)

This document compiles the existing UI screenshots in the `screenshots` directory, making it easy to quickly reference the main screens of the `Rails 8 Hotel Booking Management` project.

## Overview

- Total images: 30
- Main UI groups:
  - Public and authentication pages
  - Admin dashboard
  - Data index pages
  - Data detail pages
  - Form edit pages
- Recorded themes:
  - Light theme
  - Dark theme

## 1. Public and Authentication Pages

| Image File | Screen | Short Description |
| --- | --- | --- |
| [home-page.png](./home-page.png) | Home page | Public landing page with navigation bar, hero banner, service introduction, and contact section. |
| [sign-in-page.png](./sign-in-page.png) | Sign in | Centered sign-in form with remember-me option and forgot-password link. |
| [registration-page.png](./registration-page.png) | Registration | New account registration form with email, password, and password confirmation. |

## 2. Admin Dashboard

| Image File | Screen | Short Description |
| --- | --- | --- |
| [admin-dashboard-page-theme-light.png](./admin-dashboard-page-theme-light.png) | Light dashboard | Admin dashboard in light theme, showing account information and record statistics. |
| [admin-dashboard-page-theme-dark.png](./admin-dashboard-page-theme-dark.png) | Dark dashboard | Admin dashboard in dark theme, with the same layout as the light version for UI comparison. |

## 3. Data Index Pages

| Image File | Screen | Short Description |
| --- | --- | --- |
| [customers-index-page.png](./customers-index-page.png) | Customer list | Customer index page with filters at the top and a grid of data cards. |
| [bookings-index-page.png](./bookings-index-page.png) | Booking list | Booking list with multiple filter fields and booking details shown on each card. |
| [booking_discounts-index-page.png](./booking_discounts-index-page.png) | Booking discounts list | List of booking discounts, showing discount type and applied reason. |
| [reservations-index-page.png](./reservations-index-page.png) | Reservation list | Reservation list by room, booking, check-in/check-out dates, and status. |
| [reviews-index-page.png](./reviews-index-page.png) | Review list | Customer review list by room, rating, and comment content. |
| [additional_services-index-page.png](./additional_services-index-page.png) | Additional services list | List of additional services with price, unit, and active status. |
| [facilities-index-page.png](./facilities-index-page.png) | Facilities list | List of facilities with name, short description, and status. |
| [promotions-index-page.png](./promotions-index-page.png) | Promotions list | Promotion list with effective date range, status, and discount type. |
| [room_types-index-page.png](./room_types-index-page.png) | Room types list | Room type list with identifying color and status. |
| [rooms-index-page.png](./rooms-index-page.png) | Rooms list | Room list with room type, hotel location, capacity, price, and status. |
| [users-index-page.png](./users-index-page.png) | Users list | User list by full name, email, role, and status. |
| [vip_customer_benefits-index-page.png](./vip_customer_benefits-index-page.png) | VIP benefits list | VIP benefits list by customer and discount amount in percentage or currency value. |

## 4. Data Detail Pages

| Image File | Screen | Short Description |
| --- | --- | --- |
| [show-user-profile-theme-light.png](./show-user-profile-theme-light.png) | User profile details | User profile page in light theme, showing account information and main action buttons. |
| [booking-show-page-tab-booking-discounts.png](./booking-show-page-tab-booking-discounts.png) | Booking details - booking discounts tab | Booking detail page with a tab linked to discounts applied to the booking. |
| [booking-show-page-tab-payments.png](./booking-show-page-tab-payments.png) | Booking details - payments tab | Booking detail page with a tab showing related payments. |
| [booking-show-page-tab-promotions.png](./booking-show-page-tab-promotions.png) | Booking details - promotions tab | Booking detail page with a tab showing the applied promotion. |
| [customer-show-page-tab-bookings.png](./customer-show-page-tab-bookings.png) | Customer details - bookings tab | Customer detail page with a tab listing the customer’s bookings. |
| [hotel-location-show-page.png](./hotel-location-show-page.png) | Hotel location details | Hotel location detail page and the list of rooms belonging to that location. |
| [promotion-show-page.png](./promotion-show-page.png) | Promotion details | Promotion detail page with the list of booking discounts using this promotion. |
| [review-show-page.png](./review-show-page.png) | Review details | Review detail page with customer information, room, rating, and review content. |

## 5. Form Edit Pages

| Image File | Screen | Short Description |
| --- | --- | --- |
| [edit-user-profile-theme-light.png](./edit-user-profile-theme-light.png) | Edit user profile | User profile edit form in light theme, including name, email, and password fields. |
| [edit-a-booking.png](./edit-a-booking.png) | Edit booking | Booking update form with customer, status, total amount, and discount notes. |
| [edit-a-payment.png](./edit-a-payment.png) | Edit payment | Payment update form with booking, amount, payment date, and payment method. |
| [edit-a-facility.png](./edit-a-facility.png) | Edit facility | Facility update form and a list of rooms linked to the facility using toggles. |
| [edit-a-room.png](./edit-a-room.png) | Edit room | Room update form with room type, location, price, capacity, and facilities. |

## 6. Quick UI Notes from the Screenshot Set

- The admin area uses a fixed left sidebar and a card-based content area on the right.
- Most index pages follow the same pattern: title, total record count, filters, card grid, pagination, and a create-new button.
- Most show pages use a large card with a header, detailed content, association sections, and an action group at the bottom.
- Most edit pages use a two-column layout on desktop and collapse vertically on smaller screens.
- Dark theme is the most frequently captured interface, but the dashboard and user profile screens already have light-theme screenshots for comparison.

## 7. Suggested Uses for This Document

- Use it when comparing the current UI before changing layouts or themes.
- Use it as a reference catalog when writing product documentation or pull request notes about UI changes.
- Use it to review consistency across index, show, and edit screens.
