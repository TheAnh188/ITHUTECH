class AppEnvironment {
  AppEnvironment._(
      {required this.apiBaseUrl,
      required this.imageUrl,
      required this.oneSignalAppId,
      required this.defaultBranchApiKey,
      this.isDev = true});

  final String apiBaseUrl;
  final String imageUrl;
  final String defaultBranchApiKey;
  final String oneSignalAppId;
  final bool isDev;

  factory AppEnvironment.local() {
    return AppEnvironment._(
      apiBaseUrl: "http://localhost:2000/api",
      imageUrl: "",
      defaultBranchApiKey: "",
      oneSignalAppId: "",
    );
  }

  factory AppEnvironment.dev() {
    return AppEnvironment._(
      apiBaseUrl: "http://142.171.175.20/api",
      imageUrl: "",
      defaultBranchApiKey: "",
      oneSignalAppId: "",
    );
  }

  factory AppEnvironment.live() {
    return AppEnvironment._(
      apiBaseUrl: "https://itcoder.hutech.edu.vn/api",
      imageUrl: "",
      defaultBranchApiKey: "",
      oneSignalAppId: "",
      isDev: false,
    );
  }
}
