import 'dart:convert'; // JSON 인코딩/디코딩용
import 'package:http/http.dart' as http; // HTTP 요청용 패키지

/// THttpHelper
/// HTTP 요청(GET, POST, PUT, DELETE)을 간단하게 처리하기 위한 유틸리티 클래스.
/// - 기본 base URL을 설정해두고, endpoint만 전달하면 자동으로 호출 가능.
/// - JSON 인코딩/디코딩을 자동 처리함.
class THttpHelper {
  /// 서버의 기본 URL
  /// 예: 'https://api.example.com'
  /// 실제 사용 시, 자신의 API 주소로 변경해야 함.
  static const String _baseUrl = 'https://your-api-base-url.com';

  /// GET 요청
  /// - 데이터를 조회할 때 사용.
  /// - [endpoint]는 base URL 뒤에 붙는 경로 (예: 'users', 'products/1')
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  /// POST 요청
  /// - 새 데이터를 서버에 등록할 때 사용.
  /// - [data]는 Map 또는 객체 형태이며 JSON으로 인코딩되어 전송됨.
  static Future<Map<String, dynamic>> post(
    String endpoint,
    dynamic data,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'}, // JSON 전송 헤더
      body: json.encode(data), // Map → JSON 문자열 변환
    );
    return _handleResponse(response);
  }

  /// PUT 요청
  /// - 기존 데이터를 수정할 때 사용.
  /// - [data]는 JSON 형태로 전송됨.
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  /// DELETE 요청
  /// - 서버의 특정 데이터를 삭제할 때 사용.
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  /// 응답 처리 메서드
  /// - 모든 요청의 공통 응답 처리 담당.
  /// - 200(성공)일 경우 JSON 디코딩 후 반환.
  /// - 실패 시 예외(Exception) 발생.
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // 서버 응답을 JSON → Map<String, dynamic> 형태로 변환
      return json.decode(response.body);
    } else {
      // 에러 상태코드 처리 (예: 400, 404, 500 등)
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
