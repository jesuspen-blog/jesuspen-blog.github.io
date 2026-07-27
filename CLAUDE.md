# jesuspen-blog — 작업 규칙

김형수(HyoungSoo Kim)의 개인 블로그. Quarto 정적 사이트 → GitHub Pages.

## 구조

- 엔진: Quarto 1.8.x (`_quarto.yml`, `project.type: website`)
- 렌더 산출물: `docs/` — **GitHub Pages가 이 폴더를 서빙한다. 직접 편집 금지.**
  `docs/` 아래 파일을 수정해야 할 것 같으면 잘못된 접근이다. 소스(`.qmd`, `styles.css`, `_quarto.yml`)를 고치고 다시 렌더한다.
- 리모트: `origin` = https://github.com/jesuspen-blog/jesuspen-blog.github.io.git, 브랜치 `main`
- 파일 인코딩: 항상 UTF-8 (한글 본문). PowerShell로 파일을 쓸 때 `-Encoding utf8` 명시.

## 포스트 작성 규칙

한 포스트 = 한 폴더. 경로는 `posts/<포스트 제목>/index.qmd`.
폴더명이 URL 슬러그가 되므로 폴더명은 제목과 동일하게 두되(기존 관례), 공백은 그대로 허용한다.

frontmatter 형식 — 이 필드 순서를 지킨다:

```yaml
---
title: "포스트 제목"
description: "한 줄 영문 설명"
date: "YYYY-MM-DD"
toc: false
categories:
  - Study
---
```

- `author`는 개별 포스트에 쓰지 않는다. `posts/_metadata.yml`에서 전체 적용된다.
- `date`는 발행일. 오늘 날짜를 임의로 넣지 말고 사용자에게 확인하거나 오늘로 할지 물어본다.
- `description`은 기존 포스트들처럼 영문 한 줄.
- 기존에 쓰인 `categories` 값: `Study`, `Reviews`, `Anecdotes`, `Announcement`.
  새 카테고리를 만들기 전에 위 4개 중 맞는 것이 없는지 먼저 검토하고, 새로 만들 때는 사용자에게 알린다.
- 이미지는 포스트 폴더 안에 넣고 상대경로로 참조한다. 예: `![](M&A-process-ex.jpg)`
- 본문 첫 줄에 제목을 `#`으로 반복하지 않는다 (title-block-banner가 처리).

## 글쓰기 톤

- 본문은 한국어, 업계 영문 용어(M&A, LOI, C/R, U/W, PMI 등)는 한국어 문장에 그대로 혼용한다. 어색한 음역은 쓰지 않는다.
- 사용자 본인의 목소리로 쓴 글이다. 초안을 대신 쓰거나 다듬을 때는 `korean-humanizer` 스킬을 써서 AI 문체(번역체, 3의 법칙, 과장된 의의 부여, 마무리 상투구, 줄표·곡선따옴표)를 걷어낸다.
- 사용자가 쓴 문장의 의미를 바꾸지 않는다. 문장을 새로 창작해야 하면 그렇다고 밝힌다.

## 배포

`deploy.sh`와 동일한 절차. Windows에서는 `/publish` 슬래시 커맨드를 쓴다.

1. `quarto render` (실패하면 여기서 멈춘다)
2. `docs/.nojekyll` 존재 확인
3. `git add .`
4. 변경 없으면 중단, 있으면 `git commit -m "Site update: YYYY-MM-DD HH:MM:SS"`
5. `git push origin main`

**푸시는 공개 발행이다. 항상 커밋될 파일 목록을 사용자에게 보여주고 명시적 승인을 받은 뒤에만 push 한다.** 렌더·커밋까지는 진행해도 되지만 push는 승인 없이 하지 않는다.

## 하지 말 것

- `docs/` 직접 편집
- 승인 없는 `git push`
- 기존 포스트의 `date`나 폴더명 변경 (URL이 깨진다)
- `.quarto/` 커밋 (gitignore 대상)
