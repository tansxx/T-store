import 'package:get_storage/get_storage.dart';

/// TLocalStorage
/// - GetStorage 기반의 로컬 스토리지 관리 클래스
/// - 앱 내 간단한 설정값, 토큰, 사용자 정보 등을 로컬에 저장/조회/삭제 가능
///
/// 주요 특징:
/// - Singleton 패턴으로 인스턴스 1개만 유지 (전역에서 쉽게 접근)
/// - 비동기 방식의 저장 및 삭제 지원
/// - 타입 제너릭(Generic)을 사용하여 다양한 자료형 저장 가능
class TLocalStorage {
  /// 싱글톤 인스턴스 생성
  static final TLocalStorage _instance = TLocalStorage._internal();

  /// factory 생성자: 항상 동일한 인스턴스 반환
  factory TLocalStorage() {
    return _instance;
  }

  /// 내부용 private 생성자 (외부에서 직접 호출 불가)
  TLocalStorage._internal();

  /// GetStorage 인스턴스 (내부 데이터 저장소)
  final _storage = GetStorage();

  /// 데이터 저장
  /// - [key]: 저장할 키 이름
  /// - [value]: 저장할 값 (문자열, 숫자, Map, bool 등 가능)
  ///
  /// 예: `saveData('token', 'abc123');`
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  /// 데이터 읽기
  /// - [key] 에 해당하는 값을 읽어서 반환
  /// - 값이 없으면 `null` 반환
  ///
  /// 예: `final token = readData<String>('token');`
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  /// 특정 데이터 삭제
  /// - [key] 에 해당하는 데이터만 제거
  ///
  /// 예: `removeData('token');`
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  /// 모든 데이터 초기화 (스토리지 전체 삭제)
  /// - 주의: 저장된 모든 로컬 데이터가 삭제됨!
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
