# F6 - Reminder System

## Overview
The Reminder System allows users to set personalized alerts for plant care tasks, such as watering or fertilization. It ensures that plants receive timely attention by providing audio and visual notifications at scheduled times.

## Technical Implementation

### Frontend (Storage & Logic)
- **Local Storage:** Alerts are persisted in the browser's `localStorage` under the key `"alerts"`, allowing them to survive page refreshes.
- **Data Structure:** Each alert is stored as an object containing a `time` (HH:MM) and a `message`.
- **Interval Check:** A `setInterval` runs every 30 seconds to check if the current system time matches any of the stored alerts.

### Audio Notification
- **Web Audio API:** The system uses `AudioContext` to generate a real-time beep sound (800Hz) when an alert is triggered. This avoids the need for external audio files.

### UI Components
- **HTML Form:** Includes a time picker (`<input type="time">`) and a textarea for the message.
- **Alert List:** Dynamically generated list that displays all active reminders with a delete option.

## User Flow
1. User navigates to the "Daily Alerts" page (`Reminder.html`).
2. User selects a time and enters a reminder message (e.g., "Water the Snake Plant").
3. User clicks "Add Alert", which saves the data and updates the list.
4. When the scheduled time arrives, the browser plays a beep sound and displays a standard alert box with the message.
5. User can view or delete existing alerts at any time.

## Best Practices Followed
- **Client-Side Persistence:** Using `localStorage` provides a lightweight way to store user preferences without a backend database.
- **Frequency Optimization:** Checking every minute is efficient and ensures alerts are triggered on time without excessive CPU usage.
- **No-Dependency Audio:** Generating sound via code ensures the feature works even if external assets fail to load.


