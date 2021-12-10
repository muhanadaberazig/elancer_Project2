class ApiSettings {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";

  static const users = _apiUrl + 'users';
  static const categories = _apiUrl + 'categories';

  static const home=_apiUrl+'home';

  static const register = _apiUrl + 'auth/register';
  static const activatePhone = _apiUrl + 'auth/activate';
  static const login = _apiUrl + 'auth/login';
  static const logout = _apiUrl + 'students/auth/logout';
  static const storeApiKey ="0f035133-b3f9-47a4-8889-ee8afa38d1b3";
  static const cities= _apiUrl +'cities';
  static const forgetPassword = _apiUrl + 'students/auth/forget-password';
}
