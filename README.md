# B2B Smart Ordering System - Admin Dashboard

[![Flutter CI](https://github.com/ibrahem137/b2b-smart-ordering-admin-dashboard/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/ibrahem137/b2b-smart-ordering-admin-dashboard/actions/workflows/flutter_ci.yml)

A Flutter-based Admin Dashboard for the **B2B Smart Ordering System**, designed to provide centralized management for supermarkets, suppliers, products, orders, sales, and supplier offers.

The dashboard communicates with a Laravel REST API and provides administrators with the tools required to manage and monitor the platform from a responsive web and desktop interface.

## Features

- Admin authentication
- Dashboard overview and business analytics
- Supplier management
- Supplier category assignment
- Category management with custom colors
- Master product management
- Supplier product management
- Supplier offer management
- Store management
- Purchase order management
- Order status management
- Sales monitoring
- Search and filtering
- Pagination
- Light, Dark, and System theme support
- Responsive web and desktop interface
- Secure token-based authentication
- REST API integration
- Centralized API error handling

## Tech Stack

- Flutter
- Dart
- Material 3
- Cubit / Bloc
- Dio
- Retrofit
- Freezed
- JSON Serializable
- GetIt
- Shared Preferences
- Flutter Secure Storage
- FL Chart
- SidebarX
- Easy Localization

## Architecture

The project follows a feature-based architecture with separation between UI, business logic, data handling, networking, and shared application services.

```text
lib/
|-- core/
|   |-- di/
|   |-- networking/
|   |-- router/
|   |-- services/
|   |-- theme/
|   `-- widgets/
|
|-- screens/
|   |-- auth/
|   |-- dashboard/
|   |-- suppliers/
|   |-- categories/
|   |-- master_products/
|   |-- supplier_products/
|   |-- supplier_offers/
|   |-- stores/
|   |-- orders/
|   |-- sales/
|   `-- settings/
|
`-- main.dart
```

## Backend Integration

The dashboard communicates with the **B2B Smart Ordering System Laravel Backend** through REST APIs.

For local development, the API base URL is configured in the networking layer.

Example:

```dart
static const String baseUrl = 'http://127.0.0.1:8000/api';
```

Make sure the Laravel backend is running before starting the dashboard.

Example:

```bash
php artisan serve
```

## Getting Started

### Requirements

Before running the project, make sure you have:

- Flutter SDK installed
- Dart SDK
- Git
- A running instance of the B2B Laravel backend
- Chrome for Flutter Web development, or the required desktop development tools

Check your Flutter environment:

```bash
flutter doctor
```

### Installation

Clone the repository:

```bash
git clone https://github.com/ibrahem137/b2b-smart-ordering-admin-dashboard.git
```

Enter the project directory:

```bash
cd b2b-smart-ordering-admin-dashboard
```

Install dependencies:

```bash
flutter pub get
```

Generate the required Retrofit, Freezed, and JSON serialization files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the dashboard on Chrome:

```bash
flutter run -d chrome
```

## Code Generation

The project uses code generation for:

- Retrofit API clients
- Freezed models and states
- JSON serialization

After modifying generated models or API definitions, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Quality Checks

Run static analysis before committing changes:

```bash
flutter analyze
```

## Screenshots

### Admin Login

<p align="center">
  <img src="docs/screenshots/login.jpg" width="800" alt="Admin Login">
</p>

### Dashboard

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/dashboard_dark.jpg" alt="Dashboard Dark Mode"> | <img src="docs/screenshots/dashboard_light.jpg" alt="Dashboard Light Mode"> |

### Suppliers Management

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/suppliers_dark.jpg" alt="Suppliers Dark Mode"> | <img src="docs/screenshots/suppliers_light.jpg" alt="Suppliers Light Mode"> |

### Add Supplier

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/add_supplier_dark.jpg" alt="Add Supplier Dark Mode"> | <img src="docs/screenshots/add_supplier_light.jpg" alt="Add Supplier Light Mode"> |

### Categories Management

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/categories_dark.jpg" alt="Categories Dark Mode"> | <img src="docs/screenshots/categories_light.jpg" alt="Categories Light Mode"> |

### Master Products

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/master_products_dark.jpg" alt="Master Products Dark Mode"> | <img src="docs/screenshots/master_products_light.jpg" alt="Master Products Light Mode"> |

### Supplier Products

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/supplier_products_dark.jpg" alt="Supplier Products Dark Mode"> | <img src="docs/screenshots/supplier_products_light.jpg" alt="Supplier Products Light Mode"> |

### Purchase Orders

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/orders_dark.jpg" alt="Purchase Orders Dark Mode"> | <img src="docs/screenshots/orders_light.jpg" alt="Purchase Orders Light Mode"> |

### Sales Management

| Dark Mode | Light Mode |
| --- | --- |
| <img src="docs/screenshots/sales_dark.jpg" alt="Sales Dark Mode"> | <img src="docs/screenshots/sales_light.jpg" alt="Sales Light Mode"> |

## Related Repository

The Laravel backend is maintained in a separate repository:

**B2B Smart Ordering System - Backend**

## Project Purpose

This dashboard is part of the **B2B Smart Ordering System for Supermarkets**, developed as an academic software engineering project.

The system aims to improve the ordering workflow between supermarkets and suppliers by providing centralized product management, supplier offers, order tracking, sales monitoring, inventory-related operations, and administrative analytics.

## Author

**Ibrahem Alhuossien**

Information Engineering  
University of Aleppo