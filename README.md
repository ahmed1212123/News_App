# 📰 News App

A Flutter-based mobile application that fetches and displays real-time news updates across various categories. The project is structured using clean development practices to ensure modularity, easy maintenance, and smooth performance.

---

## 🚀 Features & Functionality

- **Live News Updates:** Fetches up-to-date headlines and articles dynamically from news APIs.
- **Category Filtering:** Allows users to browse news across different sectors (e.g., Business, Sports, Science, Technology).
- **Efficient State Management:** Utilizes structured states for seamless user interface transitions between loading, success, and error states.
- **Responsive Layout:** Clean UI design tailored for various mobile screen sizes and orientations.

---

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev) (Dart)
- **State Management:** Bloc / Cubit
- **Network Client:** REST API integration (via Dio or Http client) for fetching remote data.

---

## 📁 Project Structure

The project follows a clean, structured directory layout within the `lib/` directory:

```text
lib/
├── layout/          # Main application wrapper and navigation structure
├── modules/         # Feature-specific screens (Business, Sports, Science, Settings, Search)
├── shared/          # Reusable widgets, styling constants, components, and network layers
└── main.dart        # Core entry point of the Flutter application
⚙️ Getting Started
Prerequisites
Flutter SDK installed on your machine.

Android Studio, VS Code, or Xcode (for iOS testing) with Flutter extensions.

Installation & Setup
Clone the repository:

Bash
git clone https://github.com/ahmed1212123/News_App.git
cd News_App
Install project dependencies:

Bash
flutter pub get
Run the application:

Bash
flutter run
📄 License
This project is open-source. Please check the repository for license details.

✉️ Contact
Ahmed - GitHub Profile

Project Link: https://github.com/ahmed1212123/News_App
