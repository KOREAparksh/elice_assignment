
## Git 컨벤션
- 프로젝트 설정 전
main branch에 직접 commit

- 프로젝트 설정 후
branch를 분리하여 코드작업 진행
  - dev
  - ec-이슈번호
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
