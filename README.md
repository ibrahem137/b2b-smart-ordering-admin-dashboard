# B2B Smart Ordering System – Admin Dashboard

[![Flutter CI](https://github.com/ibrahem137/b2b-smart-ordering-admin-dashboard/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/ibrahem137/b2b-smart-ordering-admin-dashboard/actions/workflows/flutter_ci.yml)

A Flutter-based admin dashboard for a B2B smart ordering platform designed for supermarkets and suppliers.

The dashboard provides centralized management for suppliers, categories, products, supplier offers, purchase orders, sales, and business analytics.

## Features

- Admin authentication
- Dashboard overview and analytics
- Supplier management
- Supplier category assignment
- Category management with custom colors
- Master product management
- Supplier product offers
- Purchase order management
- Sales monitoring and profit tracking
- Search and filtering
- Light / Dark / System theme support
- Responsive desktop and web interface
- Secure token-based authentication
- REST API integration

## Tech Stack

- Flutter
- Dart
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
- Material 3

## Architecture

The project follows a feature-based architecture with separated layers for:

- Data
- Domain
- Presentation
- Networking
- Dependency Injection
- Routing
- Theme Management

Example structure:

```text
lib/
├── core/
│   ├── di/
│   ├── networking/
│   ├── router/
│   ├── services/
│   ├── theme/
│   └── widgets/
│
├── screens/
│   ├── auth/
│   ├── dashboard/
│   ├── suppliers/
│   ├── categories/
│   ├── master_products/
│   ├── supplier_products/
│   ├── orders/
│   ├── sales/
│   └── settings/
│
└── main.dart
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