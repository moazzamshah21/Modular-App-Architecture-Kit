/// Environment configuration (dev, staging, prod).
enum AppEnv {
  dev,
  staging,
  prod,
}

/// Current environment. Set via --dart-define=ENV=dev|staging|prod
class Env {
  Env._();

  static const _env = String.fromEnvironment(
    'ENV',
    defaultValue: 'dev',
  );

  static AppEnv get current {
    switch (_env) {
      case 'staging':
        return AppEnv.staging;
      case 'prod':
        return AppEnv.prod;
      default:
        return AppEnv.dev;
    }
  }

  static bool get isDev => current == AppEnv.dev;
  static bool get isStaging => current == AppEnv.staging;
  static bool get isProd => current == AppEnv.prod;
}
