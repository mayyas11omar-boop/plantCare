# F1 - Image Upload

## Overview
The Image Upload feature allows users to select a plant image from their local device and upload it to the application for analysis. This is the primary entry point for users who already have a photo of the plant they wish to identify.

## Technical Implementation

### Frontend
- **HTML Element:** A standard `<input type="file" id="imageInput" accept="image/*">` is used to trigger the file selection dialog.
- **Handling Logic:** The `onchange` event of the input triggers a `FileReader` which reads the selected file as a DataURL (base64).
- **Preview:** Once read, the image is displayed in an `<img>` tag with `id="preview"` for user verification.
- **Trigger:** The DataURL is then passed to the `analyzePlant()` function to initiate the identification process.

### Backend
- **Storage:** The application uses `multer` to handle file storage. Images are saved in the `Backend/uploads/` directory with unique filenames.
- **Data Conversion:** When saving to the history, the base64 string from the frontend is converted back into a buffer and written to a physical `.jpg` file using `fs.writeFileSync`.
- **Database:** A record of the upload, including the user ID and the path to the saved image, is stored in the `plants` table via the `Plant` model.

## User Flow
1. User clicks the "Choose File" button (or the styled equivalent).
2. User selects an image file from their device.
3. The image is immediately previewed on the screen.
4. The system automatically begins the analysis of the uploaded image.

## Best Practices Followed
- **File Type Restriction:** The `accept="image/*"` attribute ensures users can only select image files.
- **Unique Filenames:** Prevents file name collisions in the storage directory.
- **Base64 for Instant Preview:** Allows for a fast, client-side preview without waiting for a server upload.
