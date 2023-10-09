import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
final AuthRepository authRepository;

RegisterUseCase(this.authRepository);

Future<User?> execute(String email, String password) {
return authRepository.register(email, password);
}
}

