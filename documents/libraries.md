
- 상태관리
  - `cubit`
    전체 bloc 패턴을 학습하고 이를 과제에 적용하기엔 많은 시간이 소요될 것으로 예상.
    과제사이즈 / 마감일 고려하였을 때 Cubit과 `flutter_bloc`패키지를 사용하기로 선택.

- QR 라이브러리
  - `mobile_scanner`
  기본 zxing 관련 라이브러리들이 유지관리되지 않아, 다른 기반의 라이브러리 사용.
  - https://pub.dev/packages/mobile_scanner
  - 개발 중 에로사항이 있을 경우 기존 qr_code_scanner로 변경 에정.

- 통신
  - `retrofit`
  과제 내 api는 한개이지만 확장성 / 유지보수성을 고려하여 retrofit 선택.

- 기타
  - 리스트 무한스크롤 및 새로고침
  `pull_to_refresh`
  - 웹뷰
  `webview_flutter`
