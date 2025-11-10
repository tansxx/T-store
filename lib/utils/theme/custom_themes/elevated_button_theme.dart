import 'package:flutter/material.dart';

/// 🌈 ElevatedButton(입체 버튼)의 라이트/다크 테마를 정의하는 클래스
class TElevatedButtonTheme {
  // private constructor: 외부에서 이 클래스를 직접 만들지 못하게 함
  TElevatedButtonTheme._();

  /// 🌞 라이트 모드용 버튼 테마
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0, // 그림자 제거 (기본 버튼은 살짝 입체감이 있음)
      foregroundColor: Colors.white, // 버튼 안의 글자나 아이콘 색상
      backgroundColor: Colors.blue, // 버튼 배경색
      disabledForegroundColor: Colors.grey, // 비활성화 상태일 때 글자색
      disabledBackgroundColor: Colors.grey, // 비활성화 상태일 때 배경색
      side: const BorderSide(color: Colors.blue), // 버튼 테두리 색상
      padding: const EdgeInsets.symmetric(vertical: 18), // 버튼 내부 위아래 여백
      textStyle: const TextStyle(
        fontSize: 16, // 글자 크기
        color: Colors.white, // 글자 색상
        fontWeight: FontWeight.w600, // 글자 두께 (semi-bold)
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 모서리를 둥글게
      ),
    ),
  );

  /// 🌙 다크 모드용 버튼 테마
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0, // 그림자 없음
      foregroundColor: Colors.white, // 글자/아이콘 색상
      backgroundColor: Colors.blue, // 배경색 (라이트와 동일)
      disabledForegroundColor: Colors.grey, // 비활성화 글자색
      disabledBackgroundColor: Colors.grey, // 비활성화 배경색
      side: const BorderSide(color: Colors.blue), // 테두리 색상
      padding: const EdgeInsets.symmetric(vertical: 18), // 여백
      textStyle: const TextStyle(
        fontSize: 16, // 글자 크기
        color: Colors.white, // 글자 색상
        fontWeight: FontWeight.w600, // 글자 두께
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 둥근 버튼 모양
      ),
    ),
  );
}
