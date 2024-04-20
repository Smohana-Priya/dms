class MFRIFlashSingleton {

  String? bearerToken;
  String? sessionToken;

  static final MFRIFlashSingleton _singleton =
  MFRIFlashSingleton._internal();

  MFRIFlashSingleton._internal();

  static MFRIFlashSingleton get instance => _singleton;
}
