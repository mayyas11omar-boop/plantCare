# F4 - Image Processing & Plant Analysis

## Overview
This feature covers the entire pipeline of preparing user-provided images for the AI and interpreting the results. It bridges the gap between raw pixels and actionable plant data.

## Technical Implementation

### Image Processing
- **Normalization:** Images from different sources (upload vs. camera) are converted into a unified DataURL format.
- **Downscaling:** While the raw images may be large, they are handled efficiently in memory before being sent to the API.
- **Base64 Encoding:** Ensures that image data can be transmitted reliably over standard JSON-based API requests.

### Analysis Logic
- **Filtering:** The application implements a "plant check" by looking at the `probability` score. If it's below 20%, the system informs the user that the image might not be a plant.
- **Result Aggregation:** The name from the identification step (F2) is used as a key to fetch additional content (F5).
- **History Integration:** Every successful analysis is automatically saved to the user's personal history, including the plant name, the certainty of the AI, and a link to the stored image.

## User Flow
1. The system receives image data.
2. It displays "جاري التحليل..." (Analyzing...) to provide immediate feedback.
3. The backend proxy processes the image and returns AI data.
4. The system validates the AI's confidence levels.
5. Final results are formatted and displayed.

## Best Practices Followed
- **Asynchronous Operations:** Uses `async/await` to ensure the UI remains responsive during the network-intensive analysis phase.
- **User Feedback:** Provides clear status indicators (loading, errors, success).
- **Data Persistence:** Ensures that identified plants aren't "lost" after the user leaves the page by saving them to a database.
