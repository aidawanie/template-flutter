import 'package:firebase_core/firebase_core.dart';
import 'package:mylight/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylight/wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthService(FirebaseAuth.instance).user,
        initialData: null,
        child: const MaterialApp(
          title: "Template",
          home: Wrapper(),
        ));
  }
}
