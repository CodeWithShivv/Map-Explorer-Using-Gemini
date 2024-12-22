# Map Explorer App

**Map Explorer** is an interactive map application built using **Flutter** and **Dio** for network management. It integrates with **Gemini API** for generating dynamic location-based data and **Google Maps API** for displaying maps and coordinates. This app allows users to explore locations like ancient places, oldest places, and more by searching and navigating on the map.

---

## Project Overview

The **Map Explorer** app is designed to explore different places on the map using **Gemini AI** and **Google Maps API**. The app provides the functionality to search for various places such as ancient places, oldest places in India, etc., and navigate to those locations on the map. The project uses **BLoC** architecture for state management and **MVVM** architecture to ensure separation of concerns, making it easy to manage app state, business logic, and UI.

### Key Features:
- **Search Places**: Users can search for places (e.g., "Ancient Places", "Oldest Places in India").
- **Navigate to Places**: The app navigates to the selected location based on the search result.
- **Gemini API Integration**: Uses Gemini API to generate AI-driven responses and suggestions based on user input.
- **Google Maps Integration**: Displays maps using Google Maps API and allows navigation to specific coordinates.
- **BLoC Architecture**: Implements BLoC for state management to ensure a reactive and scalable app structure.
- **Dio for Network Requests**: Uses Dio to handle network requests, ensuring smooth communication with APIs.

### Architecture:
- **BLoC Architecture**: For managing app state and handling business logic in a reactive manner.
- **MVVM Pattern**: The Model-View-ViewModel (MVVM) pattern is used to structure the app in a maintainable and testable way.
- **Dio**: Network requests are managed using the Dio library for seamless API communication.

---

## Setup Instructions

To run the Map Explorer app locally, follow the instructions below:

### Prerequisites
- **Flutter** (latest stable version)
- **Dio** (for API calls)
- **Gemini API Key**: To interact with the Gemini AI.
- **Google Maps API Key**: To load and interact with Google Maps.

### 1. Clone the repository


git clone https://github.com/yourusername/map_explorer.git
cd map_explorer
2. Install Dependencies
Ensure that you have all the required dependencies installed by running:


3. Set up Environment Variables
Create a .env file in the root directory of your project and add your API keys:


GEMINI_API_KEY=YOUR_GEMINI_API_KEY
GOOGLE_MAPS_API_KEY=YOUR_GOOGLE_MAPS_API_KEY

Replace YOUR_GEMINI_API_KEY and YOUR_GOOGLE_MAPS_API_KEY with the actual keys.

4. Update Android Configuration
For Android, make sure to add the Google Maps API Key to the AndroidManifest.xml file:


<application>
  <meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="@string/google_maps_api_key" />
</application>

    
Then, define the key in res/values/strings.xml:

<resources>
  <string name="google_maps_api_key">YOUR_GOOGLE_MAPS_API_KEY</string>
</resources>




