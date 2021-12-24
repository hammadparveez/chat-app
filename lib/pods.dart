import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_chat_app/controller/auth_controller.dart';

final authController = ChangeNotifierProvider((ref) => AuthController());
