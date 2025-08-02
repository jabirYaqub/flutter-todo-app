# miniproject_todo_app

A complete TODO list application built with Flutter.

![App Screenshot](assets/screenshot.gif) ## Description
This is a feature-rich and user-friendly TODO app designed to help you manage your daily tasks efficiently. The app provides a clean and modern user interface, allowing for seamless task management with reliable local data persistence.

## Features
- **Task Management:** Create, read, update, and delete tasks.
- **Task Status:** Mark tasks as incomplete or completed with a simple checkbox.
- **Filtering:** Easily filter tasks by "Incomplete" and "Completed" status.
- **Searching:** A search bar to quickly find tasks by their title.
- **Persistence:** All tasks are saved locally, ensuring your data is available even after the app is closed.
- **Task Details:** View a detailed screen for each task, showing its title, description, and creation date.

## Tech Stack
- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Local Database:** [sqflite](https://pub.dev/packages/sqflite)
- **UI:** Custom widgets with a clean, modern theme.

## Installation and Setup
To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone [[https://github.com/](https://github.com/)[jabirYaqub]/[flutter-todo-app].git](https://github.com/jabirYaqub/flutter-todo-app.git)
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd flutter-todo-app
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the app:**
    ```bash
    flutter run
    ```

## Project Structure
The project follows a clean architecture to separate concerns:
- `lib/models`: Contains the `Task` data model.
- `lib/services`: Manages all database operations using `sqflite`.
- `lib/providers`: Implements state management logic using `Provider`.
- `lib/screens`: Holds the main screens of the app (e.g., `HomeScreen`).
- `lib/widgets`: Contains reusable UI components (e.g., `TaskItem`).

## Author
- Jabir Bin Yaqub - [Your GitHub Profile URL]
