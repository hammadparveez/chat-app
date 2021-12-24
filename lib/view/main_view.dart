import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_chat_app/controller/auth_controller.dart';
import 'package:random_chat_app/main.dart';
import 'package:random_chat_app/pods.dart';
import 'package:random_chat_app/view/chat_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(authController).isAuthenticated);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authController);
    if (controller.status == AuthStatus.success) return const ChatView();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ref.read(authController).authenticate();
              },
              child: controller.status != null &&
                      controller.status == AuthStatus.loading
                  ? const CircularProgressIndicator()
                  : const Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
