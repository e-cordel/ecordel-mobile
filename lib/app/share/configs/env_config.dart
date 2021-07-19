class EnvironmentConfig {
  static const API_URL = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://ecordel-restapi.herokuapp.com'
  );
}