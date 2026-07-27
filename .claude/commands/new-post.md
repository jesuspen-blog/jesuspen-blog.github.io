---
description: 새 블로그 포스트 폴더와 index.qmd 스캐폴드를 만든다
argument-hint: <포스트 제목> [카테고리]
allowed-tools: Write, Read, Glob, PowerShell(git status:*), PowerShell(quarto render:*)
---

새 포스트를 만든다. 사용자 입력: $ARGUMENTS

절차:

1. 제목을 확정한다. `$ARGUMENTS`가 비어 있으면 사용자에게 제목을 묻는다.
2. `posts/` 를 확인해 같은 이름의 폴더가 이미 있는지 본다. 있으면 덮어쓰지 말고 사용자에게 알린다.
3. 카테고리를 정한다. 기존 값은 `Study`, `Reviews`, `Anecdotes`, `Announcement`. 입력에 카테고리가 없으면 제목과 주제로 추론해 하나를 제안하고, 확실하지 않을 때만 묻는다.
4. `description`(영문 한 줄)을 제목·주제에서 작성한다.
5. `date`는 오늘 날짜를 쓴다. 발행일이 다르면 사용자가 알려줄 것이다.
6. `posts/<제목>/index.qmd` 를 UTF-8로 생성한다:

```
---
title: "<제목>"
description: "<영문 한 줄 설명>"
date: "<YYYY-MM-DD>"
toc: false
categories:
  - <카테고리>
---

```

7. 본문은 비워 둔다. 단, 사용자가 이 커맨드와 함께 내용·메모·초안을 같이 줬다면 그것을 CLAUDE.md의 글쓰기 톤 규칙에 맞춰 본문으로 채운다.
8. 만든 파일 경로를 알려주고, 본문을 채우고 싶으면 그냥 말해달라고 안내한다. 렌더나 푸시는 하지 않는다.
