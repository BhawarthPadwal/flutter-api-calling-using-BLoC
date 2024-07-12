class ApiEnv {

  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static String getAppEnvironment() {
    return ApiEnv._baseUrl;
  }
}