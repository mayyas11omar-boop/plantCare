# Saffa Project - Run and Verify

## 1) Prerequisites

Install these before running:

- Node.js
- MySQL Server

## 2) Configure database connection

Go to `backend_new` and copy:

```text
.env.example
```

Rename the copy to:

```text
.env
```

Then set your MySQL password:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=YOUR_MYSQL_PASSWORD
DB_NAME=saffa_project
DB_PORT=3306
PORT=3000
SESSION_SECRET=saffa-local-secret
```

The backend will create the database and the required tables automatically when it starts.

## 3) Run the project on Windows

Double-click:

```text
RUN_PROJECT_WINDOWS.bat
```

Or run manually:

```powershell
cd backend_new
npm install
npm start
```

## 4) Verify pages

Open these URLs:

```text
http://localhost:3000/api/health
http://localhost:3000/login.html
http://localhost:3000/signup.html
http://localhost:3000/feedback.html
http://localhost:3000/admin-feedback.html
```

## 5) Verify the Feedback API with PowerShell

```powershell
$body = @{
  feedbackType = "Complaint"
  complaintCategory = "Website is slow"
  title = "Slow home page"
  message = "The website is slow when opening the home page."
} | ConvertTo-Json

Invoke-RestMethod `
  -Uri "http://localhost:3000/api/feedback" `
  -Method Post `
  -ContentType "application/json" `
  -Body $body

Invoke-RestMethod `
  -Uri "http://localhost:3000/api/admin/feedback" `
  -Method Get
```

## 6) Verify login flow

1. Open `http://localhost:3000/signup.html`
2. Create an account.
3. Open `http://localhost:3000/login.html`
4. Login using the same email and password.
5. You should be redirected to `index.html`.

## Important

Do not open pages using `file:///...`.
Always use:

```text
http://localhost:3000/page-name.html
```
