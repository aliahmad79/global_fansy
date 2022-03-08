
class ApiUrl{
  static String base_Url = 'https://alpha3.mytechnology.ae/iyacht/en/api/';
  static String web_url = 'https://alpha3.mytechnology.ae/iyacht/';

  ///APIs

  ///Setting
  static String settings = 'settings';
  static String cities = 'cities';
  static String categories = 'categories-list';
  static String Subcategories = 'subcategories-list/?id=';

  ///Image Upload
  static String imageUpload = 'upload-image';

  ///Auth
  static String login = 'user/login';
  static String register = 'user/register';
  static String emailVerify = 'user/verify-email';
  static String getEmailVerificationCode = 'user/resend-verification-code';
  static String logout = 'fcm/remove-token';
  static String getUser = 'edit-profile';
  static String forgotPassword = 'user/forgot-password';
  static String resetPassword = 'user/reset-password';
  ///SocialLogin
  static String socialLogin = 'user/login';
  static String updateSupplierProfile = 'update-profile';
  ///packages
  static String subscriptionPackage = 'subscription-packages';
  static String subscriptionPackageBuy = 'subscription-payment-response';

  ///Watercraft
  static String get_watercrafts = 'watercrafts';
  static String add_watercraft = 'watercraft/store';
  static String waterCraft_listing = 'watercrafts/listing';
  static String waterCraft_detail = 'watercraft/details/';
  static String edit_watercraft = 'watercraft/edit/';
  ///Suppliers
  static String suppliers = 'suppliers';
  static String suppliers_detail = 'supplier-info/';

  ///Gallery
  static String gallery = 'gallery';

  /// infopages
  static String pages = 'pages';
  static String articles = 'articles';
  static String faqs = 'faqs';
}