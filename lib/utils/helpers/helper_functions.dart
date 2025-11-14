import 'dart:math'; // 난수 생성용 (추천코드 생성 등)
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX에서 context 접근 등 사용
import 'package:intl/intl.dart'; // 날짜/시간 포맷용 패키지

/// 앱 공용 헬퍼 함수 모음
/// - UI/UX 보조, 포맷팅, 변환, SnackBar 등 자주 쓰는 기능 집합
class THelperFunctions {
  /// 문자열 색상명에 맞는 Flutter Color 반환
  /// - 특정 문자열 값이 들어오면 대응되는 색상(Color) 객체 반환
  /// - 제품별 컬러 속성(Attribute) 표시용
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match
    /// the attribute colors and show specific
    /// “여기에 제품별 색상 매핑을 정의하면, UI에서 해당 속성 색상으로 표시됩니다.”

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null; // 정의되지 않은 색상은 null 반환
    }
  }

  /// 상단 안전 영역(노치 등) 높이 반환
  static double getTopSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  /// 하단 제스처바/안전영역 높이 반환
  static double getBottomSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.bottom;
  }

  /// Snackbar 간단 호출
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// AlertDialog 간단 호출
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// 지정한 화면으로 네비게이션 이동
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  /// 텍스트 길이 제한 후 잘라내기
  /// - maxLength보다 길면 '...' 붙임
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  /// 다크모드 여부 반환
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// 세로 방향 여부 확인
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// 화면 전체 사이즈 반환 (width + height)
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// 화면 높이 반환
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// 화면 너비 반환
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// 날짜를 지정된 포맷 문자열로 변환
  /// 기본값: 'dd MMM yyyy' (예: 14 Nov 2025)
  static String getFormattedDate(
    DateTime date, {
    String format = 'dd MMM yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  /// 중복 요소 제거 후 List 반환
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// 위젯 리스트를 Row 단위로 나누어 감싸기
  /// - [rowSize] 만큼씩 끊어서 Row로 배치
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  /// 전화번호 중간 부분 마스킹 처리
  /// 예: 01012345678 → 01 ***** 678
  static String maskPhoneNumber(String number) {
    if (number.length > 6) {
      final visibleStart = number.substring(0, 2);
      final visibleEnd = number.substring(number.length - 3);
      final maskedPart =
          '*' * (number.length - visibleStart.length - visibleEnd.length);
      return '$visibleStart $maskedPart $visibleEnd';
    }
    return number;
  }

  /// 추천 코드(Referral Code) 생성
  /// - 이름 + 무작위 숫자 조합 (예: JOHN123)
  static String generateReferralCode(String firstName) {
    final random = Random();
    final randomNumber = random.nextInt(1000);
    return firstName.toUpperCase() + randomNumber.toString();
  }

  /// 동적 값을 DateTime으로 변환
  /// - Firestore Timestamp, DateTime, String, int 등 지원
  /// - 변환 실패 시 null 반환
  static DateTime? convertToDateTime<T>(dynamic value) {
    if (value == null) return null;

    // 이미 DateTime이면 그대로 반환
    if (value is DateTime) return value;

    // Firestore Timestamp 처리
    if (value.runtimeType.toString() == 'Timestamp' || (value is T)) {
      try {
        return value.toDate();
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  /// 거리 포맷 변환 (미터 → km)
  /// - 1000m 미만: "500 m"
  /// - 이상: "1.2 km"
  static String formatDistance(int distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '$distanceInMeters m';
    } else {
      double km = distanceInMeters / 1000;
      return '${km.toStringAsFixed(1)} km';
    }
  }

  /// 생년월일 문자열(예: '14-Nov-2000')을 받아 나이 계산
  static int calculateAge(String formattedDate) {
    final dateOfBirth = DateFormat('dd-MMM-yyyy').parse(formattedDate);
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;

    // 아직 생일이 안 지난 경우 1살 빼기
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }
}
