import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modularapparchitecture/features/auth/data/datasources/auth_datasource.dart';
import 'package:modularapparchitecture/features/auth/data/repositories/auth_repository_impl.dart';

class MockAuthDatasource extends Mock implements AuthDatasource {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockAuthDatasource();
    repository = AuthRepositoryImpl(mockDatasource);
  });

  group('AuthRepositoryImpl', () {
    test('login delegates to datasource', () async {
      when(() => mockDatasource.login(any(), any())).thenAnswer((_) async {});

      await repository.login('a@b.com', 'pass');

      verify(() => mockDatasource.login('a@b.com', 'pass')).called(1);
    });

    test('signUp delegates to datasource', () async {
      when(() => mockDatasource.signUp(any(), any())).thenAnswer((_) async {});

      await repository.signUp('a@b.com', 'pass');

      verify(() => mockDatasource.signUp('a@b.com', 'pass')).called(1);
    });

    test('signOut delegates to datasource', () async {
      when(() => mockDatasource.signOut()).thenAnswer((_) async {});

      await repository.signOut();

      verify(() => mockDatasource.signOut()).called(1);
    });

    test('sendPasswordReset delegates to datasource', () async {
      when(() => mockDatasource.sendPasswordReset(any()))
          .thenAnswer((_) async {});

      await repository.sendPasswordReset('a@b.com');

      verify(() => mockDatasource.sendPasswordReset('a@b.com')).called(1);
    });
  });
}
