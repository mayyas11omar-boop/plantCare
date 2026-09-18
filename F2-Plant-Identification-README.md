# F2 - Plant Identification

## Overview
The Plant Identification feature is the core intelligence of the application. it utilizes advanced machine learning via an external API to accurately identify plant species from images provided by the user.

## Technical Implementation

### External API Integration
- **Service Provider:** The application integrates with the [Plant.id API](https://plant.id/).
- **API Key Management:** The API key is stored securely on the backend (`server.js`) to prevent exposure on the client side.
- **Proxy Endpoint:** The frontend communicates with a local endpoint `/api/identify`, which acts as a proxy to the Plant.id service.

### API Request Structure
- **Method:** POST
- **Payload:** A JSON object containing an array of base64 encoded images.
- **Parameters:** `similar_images` is set to false by default to focus on direct identification.

### Response Handling
- **Suggestions:** The API returns a list of potential plant matches (`suggestions`).
- **Probability:** Each suggestion includes a confidence score (`probability`) between 0 and 1.
- **Selection:** The application automatically selects the top suggestion if its probability exceeds a certain threshold (20%).

## User Flow
1. After an image is uploaded or captured, it is sent to the backend proxy.
2. The proxy forwards the request to Plant.id.
3. The identification results (name and probability) are returned to the frontend.
4. The results are displayed to the user in the results section.

## Best Practices Followed
- **Secure API Proxying:** Protects the sensitive API key from being stolen by malicious users.
- **Error Handling:** Specifically handles rate limiting (HTTP 429) and provides user-friendly error messages.
- **Data Validation:** Verifies that the provided image is actually a plant before proceeding with detailed analysis.
