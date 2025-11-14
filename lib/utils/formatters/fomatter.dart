import 'package:intl/intl.dart'; // 날짜, 숫자 포맷팅용 패키지

/// TFormatter
/// - 날짜, 금액, 전화번호 등의 포맷을 일관되게 변환해주는 유틸 클래스
class TFormatter {
  /// 날짜 포맷 변환
  /// - 입력받은 DateTime을 'dd-MMM-yyyy' (예: 14-Nov-2025) 형태로 변환
  /// - null이면 현재 날짜로 대체
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  /// 금액 포맷 변환
  /// - en_US 로케일 기준으로 달러 통화 표시 (예: $1,234.56)
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /// 국내 전화번호 포맷 변환
  /// - 10자리: (123) 456 7890
  /// - 11자리: (0101) 234 5678
  /// - 그 외: 그대로 반환
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) '
          '${phoneNumber.substring(3, 6)} '
          '${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) '
          '${phoneNumber.substring(4, 7)} '
          '${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  /// 국제 전화번호 포맷 변환
  /// - 입력 문자열에서 숫자만 추출 후, 앞 2자리를 국가 코드로 인식
  /// - 국가 코드가 +1이면 첫 그룹을 3자리, 나머지는 2자리 단위로 구분
  /// - 예시: '821012345678' → (+82) 10 12 34 56 78
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // 숫자만 추출 (문자, 공백, 하이픈 등 제거)
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // 최소 3자리 이상(국가코드 + 번호)여야 함
    if (digitsOnly.length < 3) return phoneNumber;

    // 앞 2자리 국가 코드 추출
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      // 국가 코드가 +1이면 첫 그룹을 3자리, 그 외는 2자리씩
      int groupLength = (i == 0 && countryCode == '+1') ? 3 : 2;
      int end = (i + groupLength > digitsOnly.length)
          ? digitsOnly.length
          : i + groupLength;

      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}
