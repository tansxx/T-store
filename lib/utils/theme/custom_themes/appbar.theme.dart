import 'package:flutter/material.dart';

/// AppBar(상단바) 테마를 모아둔 클래스
/// 밝은 모드(light)와 어두운 모드(dark)에서 각각 다르게 보이도록 설정할 수 있음
class TAppBarTheme {
  // private 생성자: 외부에서 이 클래스를 직접 인스턴스화하지 못하게 함
  TAppBarTheme._();

  /// 🌞 라이트 모드용 AppBar 테마
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0, // AppBar의 그림자 높이 (0이면 그림자 없음)
    centerTitle: false, // 제목을 가운데 정렬하지 않음 (왼쪽 정렬)
    scrolledUnderElevation: 0, // 스크롤 시에도 그림자 생기지 않도록 설정
    backgroundColor: Colors.transparent, // 배경 투명하게 (뒤 배경색이 보이도록)
    surfaceTintColor: Colors.transparent, // 머티리얼3의 표면색 효과 제거
    iconTheme: IconThemeData(
      color: Colors.black, // 아이콘 색상: 검정
      size: 24, // 아이콘 크기
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black, // 오른쪽 액션 아이콘 색상
      size: 24, // 액션 아이콘 크기
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0, // 제목 글자 크기
      fontWeight: FontWeight.w600, // 글자 두께 (semi-bold)
      color: Colors.black, // 제목 글자 색상: 검정
    ),
  );

  /// 🌙 다크 모드용 AppBar 테마
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0, // 그림자 제거
    centerTitle: false, // 제목 왼쪽 정렬
    scrolledUnderElevation: 0, // 스크롤 시 그림자 없음
    backgroundColor: Colors.transparent, // 배경 투명
    surfaceTintColor: Colors.transparent, // 표면 틴트 제거
    iconTheme: IconThemeData(
      color: Colors.black, // 왼쪽 아이콘 색상 (검정) ← 보통 흰색으로 바꾸기도 함
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white, // 오른쪽 액션 아이콘은 흰색
      size: 24,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0, // 제목 글자 크기
      fontWeight: FontWeight.w600, // 글자 두께
      color: Colors.white, // 제목 색상: 흰색
    ),
  );
}
