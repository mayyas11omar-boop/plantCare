# F3 - Live Camera Capture

## Overview
The Live Camera Capture feature enables users to take a real-time photo of a plant using their device's camera. This provides a dynamic and interactive way to identify plants directly in the field.

## Technical Implementation

### Media Streams
- **API Used:** `navigator.mediaDevices.getUserMedia({ video: true })`
- **Stream Management:** When "Start Camera" is clicked, a stream is captured from the default video input and assigned to a hidden `<video>` element.
- **Display:** The video element is made visible, providing a live viewfinder for the user.

### Capturing the Frame
- **Canvas Work:** When "Capture Image" is clicked, the current frame of the video element is drawn onto a hidden `<canvas>` element using `drawImage()`.
- **Data Extraction:** The canvas content is then converted into a JPEG DataURL using `canvas.toDataURL('image/jpeg')`.
- **Cleanup:** All active camera tracks are stopped (`track.stop()`) immediately after capture to save battery and ensure privacy.

## User Flow
1. User clicks "تشغيل الكاميرا" (Run Camera).
2. If prompted, the user grants camera permissions.
3. A live video feed appears on the screen.
4. User clicks "التقاط الصورة" (Capture Image) when the plant is in focus.
5. The live feed stops, and the captured frame is used for analysis.

## Best Practices Followed
- **Privacy Conscious:** Explicitly stops the camera stream when it is no longer needed.
- **Responsive Design:** Camera feed scales to fit different screen sizes.
- **Hardware Agnostic:** Uses standard Web APIs that work across modern browsers on both desktops and mobile devices.
