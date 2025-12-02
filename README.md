# 🌟 Takehome App — Flutter + Angular Hybrid System

A hybrid assessment project built with **Flutter** for the mobile experience and **Angular** for the embedded dashboard. The Angular dashboard runs inside the Flutter app using a WebView.

<p align="left">
  <img src="https://img.shields.io/badge/Flutter-3.0-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Angular-17-red?logo=angular" />
  <img src="https://img.shields.io/badge/Dart-3.0-blue?logo=dart" />
  <img src="https://img.shields.io/badge/TypeScript-5.0-blue?logo=typescript" />
  <img src="https://img.shields.io/badge/Platform-Android-green" />
</p>

---

## 📦 Project Overview

This repo includes two connected systems:

### **1. Flutter App (Main Application)**

* Chat list
* Chat detail view
* Bottom navigation
* Dashboard tab that loads Angular in a WebView

### **2. Angular Dashboard (Web Mini-App)**

* Tailwind UI
* Simple tools dashboard
* Served locally and rendered inside Flutter

Flutter → WebView → Angular Dashboard

---

## 📁 Folder Structure

```
takehome_app/              ← Flutter project (main)
dashboard/                 ← Angular dashboard project
```

---

# 🚀 Getting Started

## 1️⃣ Install Flutter Dependencies

From the Flutter project root:

```
flutter pub get
```

---

## 2️⃣ Install Angular Dependencies

Go to the Angular folder:

```
cd dashboard
npm install
```

---

# 🧩 Running the Angular Dashboard

The Android emulator **cannot access `localhost`** directly.

### Angular must be started with:

* Host: `0.0.0.0`
* Disable host check
* Port: `4200` (or another if needed)

Run:

```
ng serve --host 0.0.0.0 --disable-host-check --port 4200
```

You should see:

```
Local:   http://localhost:4200/
Network: http://192.168.x.x:4200/
```

Flutter will connect using:

```
http://10.0.2.2:4200
```

This is how the Android emulator maps to your computer.

---

# 📱 Running the Flutter App

From the Flutter root directory:

```
flutter run
```

Open the **Dashboard** tab — it will load the Angular dashboard through the WebView.

---

# 🌐 WebView Configuration (Flutter)

Flutter loads Angular via:

```dart
Uri.parse("http://10.0.2.2:4200")
```

This works only when Angular is running with `--host 0.0.0.0`.

---

# 🛠 Troubleshooting

### ❌ WebView shows ERR_CONNECTION_REFUSED

Angular is not exposed externally.

Run:

```
ng serve --host 0.0.0.0 --disable-host-check
```

---

### ❌ ERR_CLEARTEXT_NOT_PERMITTED

Enable clear text in `AndroidManifest.xml`:

```xml
android:usesCleartextTraffic="true"
```

---

### ❌ Timeout or blank screen

Firewall may block Angular dev server.

Try using another port:

```
ng serve --host 0.0.0.0 --port 8080
```

Then update Flutter:

```dart
Uri.parse("http://10.0.2.2:8080")
```

---

# 📜 License

This project is for assessment and demonstration purposes only.

---
