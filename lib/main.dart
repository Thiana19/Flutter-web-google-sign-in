import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:googlesignin/pages/homepage.dart';
import 'package:googlesignin/provider/google_sign_in.dart';
import 'package:googlesignin/widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAYgfUz-5Q00muaJnbIQ11PoEi4OOxHHBA", // Your apiKey
      appId: "1:445550148638:web:90510e61b91d6610cfc20f", // Your appId
      messagingSenderId: "445550148638", // Your messagingSenderId
      projectId: "signin-7ee99", // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Google Sign in",
      theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
      home: HomePage(),
    ),
    );
}

