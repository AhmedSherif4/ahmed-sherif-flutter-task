# 🧩 Flutter Otex Task

A Flutter application built using **MVVM Architecture** with **Bloc** for state management and **GetIt** as a Service Locator to simplify dependency management.  
The project aims to provide a **clean, scalable structure** with a **responsive UI** connected to a local **SQLite database**.

---

## 🏗️ Architecture Overview

### 🔹 MVVM (Model - View - ViewModel)
- **Model:** Responsible for data logic and database interaction.
- **View:** The UI layer that displays data to the user.
- **ViewModel:** Acts as a bridge between the View and Model, handling events and state updates using Bloc.

---

## ⚙️ Core Concepts Used

### 🧱 Bloc State Management
Used **Bloc** for effective state management and separation of concerns between business logic and the UI layer.

### 🔍 GetIt & Injectable
- **GetIt:** Used as a **Service Locator** for managing app-wide dependencies.
- **Injectable:** Used for code generation to simplify and automate dependency injection.

### ♻️ Singleton Pattern
Applied **Singleton Pattern** to ensure single-instance classes for shared services such as the database or app-wide utilities.

### 💾 SQLite Database
Implemented local data storage using **sqflite**, providing a structured and efficient CRUD interface.

### 📱 Responsive UI
Designed a **responsive interface** adaptable to multiple screen sizes using layout widgets like **Expanded**, **Flexible**, and **LayoutBuilder**.

---

## 🧩 Packages Used

| Package | Version | Description |
|----------|----------|-------------|
| **sqflite** | ^2.4.2 | Local database for data persistence |
| **flutter_bloc** | ^9.1.1 | State management using the Bloc pattern |
| **bloc** | ^9.0.1 | Core library for Bloc architecture |
| **get_it** | ^8.0.3 | Service Locator for dependency management |
| **injectable** | ^2.5.0 | Automates dependency injection setup |
| **equatable** | ^2.0.7 | Simplifies equality comparison within Bloc states |
| **flutter_svg** | ^2.2.1 | For rendering SVG assets |
| **flutter_localization** | ^0.3.3 | Provides localization and multi-language support |
| **build_runner** | ^2.3.3 | Code generation tool during development |
| **freezed** | ^2.4.5 | Generates immutable data classes |
| **freezed_annotation** | ^2.4.1 | Annotations for Freezed package |
| **json_serializable** | ^6.6.2 | Generates serialization code between JSON and Dart models |
| **injectable_generator** | ^2.6.2 | Generates dependency injection code automatically |

---

## 🪄 Project Highlights

- Clean and scalable architecture
- High testability
- Clear separation between UI, logic, and data layers
- High performance using Bloc
- Fully responsive design for all screen sizes

---

## 🧑‍💻 Author

**Ahmed Sherif**  
Flutter Developer  
📧 Email: [ahmedsherif4175@gmail.com](mailto:ahmedsherif4175@gmail.com)  
📱 Phone: +20 112 549 6793

---
