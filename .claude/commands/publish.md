---
description: 렌더 → 커밋 → (승인 후) 푸시. deploy.sh와 동일한 발행 절차
allowed-tools: PowerShell, Read, Glob, Grep
---

블로그를 발행한다. deploy.sh와 같은 절차를 따르되, push 전에 반드시 승인을 받는다.

1. **발행 전 점검** — `git status --short` 로 변경된 소스 파일을 확인하고, 새로 추가·수정된 `posts/*/index.qmd` 의 frontmatter를 읽어 검증한다:
   - `title`, `description`, `date`, `toc`, `categories` 가 모두 있는지
   - `date` 형식이 `"YYYY-MM-DD"` 인지, 미래 날짜가 아닌지
   - `categories` 값이 기존 값(`Study`, `Reviews`, `Anecdotes`, `Announcement`) 중 하나인지 — 아니면 지적한다
   - `author` 필드가 들어가 있으면 제거를 제안한다 (`_metadata.yml`에서 처리됨)

   문제가 있으면 고칠지 물어본다. 사용자가 그냥 가자고 하면 진행한다.

2. **렌더** — `quarto render` 실행. 실패하면 에러 원문을 보여주고 여기서 멈춘다.

3. `docs/.nojekyll` 이 있는지 확인하고 없으면 빈 파일로 만든다.

4. **스테이징** — `git add -A` 후 `git status --short` 로 결과 확인.
   변경이 없으면 "푸시할 변경 없음"이라고 알리고 끝낸다.

5. **커밋** — 첫 줄은 기존 히스토리 관례를 그대로 따른다:
   `Site update: YYYY-MM-DD HH:MM:SS` (현재 시각, `Get-Date -Format "yyyy-MM-dd HH:mm:ss"`)
   그 뒤에 빈 줄 하나와 `Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>` 트레일러를 붙인다.

6. **푸시 승인** — push 하기 전에 사용자에게 다음을 보여주고 명시적 확인을 받는다:
   - 새로 발행되는 포스트 제목 목록
   - 변경된 소스 파일 수 / `docs/` 산출물 파일 수
   - 커밋 메시지

   승인 후에만 `git push origin main` 을 실행한다. 승인 없이 push 하지 않는다.

7. 푸시 성공 후 공개 URL을 안내한다: https://jesuspen-blog.github.io
   GitHub Pages 반영에 보통 1분 내외 걸린다는 점도 함께 알린다.
