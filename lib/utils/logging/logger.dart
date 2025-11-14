import 'package:logger/logger.dart';

/// TLoggerHelper
/// 앱 전반에서 사용 가능한 로깅(Logging) 헬퍼 클래스.
///
/// - `logger` 패키지를 사용해 콘솔에 보기 좋은 포맷으로 로그 출력
/// - 개발 중 디버그/정보/경고/에러 레벨을 나누어 관리 가능
class TLoggerHelper {
  /// Logger 인스턴스 생성 (PrettyPrinter로 예쁘게 출력)
  static final Logger _logger = Logger(
    printer: PrettyPrinter(), // 로그 출력 포맷 지정
    level: Level.debug, // 출력할 최소 로그 레벨 설정 (debug 이상만 표시)
  );

  /// [Debug] 단계 로그 출력
  /// - 개발 중 상세 디버깅용 메시지
  static void debug(String message) {
    _logger.d(message);
  }

  /// ℹ[Info] 단계 로그 출력
  /// - 일반적인 정보 메시지 (예: API 호출 성공, 상태 변경 등)
  static void info(String message) {
    _logger.i(message);
  }

  /// [Warning] 단계 로그 출력
  /// - 잠재적 문제 상황이나 예외가 발생할 수 있는 조건
  static void warning(String message) {
    _logger.w(message);
  }

  /// [Error] 단계 로그 출력
  /// - 예외, 오류 발생 시 호출
  ///
  /// [error] : 에러 객체 (optional)
  /// [stackTrace] : 오류 발생 위치 추적용 스택 정보
  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(
      message,
      error: error,
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }
}
