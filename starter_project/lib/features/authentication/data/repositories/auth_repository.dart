// lib/data/auth/auth_repository.dart

import 'package:your_app/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<void> logout();
}
