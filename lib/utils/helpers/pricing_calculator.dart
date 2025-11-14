/// TPricingCalculator
/// 제품 가격, 세금, 배송비를 바탕으로 총 결제 금액을 계산하는 유틸리티 클래스
class TPricingCalculator {
  /// 총 결제 금액 계산
  /// [productPrice]: 상품 가격
  /// [location]: 지역 (세율·배송비 계산용)
  ///
  /// 세율과 배송비를 지역에 따라 계산해
  /// `총 가격 = 상품가격 + 세금 + 배송비` 로 반환
  static double calculateTotalPrice(double productPrice, String location) {
    // 지역별 세율 가져오기
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    // 지역별 배송비 가져오기
    double shippingCost = getShippingCost(location);

    // 총 가격 계산
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// 배송비 계산
  /// - 주어진 지역(location)에 따른 배송비를 계산 후 문자열로 반환 (소수점 2자리)
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// 세금 계산
  /// - 주어진 지역(location)의 세율을 바탕으로 세금 금액 계산 후 문자열 반환 (소수점 2자리)
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// 지역별 세율 조회
  /// - 실제 서비스에서는 DB나 외부 API를 통해 세율을 조회하도록 수정 가능
  /// - 현재는 테스트용으로 모든 지역에 10% 세율 적용
  static double getTaxRateForLocation(String location) {
    // TODO: 실제 환경에서는 location에 따라 세율 다르게 설정
    return 0.10; // 10%
  }

  /// 지역별 배송비 계산
  /// - 실제 서비스에서는 거리, 무게, 배송 방법 등에 따라 계산해야 함
  /// - 현재는 테스트용으로 모든 지역 동일한 $5.00 반환
  static double getShippingCost(String location) {
    // TODO: 실제 환경에서는 지역별 배송비 계산 로직 적용
    return 5.00;
  }
}
