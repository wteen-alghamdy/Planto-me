# 🌱 Planto: Smart Plant Watering Reminder App

**Planto** is a native iOS application built with **SwiftUI** designed to help users manage their houseplant watering schedules efficiently. It provides visual progress tracking and local notifications to ensure your plants thrive.

---

## ✨ Features

* **Custom Reminders:** Easily set reminders for new and existing plants with specific needs.
* **Progress Tracking:** Visual progress bar updates in real-time as you complete watering tasks for the day.
* **Visual Completion:** Completed tasks are visually faded out but remain visible until the list is fully done.
* **Simple Management:** Swipe to delete or tap to edit existing plant reminders.
* **All Done State:** A fun, celebratory screen appears when all required tasks for the day are complete.
* **Persistence:** All plant data is saved locally on the device for long-term tracking.
* **Local Notifications:** Schedules local push notifications for upcoming watering days.

---

## 🛠️ Technology Stack

* **Language:** Swift 5.8+
* **Framework:** SwiftUI
* **Architecture:** MVVM (Model-View-ViewModel) with a focus on Reactive Programming.
* **Data Persistence:** Native `Codable` and `FileManager` (JSON serialization to the Documents directory).
* **Notifications:** `UserNotifications` framework using `UNTimeIntervalNotificationTrigger`.
* **Concurrency:** Modern Swift Concurrency (`async/await`) for Notification authorization and scheduling.

---

## 📂 Project Structure

The project follows a clean, modular file structure to separate concerns (MVVM + Services):

| Folder / Group | Description | Key Files |
| :--- | :--- | :--- |
| **Models** | Defines the core data structures and enums for plant characteristics. | `Plant.swift`, `Enums.swift` |
| **Managers** | Handles system-level interactions and background services. | `PersistenceManager.swift`, `NotificationManager.swift` |
| **ViewModels** | Manages application state, business logic, and prepares data for the views. | `PlantListViewModel.swift`, `SetReminderViewModel.swift` |
| **Views** | The main SwiftUI screens and logic for determining the app's current state. | `ContentView.swift`, `PlantListView.swift`, `EmptyStateView.swift` |
| **Views/Components** | Reusable UI elements used across different screens. | `PlantRowView.swift`, `ProgressHeaderView.swift`, `Tag.swift` |
| **Resources** | Global constants and design tokens. | `Theme.swift` (Custom Colors) |

---

## 💡 Key Architectural Details

### Data Flow

The app adheres to the MVVM pattern:
* `PlantListViewModel` acts as the single source of truth, managing the `@Published` `plants` array.
* Changes to the array are automatically saved via a `didSet` observer to `PersistenceManager.shared.save()`.
* All UI updates (progress, list changes, `showingAllDone` state) are triggered by changes in the ViewModel's `@Published` properties.

### Progress and Completion Logic

The `PlantListViewModel` uses stable, computed properties to ensure reliable progress tracking:

* `totalPlantsDueToday`: Provides a stable denominator by counting all plants that were due today (whether completed or not).
* `completedTodayCount`: Counts how many of the `totalPlantsDueToday` have been marked as done.
* `progress`: Calculated as `completedTodayCount / totalPlantsDueToday`.

This prevents the progress bar from glitching or reporting incorrect totals when a plant is checked (which causes it to temporarily leave the "undone" filter).

---

## 🚀 Getting Started

To run the project locally:

1.  **Clone the repository:**
    ```bash
    git clone [Your Repository URL]
    ```
2.  **Open in Xcode:** Open the `Planto.xcodeproj` file.
3.  **Run:** Select a simulator or your physical device and press **Cmd + R** (or the Run button ▶️).

***
*Developed by: Wteen Alghamdy*
