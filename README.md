# B2B Smart Ordering System – Admin Dashboard

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