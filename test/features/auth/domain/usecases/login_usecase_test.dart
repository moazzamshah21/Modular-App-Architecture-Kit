import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modularapparchitecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:modularapparchitecture/features/auth/domain/usecases/login_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });

  group('LoginUseCase', () {
    const email = 'test@example.com';
    const password = 'password123';

    test('calls repository.login with email and password', () async {
      when(() => mockRepository.login(any(), any()))
          .thenAnswer((_) async => Future.value());

      await useCase(email, password);

      verify(() => mockRepository.login(email, password)).called(1);
    });

    test('propagates repository errors', () async {
      when(() => mockRepository.login(any(), any()))
          .thenThrow(Exception('Invalid credentials'));

      expect(() => useCase(email, password), throwsA(isA<Exception>()));
    });
  });
}
