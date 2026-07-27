---
description: 로컬에서 렌더해 브라우저로 결과를 확인한다 (푸시 안 함)
argument-hint: [포스트 폴더명 — 생략하면 전체]
allowed-tools: PowerShell, Read, Glob, Grep, mcp__Claude_Browser__preview_start, mcp__Claude_Browser__navigate, mcp__Claude_Browser__get_page_text, mcp__Claude_Browser__read_page, mcp__Claude_Browser__read_console_messages
---

로컬 렌더 결과를 확인한다. 대상: $ARGUMENTS (비어 있으면 사이트 전체)

1. 렌더한다.
   - 대상이 지정됐으면: `quarto render "posts/<폴더명>/index.qmd"`
   - 비어 있으면: `quarto render`
   - 실패하면 에러 메시지 원문을 그대로 보여주고 원인을 짚는다. 여기서 멈춘다.

2. 렌더된 HTML을 브라우저로 띄운다. `preview_start` 에 `docs/` 아래 해당 파일의 `file:///` URL을 넘긴다.
   - 포스트 지정 시: `file:///C:/Users/khs98/Documents/jesuspen-blog.github.io/docs/posts/<폴더명>/index.html`
   - 전체: `file:///C:/Users/khs98/Documents/jesuspen-blog.github.io/docs/index.html`

3. 페이지를 읽어 다음을 점검하고 문제만 보고한다:
   - 제목·날짜·카테고리가 의도대로 렌더됐는지
   - 이미지가 깨지지 않았는지 (콘솔 404 확인)
   - 한글이 깨지지 않았는지
   - 링크가 살아 있는지 (내부 링크 위주)

4. 커밋·푸시는 하지 않는다. 문제가 없으면 `/publish` 로 발행하면 된다고 안내한다.
