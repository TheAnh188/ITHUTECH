class ApiPath {
  static const String login = '/auth/login';
  static const String getNickname = '/user/get-nickname';
  static const String getInfoUser = '/user/get-user-info';
  static const String refreshToken = '/user/secure-resource';
  static const String checkExpiredToken = '/auth/handle-expired-token';
  static const String changePassword = '/user/change-password';
  static const String changeEmail = '/user/change-email';
  static const String changePhoneNumber = '/user/change-phone-number';
  static const String verifyEmail = '/user/verify-email';
  static const String resetPassword = '/auth/reset-password';
  static const String getAllGroups = '/group/get-all-groups';
  static const String getAllContests = '/contest/get-all-contests';
  static const String getAssignmentSeries =
      '/group/get-assignment-series-in-group';
  static const String getProblems = '/group/get-problems';
  static const String getMembers = '/group/get-members';
  static const String getGroupUser = '/group/get-user-info-in-group';
  static const String getAnnouncements = '/group/get-announcements';
  static const String getStandings = '/group/standing';
  static const String activateUserId = '/device/activate-user-id';
  static const String checkDevice = '/device/check-device';
  static const String getCheckIn = '/check-in/get-check-in';
  static const String checkInByQr = '/check-in/check-in-by-qr';
  static const String getCheckInResults = '/check-in/get-check-in-results';
  static const String getNews = '/site/get-all-news?page=1&pageSize=0';
}
