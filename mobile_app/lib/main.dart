import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/medicine_details_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/address_screen.dart';
import 'screens/upload_prescription_screen.dart';
import 'screens/order_summary_screen.dart';
import 'screens/order_tracking_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/order_history_screen.dart';
import 'screens/admin_dashboard_screen.dart';

void main() {
  runApp(MedicineApp());
}

class MedicineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/medicine_details': (context) => MedicineDetailsScreen(),
        '/cart': (context) => CartScreen(),
        '/address': (context) => AddressScreen(),
        '/upload_prescription': (context) => UploadPrescriptionScreen(),
        '/order_summary': (context) => OrderSummaryScreen(),
        '/order_tracking': (context) => OrderTrackingScreen(),
        '/profile': (context) => ProfileScreen(),
        '/order_history': (context) => OrderHistoryScreen(),
        '/admin_dashboard': (context) => AdminDashboardScreen(),
      },
    );
  }
}