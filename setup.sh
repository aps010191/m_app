#!/bin/bash
set -e

echo "Cloning project repository..."
git clone YOUR_REPO_URL medicine_delivery_app
cd medicine_delivery_app

echo "Checking Flutter installation..."
flutter doctor

echo "Getting Flutter dependencies..."
cd mobile_app
flutter pub get

echo "Firebase CLI login..."
firebase login

echo "Initializing Firebase project (skip if already done)..."
firebase init # Choose Firestore, Storage, Hosting if needed

echo "Adding Firebase config files..."
echo "Place google-services.json in android/app/ and GoogleService-Info.plist in ios/Runner/ manually."

echo "Setting up Python virtual environment for OCR..."
cd ../python_functions
python3 -m venv venv
source venv/bin/activate
pip install google-cloud-functions google-cloud-vision functions-framework flask

echo "Local run of Python OCR function (for testing)..."
export PORT=8080
functions-framework --target=ocr_prescription

echo "Google Cloud SDK login..."
gcloud auth login

echo "Deploy Python OCR function to Google Cloud..."
gcloud functions deploy ocr_prescription --runtime python310 --trigger-http --allow-unauthenticated

echo "Setup complete!"
echo "You can now run the Flutter app locally and test all features."