class EnvironmentConfig {
  static const API_URL = String.fromEnvironment('API_URL',
      defaultValue: 'https://api.ecordel.com.br/api/v1');
  static const DEFAULT_IMAGE = String.fromEnvironment('DEFAULT_IMAGE',
      defaultValue:
          'https://ecordel.com.br/wp-content/uploads/2020/07/ebook.png');
}
