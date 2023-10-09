import '../../domain/entities/user.dart';

class UserModel {
  final String id;
  final String email;

  UserModel({
    required this.id,
    required this.email,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.id,
      email: user.email ?? '',
    );
  }
}
