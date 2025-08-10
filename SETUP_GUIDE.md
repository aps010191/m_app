# Automated Setup Guide: Medicine Delivery App

This guide and script help you automate local checkout, project setup, and deployment for your Flutter + Firebase + Python OCR app.

---

## Prerequisites

- **macOS** with Homebrew
- **Flutter** (`brew install --cask flutter`)
- **Xcode** (App Store)
- **Android Studio** (download from [developer.android.com/studio](https://developer.android.com/studio))
- **Python 3** (`brew install python`)
- **Node.js & npm** (`brew install node`)
- **Firebase CLI** (`npm install -g firebase-tools`)
- **Google Cloud SDK** ([cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install))
- **Git** (`brew install git`)
- **file_picker** Flutter plugin (for prescription upload)

---

## Automated Setup Script

Save this as `setup.sh` in your project root.

```bash
# See setup.sh in the repo for full content
```

---

## Local Checkout & Run

1. **Clone the repo and run the script:**  
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```
2. **Add Firebase config files:**  
   - Download from Firebase Console  
   - Place `google-services.json` in `mobile_app/android/app/`  
   - Place `GoogleService-Info.plist` in `mobile_app/ios/Runner/`  
3. **Run the Flutter app:**  
   ```bash
   cd mobile_app
   flutter run
   ```
4. **Run the Python OCR function locally for testing:**  
   ```bash
   cd ../python_functions
   source venv/bin/activate
   functions-framework --target=ocr_prescription
   # Use http://localhost:8080 in your app for OCR endpoint
   ```
5. **Deploy OCR to Google Cloud:**  
   ```bash
   gcloud functions deploy ocr_prescription --runtime python310 --trigger-http --allow-unauthenticated
   # Use the deployed endpoint in your Flutter app
   ```

---

## What to Check Into Version Control

- All Dart/Flutter source code (`mobile_app/`)
- Python OCR function code (`python_functions/`)
- Setup scripts (`setup.sh`)
- Documentation (`SETUP_GUIDE.md`)
- **DO NOT** commit Firebase secret config files (`google-services.json`, `GoogleService-Info.plist`)
- **DO NOT** commit `.env` files with secrets

---

## Project Structure

```
medicine_delivery_app/
├── mobile_app/                # Flutter codebase
├── python_functions/          # Python OCR backend
├── setup.sh                   # Automated setup script
├── SETUP_GUIDE.md             # This documentation
```

---

## Environment Variables

- For Python OCR, set your Google credentials as needed for Cloud Vision API.
- For Flutter, Firebase config is handled via the downloaded config files.

---

## Next Steps

- Connect your Flutter UI to Firebase (Auth, Firestore, Storage)
- Use Python OCR endpoint in your prescription upload screen
- Test locally (`flutter run`, local OCR function)
- Deploy to Google Cloud and Firebase for production

---

**For more details about each screen’s business logic and code samples, see app documentation or ask for a specific implementation.**