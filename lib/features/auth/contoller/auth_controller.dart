import 'package:chat_app/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  const AuthController({
    required this.authRepository,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void signInWithEmailAndPassword(
      BuildContext context, String email, String password) {
    authRepository.signInWithCredential(context, email, password);
  }
}
