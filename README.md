# Alapon 💬

**Alapon** is a modern Flutter chat application built using **Clean Architecture** to ensure high maintainability, scalability, and testability.

---

## 🚀 Tech Stack & Versions
* **Flutter Version:** 3.3.8 
* **Android SDK:** 35 (Latest)
* **Architecture:** Clean Architecture (Feature-driven)
* **Language:** Dart & Kotlin (JVM 17)

---

## 🏗️ Architecture Overview
This project follows **Clean Architecture** principles, separating concerns into distinct layers:

* **Core:** Global utilities, constants, themes, and shared components used across the app.
* **Features:** Independent modules for each functionality (e.g., Auth, Chat).
    * **Presentation:** UI Layer containing Screens (Pages) and Reusable Widgets.
    * **Domain:** Business logic layer containing Entities and Use Cases.
    * **Data:** Data layer handling Repositories and Data Sources (API/Local DB).

---

## 📂 Project Structure
```text
lib/
├── core/               # Shared logic & components
└── features/
    ├── auth/           # Authentication module
    └── chat/           # Chat module
        └── presentation/
            ├── pages/    # Screen UI (e.g., chat_list_page.dart)
            └── widgets/  # Reusable components (e.g., chat_app_bar.dart)
 

