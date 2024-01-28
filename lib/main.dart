import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBUEzjmHanTLhhuDyusFvgWGWqPtEgAMpc',
        appId: '1:1021181426587:android:7879ef98bfa3ab09b0ff3e',
        messagingSenderId: '1021181426587',
        projectId: 'app2-3394d',
        databaseURL: 'https://app2-3394d.firebaseio.com',
        authDomain: 'app2-3394d.firebaseapp.com',
        measurementId: 'G-XXXXXXXXXX', // Puedes dejar esto si no estás usando Analytics
      ),
    );
  } catch (e) {
    print('Error al inicializar Firebase: $e');
  }
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(), // Cambia MyHomePage por LoginPage
    );
  }
}
