import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlesignin/widgets/sign_up_widget.dart';

import '../widgets/logged_in_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasData) {
            return LoggedInWidget();
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong!"),
            );
          }
          return SignUpWidget();
        },
      ),
    );
  }
}