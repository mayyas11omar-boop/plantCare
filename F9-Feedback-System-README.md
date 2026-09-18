# F9 - Feedback System

## Feature Overview
The Feedback System allows MyPlant users to submit structured feedback about the platform. Feedback is divided into two main types: complaints and suggestions.

## Feedback Types

### 1. Complaint
A complaint is used when the user faces an issue or bug while using the system. Complaint categories include:
- Website is slow
- Button is not working
- Wrong information
- Reminder issue
- Plant Identification issue
- Another

### 2. Suggestion
A suggestion is used when the user wants to recommend an improvement or a new idea that could make the system better.

## Admin Dashboard
The Admin Feedback Dashboard displays all submitted feedback records from the database. The admin can review complaints and suggestions, filter by type/status, and update the status of each record to:
- New
- In Progress
- Resolved

## Backend APIs

### Submit Feedback
`POST /api/feedback`

Request body example:
```json
{
  "feedbackType": "Complaint",
  "complaintCategory": "Plant Identification issue",
  "title": "Plant Identification button does not work",
  "message": "When I upload an image, the result does not appear."
}
```

### Get Feedback List for Admin
`GET /api/admin/feedback`

Optional query parameters:
- `type=Complaint` or `type=Suggestion`
- `status=New`, `status=In Progress`, or `status=Resolved`

### Update Feedback Status
`PATCH /api/admin/feedback/:id/status`

Request body example:
```json
{
  "status": "In Progress"
}
```

## Database Table
The feature stores feedback inside the `feedbacks` table. The backend creates this table automatically if it does not exist. A manual SQL script is also available in `backend_new/schema_feedback.sql`.
