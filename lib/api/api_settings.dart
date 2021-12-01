class ApiSettings {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";

  static const users = _apiUrl + 'users';
  static const categories = _apiUrl + 'categories';

  static const register = _apiUrl + 'students/auth/register';
  static const login = _apiUrl + '/auth/login';
  static const logout = _apiUrl + 'students/auth/logout';

  static const forgetPassword = _apiUrl + 'students/auth/forget-password';
}
