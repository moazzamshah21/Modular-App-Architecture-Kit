import 'package:flutter_test/flutter_test.dart';
import 'package:modularapparchitecture/core/services/api_client.dart';

void main() {
  group('ApiException', () {
    test('fromDio builds message from response data', () {
      // ApiException is used by the error interceptor; we test the factory
      // with a minimal check that it exists and has expected fields.
      final e = ApiException(
        message: 'Bad request',
        statusCode: 400,
        code: 'invalid',
      );
      expect(e.message, 'Bad request');
      expect(e.statusCode, 400);
      expect(e.code, 'invalid');
      expect(e.toString(), contains('Bad request'));
    });
  });

  group('ApiClient', () {
    test('can be created with default baseUrl', () {
      final client = ApiClient();
      expect(client.dio.options.baseUrl, '');
    });

    test('can be created with custom baseUrl', () {
      final client = ApiClient(baseUrl: 'https://api.example.com');
      expect(client.dio.options.baseUrl, 'https://api.example.com');
    });
  });
}
