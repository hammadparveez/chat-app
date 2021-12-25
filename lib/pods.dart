import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_chat_app/controller/auth_controller.dart';
import 'package:random_chat_app/controller/chat_controller.dart';

final authController = ChangeNotifierProvider((ref) => AuthController());
final chatController = ChangeNotifierProvider((ref) => ChatController());
