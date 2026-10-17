---
name: prepare-post
description: Prepare blog articles for publishing - add filename date and front matter to content-only files, fix grammar, and fix/complete math for MathJax. Use when the owner asks to prepare, polish, proofread, or publish a post, or to check math in a post.
argument-hint: "[path to post, or empty for all content-only posts]"
---

Follow `AGENTS.md` (sections 1–3) exactly. Steps:

1. Pick targets.
   - If `$ARGUMENTS` names a file, work on that file.
   - Otherwise list content-only articles: every non-empty `.md` under `_posts/`
     except anything inside a `draft/` or `drafts/` folder (don't open those), whose name doesn't start with `YYYY-MM-DD-` or whose
     first line isn't `---`. Show the list and ask which to prepare.
2. For each target:
   1. Read the whole file.
   2. If content-only: choose the date, slug, title, categories, and tags per section 1,
      `git mv` to the dated name, and add front matter.
   3. Fix grammar (section 2).
   4. If there's any math: fix and complete it (section 3) and set `math: true`.
3. Run `bundle exec jekyll build` and confirm each post exists under `_site/posts/`.
4. Report per file: new path, front matter chosen, a short list of grammar changes,
   math changes, and anything mathematically doubtful left for the owner to decide.

Don't commit or push. The owner reviews the diff first.
