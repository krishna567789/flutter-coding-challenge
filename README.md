# Flutter User List App

A Flutter application that fetches and displays a list of users with search, filtering, pagination, responsive layout, and theme support.

---

## Features

* User list fetched from API
* Infinite scrolling (pagination)
* Pull to refresh
* Search users
* Filter users by gender
* Responsive UI (Mobile & Tablet)
* Light / Dark theme toggle
* Shimmer loading effect
* Cached network images
* Clean UI components

---

## Architecture

The project follows a simple and scalable structure using **Provider** for state management.

State management: Provider
Architecture: Feature-based structure


---

## Packages Used

provider – state management
cached_network_image – image caching
shimmer – loading skeleton UI

---

## UI Features

### User List Screen

* Displays users with avatar, name and details
* Responsive layout

Mobile → ListView
Tablet → GridView

### Search

Users can search by name using the search bar.

### Gender Filter

Dropdown filter allows selecting:

* Male
* Female

### Pagination

More users are loaded automatically when scrolling to the bottom.

### Pull to Refresh

Swipe down to refresh the user list.

### Loading UI

A shimmer skeleton loader appears while fetching data.

### No Data State

Displays a clean "No Data Found" UI when no results are available.

---

## Theme Support

The app supports both **Light Mode** and **Dark Mode** with a toggle button in the AppBar.

---

## Responsive Design

Responsive layout implemented using custom utilities.

Mobile: Single column list
Tablet: Two-column grid

---

## How to Run

1. Clone the repository

git clone <repo_url>

2. Navigate to project

cd project_name

3. Install dependencies

flutter pub get

4. Run the app

flutter run

---

## Improvements (Future Scope)

* Error handling UI
* Debounced search
* Better grid layout for large screens
* Shimmer for list items

---

## Author

Krishna Kumar Maurya
Flutter Developer
