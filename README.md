# Flutter MVVM Architecture with GetX & Dio

A production-ready Flutter application built with MVVM (Model-View-ViewModel) architecture pattern, utilizing GetX for state management and Dio for network operations.

## 📋 Overview

This project demonstrates a clean, scalable architecture for Flutter applications with proper separation of concerns, dependency injection, and environment-based configuration.

## ✨ Features

- **MVVM Architecture**: Clean separation between UI, business logic, and data layers
- **GetX State Management**: Reactive state management with minimal boilerplate
- **Dio HTTP Client**: Robust networking with interceptors and error handling
- **Service Locator Pattern**: Dependency injection using GetIt
- **Multi-Environment Support**: Easy switching between Local, Staging, and Production
- **Responsive UI**: Screen adaptation using flutter_screenutil
- **Internationalization**: Multi-language support with GetX translations
- **Custom Logging**: Centralized logging system for debugging
- **API Response Handling**: Standardized API response wrapper
- **Repository Pattern**: Abstract data layer for better testability

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── config/          # App configuration & environment setup
│   └── service_locator.dart  # Dependency injection setup
├── data/
│   ├── exceptions/      # Custom exception classes
│   ├── models/          # Data models with JSON serialization
│   ├── network/         # API client, interceptors, base services
│   └── repository/      # Repository implementations
├── res/
│   ├── app_url/         # API endpoints
│   ├── assets/          # Images, icons, etc.
│   ├── colors/          # Color constants
│   ├── fonts/           # Custom fonts
│   ├── localization/    # Translation files
│   ├── log/             # Logger configuration
│   └── routes/          # Navigation routes
├── utils/               # Utility functions and helpers
├── view/
│   ├── components/      # Reusable UI components
│   ├── screens/         # Application screens
│   └── widgets/         # Custom widgets
├── viewModels/
│   ├── controller/      # GetX controllers (ViewModels)
│   └── service/         # Business logic services
└── main.dart            # Application entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd structure_mvvm
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run code generation for JSON serialization:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:
```bash
flutter run
```

## 🔧 Configuration

### Environment Setup

The app supports multiple environments. Configure in `lib/main.dart`:

```dart
// Choose your environment
Environment.init(AppEnvironment.local);    // For local development
Environment.init(AppEnvironment.staging);  // For staging
Environment.init(AppEnvironment.production); // For production
```

### API Configuration

Update base URLs in `lib/core/config/app_config.dart` for each environment.

## 📦 Key Dependencies

| Package | Purpose |
|---------|---------|
| `get` | State management & navigation |
| `dio` | HTTP client for API calls |
| `get_it` | Service locator for dependency injection |
| `flutter_screenutil` | Responsive UI adaptation |
| `json_annotation` & `json_serializable` | JSON serialization |
| `google_fonts` | Custom fonts |
| `fluttertoast` | Toast notifications |
| `country_state_city` | Location data |

## 🏛️ Architecture Layers

### 1. View Layer
- Contains UI screens and widgets
- Observes ViewModel state changes
- Minimal business logic

### 2. ViewModel Layer
- GetX Controllers managing screen state
- Handles user interactions
- Communicates with repositories

### 3. Repository Layer
- Abstracts data sources
- Implements business logic
- Returns processed data to ViewModels

### 4. Data Layer
- API services and network calls
- Data models and serialization
- Exception handling

## 🔐 Network Layer

- **API Client**: Centralized Dio instance with interceptors
- **Auth Interceptors**: Automatic token injection
- **Error Handling**: Standardized error responses
- **Logging**: Request/response logging in debug mode

## 🧪 Code Generation

This project uses code generation for JSON serialization:

```bash
# Watch for changes and auto-generate
flutter pub run build_runner watch

# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📱 Responsive Design

Uses `flutter_screenutil` for responsive layouts:

```dart
// Adaptive sizing
Container(
  width: 100.w,   // Responsive width
  height: 50.h,   // Responsive height
  padding: EdgeInsets.all(10.r), // Responsive padding
)
```

## 🌍 Localization

Add translations in `lib/res/localization/languages.dart`:

```dart
Text('key'.tr) // Automatically translates based on locale
```

## 🛠️ Development Tips

- Use `AppLogger` for consistent logging across the app
- Follow the repository pattern for all data operations
- Keep ViewModels focused on UI state management
- Use dependency injection for better testability
- Leverage GetX reactive programming with `.obs` and `Obx()`

## 📝 Best Practices

- ✅ Separate business logic from UI
- ✅ Use const constructors where possible
- ✅ Implement proper error handling
- ✅ Follow Flutter naming conventions
- ✅ Keep widgets small and reusable
- ✅ Use environment-based configuration

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Developed with ❤️ using Flutter
