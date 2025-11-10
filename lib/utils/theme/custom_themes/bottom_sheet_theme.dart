import 'package:flutter/material.dart';

/// 🌈 BottomSheet(화면 아래에서 올라오는 창)의 테마를 관리하는 클래스
class TBottomSheetTheme {
  // private constructor: 외부에서 new로 인스턴스 생성 못하게 함
  TBottomSheetTheme._();

  /// 🌞 라이트 모드용 BottomSheet 테마
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true, // 위쪽에 작게 손잡이(=드래그 표시줄) 보이게 하기
    backgroundColor: Colors.white, // 일반 BottomSheet의 배경색
    modalBackgroundColor: Colors.white, // 모달 형태일 때 배경색 (반투명 오버레이 포함)
    constraints: const BoxConstraints(
      minWidth: double.infinity, // 너비를 화면 전체로 설정
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // 모서리를 둥글게 (16픽셀)
    ),
  );

  /// 🌙 다크 모드용 BottomSheet 테마
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true, // 드래그 핸들 표시 (위에 회색 바)
    backgroundColor: Colors.black, // 배경색을 검정으로 변경
    modalBackgroundColor: Colors.black, // 모달 형태일 때도 검정색 배경
    constraints: const BoxConstraints(
      minWidth: double.infinity, // 화면 가로 전체 차지
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // 동일하게 모서리 둥글게
    ),
  );
}
