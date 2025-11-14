import 'dart:io'; // 플랫폼(Android/iOS) 구분 및 네트워크 관련 기능 사용
import 'package:flutter/material.dart'; // Flutter UI 구성 관련 패키지
import 'package:flutter/services.dart'; // 시스템 UI, 진동 등 제어용 패키지
import 'package:flutter/foundation.dart'; // 플랫폼 판별 등 기초 유틸리티 제공
import 'package:get/get.dart'; // GetX 패키지 - context, 상태관리, 라우팅 등
import 'package:url_launcher/url_launcher.dart'; // 외부 브라우저나 앱 실행용 패키지

/// 기기 관련 유틸리티 모음 클래스
/// - 화면 크기, 상태바, 진동, 방향, 키보드 상태 등 제어 기능 제공
class TDeviceUtils {
  /// 키보드를 숨김
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// 상태바 색상 변경
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// 현재 화면이 가로(landscape)인지 확인
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// 현재 화면이 세로(portrait)인지 확인
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// 전체 화면 모드 설정 (상태바/내비게이션 바 숨기기)
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  /// 전체 화면 높이 반환
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// 전체 화면 너비 반환
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// 디바이스 픽셀 비율 반환 (고해상도 여부 판단 등)
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// 상태바 높이 반환
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  /// 하단 네비게이션 바의 기본 높이 반환
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// AppBar(상단바)의 기본 높이 반환
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// 현재 키보드 높이 반환
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// 키보드가 열려 있는지 여부 반환
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// 실제 기기(에뮬레이터 X)인지 확인
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// 진동 발생 (지정한 시간 뒤 한 번 더 진동)
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// 화면 방향(세로/가로) 고정 설정
  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// 상태바 숨기기
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// 상태바 다시 보이기
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// 인터넷 연결 여부 확인
  /// - DNS lookup을 통해 네트워크 연결 테스트
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// 현재 플랫폼이 iOS인지 확인
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// 현재 플랫폼이 Android인지 확인
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// 외부 웹사이트 URL 실행 (기본 브라우저에서 열기)
  static void launchWebsiteUrl(String address) async {
    final Uri url = Uri.parse(address);
    if (!await launchUrl(url)) {
      if (kDebugMode) print('Could not launch $url');
    }
  }

  // 필요 시 추가적인 기기 관련 메서드 확장 가능
}
