# F5 - Description Display

## Overview
The Description Display feature enriches the identification result by fetching and displaying relevant botanical information about the plant. This turns a simple name into an educational experience.

## Technical Implementation

### External Data Integration
- **Source:** The feature integrates with the [Wikipedia API](https://en.wikipedia.org/api/rest_v1/).
- **Multi-lingual Fallback:**
    1. First, it attempts to find a summary on the **Arabic Wikipedia**.
    2. If no Arabic entry is found, it automatically falls back to searching the **English Wikipedia**.
- **Dynamic Fetching:** The description is fetched on-the-fly as soon as a plant is identified.

### Text Formatting
- **Extraction:** The system pulls the `extract` field from the Wikipedia summary response.
- **Structured Content:** A custom `formatText()` function splits the summary into individual sentences and wraps them in an HTML unordered list (`<ul>`).
- **Sanitization:** Basic text processing ensures that any empty or overly short fragments are filtered out before display.

## User Flow
1. A plant is successfully identified by the AI.
2. The plant's name is sent to the Wikipedia fetching service.
3. The description is retrieved and formatted into bullet points.
4. The description is displayed directly below the plant name and confidence score.

## Best Practices Followed
- **User Education:** Provides context beyond just a name, helping users learn more about their plants.
- **Robust Fetching:** The fallback mechanism ensures that users get information even for rare plants that might not have Arabic entries.
- **Clean UI:** Using bullet points makes the botanical summaries much easier to read on both mobile and desktop screens.
