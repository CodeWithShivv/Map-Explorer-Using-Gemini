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

5. Build and Run the Application
After setting up the environment and adding your API keys, you can now run the app:
flutter run

How It Works
Search Functionality: The app allows users to search for places such as "Ancient Places", "Oldest Places in India". Upon submitting the search query, the app calls the Gemini API to generate a response with relevant location data.

Coordinates Retrieval: The Gemini API response contains location details (such as the name of the place). The app then uses Google Maps API to retrieve the geographical coordinates (latitude and longitude) of the selected location.

Map Navigation: Once the coordinates are obtained, the map zooms into that location using Google Maps. It marks the location with a custom marker, and users can view the place on the map.

BLoC for State Management: The app uses the BLoC pattern to manage the state. Events like search queries trigger changes in the state, and the UI updates accordingly. This allows for a smooth and responsive user experience.

Dio for Networking: Dio handles all network requests to fetch data from the Gemini API and Google Maps API, ensuring efficient error handling and network communication.

Example Workflow
Search for "Ancient Places":
The user types "Ancient Places" into the search bar.
The app sends the query to Gemini API to get a list of ancient places.
The app retrieves the coordinates of the ancient place from the API response.
The map updates to display the location, with a marker showing the city name.
Search for "Oldest Places in India":
The user types "Oldest Places in India".
The app queries the Gemini API, receives the response, and extracts the location coordinates.
The map navigates to the first result, zooming into the specified place.
Libraries and Tools Used
Flutter: Framework for building the mobile application.
Dio: HTTP client for making API requests.
BLoC: State management pattern used for handling app state.
Google Maps API: For rendering maps and displaying coordinates.
Gemini API: For generating AI-driven location-based responses.
Geocoding: Used for converting coordinates to place names.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Acknowledgments
This project is inspired by the Map Explorer demo and integrates with Google Maps API and Gemini API to provide users with an interactive and dynamic map experience.


### Key Sections in the README:
- **Project Overview**: Explains the core features, technologies, and architectural design of the app.
- **Setup Instructions**: Details the steps required to set up the app locally.
- **How It Works**: Provides an overview of how the app functions and the flow from searching for places to navigating to those places on the map.
- **Libraries and Tools Used**: Lists the essential tools and libraries used in the project.
- **Example Workflow**: Describes the expected user flow from searching for places to seeing the results on the map.

Let me know if you need further adjustments or additions!
