import 'package:flutter/material.dart';

/// 🌈 체크박스의 라이트/다크 테마를 정의하는 클래스
class TCheckBoxTheme {
  // private 생성자: 외부에서 이 클래스를 직접 만들지 못하게 함
  TCheckBoxTheme._();

  /// ✅ 라이트 모드용 체크박스 테마
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), // 체크박스 모서리 둥글게
    ),

    // ✔ 표시 색상
    checkColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white; // 선택된 상태일 때 ✔ 색상 흰색
      } else {
        return Colors.black; // 선택되지 않은 상태일 때 ✔ 색상 검정
      }
    }),

    // 체크박스 배경색 (채워지는 부분)
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue; // 선택된 상태일 때 파란 배경
      } else {
        return Colors.transparent; // 비선택 상태일 때 투명
      }
    }),
  );

  /// ✅ 다크 모드용 체크박스 테마
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), // 체크박스 모서리 둥글게
    ),

    // ✔ 표시 색상
    checkColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white; // 선택된 상태일 때 ✔ 색상 흰색
      } else {
        return Colors.black; // 선택되지 않은 상태일 때 ✔ 색상 검정
      }
    }),

    // 체크박스 배경색 (채워지는 부분)
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue; // 선택된 상태일 때 파란 배경
      } else {
        return Colors.transparent; // 비선택 상태일 때 투명
      }
    }),
  );
}
