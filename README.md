# Blood Bank — Hospital Dashboard

The **hospital-side dashboard** of a two-app blood bank platform built with **Flutter**. Hospitals manage blood inventory, publish donation requests, and track donor responses.

> 🩸 Companion app: [blood_bank_donor](https://github.com/Shosha101/blood_bank_donor) — the donor-facing app.

## Features

- 📊 **Dashboard** — summary cards, blood-type availability overview, active requests table
- 🧪 **Inventory management** — track stock per blood type
- 📢 **Donation requests** — create and manage requests to donors
- 🕘 **Past requests** history
- ⚙️ **Settings**, 🔐 login with secure storage, sidebar navigation for desktop/web layouts

## Architecture

Clean, feature-first structure with a fully typed networking layer:

- **Retrofit + Dio** code-generated API services, cookie-based session handling
- **`ApiResult` / error model with freezed** — typed success/failure for every call
- **Cubit (flutter_bloc)** with freezed states, **get_it** dependency injection
- Centralized routing, theming, and responsive helpers

```
lib/
├── core/        # networking, di, routing, theming, responsive helpers, sidebar
└── features/
    ├── dashboard/
    ├── inventory_management/
    ├── past_requests/
    ├── login/
    └── settings/
```

## Getting Started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```
