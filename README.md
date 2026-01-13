# Cricket Stats Calculator (Flutter)

A cross-platform Flutter application to **calculate and visualize key cricket statistics** for players and matches. Designed for cricket enthusiasts, players, and analysts who want precise batting and bowling metrics — all from an intuitive mobile interface.

This repository contains the source code for a Dart/Flutter app that computes common cricket stats such as batting average and strike rate, with plans for advanced features in future releases.

---

## Features

- **Batting Average Calculator** – Computes batting average from runs and dismissals.  
- **Strike Rate Calculator** – Calculates scoring efficiency (runs per 100 balls).  
- **Bowling Metrics (Planned)** – Economy, bowling average, strike rate, etc.  
- **Cross-Platform UI** – Flutter UI that runs on Android, iOS, Web, and Desktop.  
- **Responsive and Fast** – Built with Flutter’s performant widget system.

---

## Getting Started

These instructions will get you up and running locally for development and testing.

### Prerequisites

- Flutter SDK (3.0 or above recommended)  
- Dart SDK (bundled with Flutter)  
- IDE: Android Studio, VS Code, or IntelliJ IDEA  
- Mobile device or emulator for testing

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/khubaibhusain45/Cricket-Stats-Calculator-Flutter.git
cd Cricket-Stats-Calculator-Flutter
Install dependencies
```

```bash
flutter pub get
```

```bash
flutter run
```
Select your target platform (Android, iOS, Web, or Desktop).

## How It Works
- The app reads user inputs for cricket performance metrics and computes standard stats.


## Project Structure
lib/
 ├── main.dart          # App entry point
 ├── screens/           # UI screens
 ├── widgets/           # Reusable widgets
 └── utils/             # Calculation logic
assets/                 # Images, config files
test/                   # Unit and widget tests
