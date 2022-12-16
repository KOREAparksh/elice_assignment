# elice_assignment

## Version
<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/flutter_doctor.png" width="50%"></div>

## 빌드 전 확인사항
1. .env-sample파일을 복사하여 .env파일 생성
2. .env파일 내 api주소 입력

## 일정 및 TodoList
1. 12/12(월)
- [x] 플러터 버전 설정
- [x] bloc, cubit 학습 및 선택
- [x] 요구사항 추가사항 정리 [link](https://github.com/KOREAparksh/elice_assignment/blob/main/documents/requirements.md)
- [x] ~~api 정리 및 문서화~~ (과제 docs 참고)
- [x] 사용할 라이브러리 정리 [link](https://github.com/KOREAparksh/elice_assignment/blob/main/documents/libraries.md)
- [x] 깃 메세지 컨벤션 정리
- [x] ~~아키텍처 정리 및 문서화~~ (작업 중 추가 확인사항 있어 연장)

2. 12/13(화)
- [x] 아키텍처 정리 및 문서화
- [x] 프로젝트 생성 및 설정
- [x] 공통코드(통신 등) 설계 (1h)
- [x] view 1 구현 (4h)
- [x] ~~view 2 설계 (1h ~ 2h)~~ (통신 및 api 분석 시간지체로 인한 연장)
- [x] ~~여러 Device 및 화면 적용되는지 확인~~ (통신 및 api 분석 시간지체로 인한 연장)

3. 12/14(수) ~ 12/15(목)
- [x] view 2 구현 (4h)
- [x] view 3 구현 (3h)
- [x] 요구사항 재확인 및 적용 확인
- [x] 여러 Device 및 화면 적용되는지 확인
- [x] 제출

## 화면 간략 구성도
<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/view1_diagram.png" width="50%"></div>

<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/view2_diagram.png" width="50%"></div>

## 폴더구조
- `config`: 설정변수와 constant값 저장
- `cubit`: cubit과 state 관리
- `dto`: dto 클래스 관리
- `repository`:  데이터를 가져오는 통신 저장 폴더
- `screen`: 화면관리 폴더
- `service`: custom_dio와 api 등 비즈니스로직 관리
- `util`: 간단한 함수 관리
- `widget`: 공통으로 쓰이거나 widget으로 분리된 파일 관리
</br>
- `assets`: 이미지파일 등 저장
- `assets/fonts`: 폰트파일저장

## bloc (cubit)
추천과목, 무료과목 두 cubit을 생성.
두 cubit의 추상클래스를 설정하여 하나의 위젯으로 많은 cubit을 보여줄 수 있게 구현.

<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/cubit_diagram.png" width="50%"></div>

## requirements

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
  - 환경변수
  `dotenv`

## Git 컨벤션
  - 프로젝트 설정 전
  main branch에 직접 commit

  - 프로젝트 설정 후 branch를 분리하여 코드작업 진행
    - dev
    - {주 개발 목적}-{브랜치이름}

    문서작업의 경우 dev/main에 바로
    </br>
  - 개발 완료 후
  main branch에 직접 commit

  ## Git message 컨벤션
  - "Tag: message"
  - body 내용 미첨부
  - Tag:
    - Feat    - 새로 개발
    - Fix     - 버그 수정
    - Refactor - 코드 재작성 or 수정
    - Add - asset files, 기타 코드 외 파일 추가
    - Build - 라이브러리(dependency) 추가 및 삭제
    - Docs - 문서작업

## 개발방식
- cubit 학습
- ui 생성 및 dummy데이터 연결
- cubit 생성 및 구현
- ui, cubit 연결

## 예시
### 홈화면
<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/홈화면.gif" width="50%"></div>

### 전체보기화면
<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/전체보기화면.gif" width="50%"></div>

### 홈화면 아이템 터치
<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/홈화면touchable.gif" width="50%"></div>

### 전체보기화면 아이템 터치
<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/전체보기화면touchable.gif" width="50%"></div>

### QR 및 웹뷰
<div>
<img src="https://raw.githubusercontent.com/KOREAparksh/elice_assignment/main/assets/QR및웹뷰.gif" width="50%"></div>



## 유의사항 / 고려사항
- **QR 스캐너 아이폰 내 테스트 불가 (실 기기 부재)**
- list가 0이거나 api 통신 result가 false인 등 여러 예외처리 구현
- 빠른 학습 및 사용을 위해 cubit을 선택했으나, 과제 후 bloc 학습 필요하다고 생각
- 여러 크기의 device 대응 확인

## 아쉬운점
- logo 등 png 파일의 해상도가 낮음
=> 앞으로 미리 메일로 부탁드리거나 확인할 것.
- cubit 학습 시간 지연
=> state없이 cubit을 사용할 줄 안다고 착각, 둘째날 시간 지체
- model-dto 구분 못함
=> 과제 내 데이터가 잘 바뀌지 않아 구분 못한 것으로 판단.
