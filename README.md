# Medicine Delivery App (Apollo Pharmacy Clone)

## Features
- User authentication (Firebase Auth)
- Medicine catalog (Firestore)
- Cart, checkout, address management
- Prescription upload (Storage)
- Payment gateway integration (stub)
- Order management & push notifications
- Admin panel (scope)
- Python Cloud Function for OCR

## Prerequisites
- [Flutter](https://docs.flutter.dev/get-started/install)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- [Python 3.9+](https://www.python.org/downloads/)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

---

## 1. Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/) and create a new project.
2. Add Android/iOS apps; download `google-services.json`/`GoogleService-Info.plist` to `mobile_app/`.
3. Enable Firestore, Authentication (Email/Phone), Storage.
4. Set up FCM for push notifications.
5. Add Firebase config files to `firebase/`.

---

## 2. Flutter Mobile App

```bash
cd mobile_app
flutter pub get
flutter run
```
- Uses Firebase Auth, Firestore, Storage, FCM.
- Contains: login screen, medicine catalog, cart, address, prescription upload, order tracking.

---

## 3. Python Cloud Function (OCR)

1. Set up [Google Cloud Functions with Python](https://cloud.google.com/functions/docs/tutorials/http)
2. Deploy the OCR function:

```bash
cd python_functions
gcloud functions deploy ocr_prescription \
  --runtime python310 \
  --trigger-http \
  --allow-unauthenticated
```

- Call this function from Flutter when user uploads prescription.

---

## 4. Admin Panel (Scope)

- Not included in this MVP. You can use Firebase Console or build a simple React app later.

---

## 5. Deployment

- Flutter: Build and publish to Play/App Store.
- Python Function: Deployed on Google Cloud.
- Firebase: Free tier suitable for up to 1000 users.

---

## 6. Extending

- Add payment gateway integration (Razorpay/Stripe).
- Build web admin panel with React.
- Monitor Firebase usage/quota.