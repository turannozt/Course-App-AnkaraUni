import 'package:ankarauni/povider/user_provider.dart';
import 'package:ankarauni/screens/login/login_screen.dart';
import 'package:ankarauni/screens/login/verify_email_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RenderErrorBox.backgroundColor = Colors.transparent;
  ErrorWidget.builder = (FlutterErrorDetails details) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      );

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA9WrzOgwzRTPXVjUhlJw8S_KZH5qKq1l0",
        authDomain: "ankara-uni-d2a4e.firebaseapp.com",
        projectId: "ankara-uni-d2a4e",
        storageBucket: "ankara-uni-d2a4e.appspot.com",
        messagingSenderId: "918783933515",
        appId: "1:918783933515:web:bbf2a890a039ce8cc0a1ce",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

ThemeData _lightTheme = ThemeData();

ThemeData _darkTheme = ThemeData();

bool _light = true;

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ankara University',
          darkTheme: _darkTheme,
          theme: _light ? _lightTheme : _darkTheme,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Checking if the snapshot has any data or not
                if (snapshot.hasData) {
                  // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                  return const VerifyEmailPage();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              // means connection to future hasnt been made yet
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return const LoginScreen();
            },
          ),
        ),
      );
}
