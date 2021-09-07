class Api {
  static const String _baseUrl = 'http://web-test.winlife.id/';
  static const String API_KEY = 'EBD19D22637AFD0BC40DE7B0A8F44E09';

  static const String IMAGE_KATEGORI_URL = _baseUrl + "uploads/v13nr_kategori/";

  static const String _API = _baseUrl + 'api/';

//auth
  static const String LOGIN = _API + 'user/login';
  static const String REGISTER = _API + 'register_konselor/add';

  static const String DURATION = _API + 'duration_service/all';
  static const String KATEGORI = _API + 'v13nr_kategori/all';
  static const String KONSELOR = _API + 'register_konselor/all';
}
