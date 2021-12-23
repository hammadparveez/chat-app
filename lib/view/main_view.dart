import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chat-view');
                },
                child: Text('Sign In with Google')),
            TextButton(onPressed: () {}, child: Text('Sign In with Email')),
          ],
        ),
      ),
    );
  }
}
