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

## 📦 Packages

| Package | Version |
|---|---|
| `cached_network_image` | ^3.4.1 |
| `cookie_jar` | ^4.0.8 |
| `cupertino_icons` | ^1.0.8 |
| `dio` | ^5.9.0 |
| `dio_cookie_manager` | ^3.3.0 |
| `dropdown_button2` | ^2.3.9 |
| `easy_localization` | ^3.0.8 |
| `easy_sidemenu` | ^0.7.1 |
| `firebase_core` | ^4.0.0 |
| `flutter_bloc` | ^9.1.1 |
| `flutter_native_splash` | ^2.4.6 |
| `flutter_screenutil` | ^5.9.3 |
| `flutter_secure_storage` | ^9.2.4 |
| `flutter_svg` | ^2.2.0 |
| `freezed_annotation` | ^3.1.0 |
| `get_it` | ^8.2.0 |
| `group_dropdown_button` | ^1.0.4 |
| `hexcolor` | ^3.0.1 |
| `intl` | ^0.20.2 |
| `json_annotation` | ^4.9.0 |
| `path_provider` | ^2.1.5 |
| `pretty_dio_logger` | ^1.4.0 |
| `retrofit` | ^4.7.1 |
| `shared_preferences` | ^2.5.3 |
| `shimmer` | ^3.0.0 |
| `sidebarx` | ^0.17.2 |

<sub>Dev: `build_runner` with `freezed`, `json_serializable`, and `retrofit_generator`.</sub>
