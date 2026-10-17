# Agent guide for this blog

Jekyll site using the Chirpy theme (gem `jekyll-theme-chirpy` 7.x), deployed to
GitHub Pages by `.github/workflows/pages-deploy.yml` on every push to `main`.
Pushing to `main` publishes the site, so never push or commit unless the owner asks.

The owner writes the article body only. The agent's job on articles is:

1. Turn a content-only file into a post Jekyll will build (filename + front matter).
2. Fix grammar and spelling.
3. Fix and complete math so MathJax renders it.

## Scope

| Path | What to do |
| --- | --- |
| Any folder named `draft/` or `drafts/` (e.g. `draft/`, `_posts/drafts/`) | **Do not open, read, or touch.** Skip it entirely when listing or searching files. |
| `_posts/essays/`, `book-notes/`, `creative-writing/`, `cryptography/`, other `_posts/*/` | Articles you may prepare. |
| Empty files (0 bytes) | Placeholders. Leave them alone. |
| `_config.yml`, `_includes/`, `_layouts/`, `_plugins/`, `_tabs/`, `_data/` | Site code. Change only when asked. |

A file is **ready** when its name is `YYYY-MM-DD-slug.md` and it starts with
YAML front matter. A file is **content-only** when either is missing; Jekyll
ignores it until fixed.

## 1. Making a post buildable

Rename the file to `YYYY-MM-DD-slug.md` (use `git mv`) in the same folder:

- Date: the date the owner gives. If none, use the date the file was first committed
  (`git log --diff-filter=A --follow --format=%ad --date=short -- <file> | tail -1`),
  or today if it isn't committed yet.
- Slug: short, lowercase, hyphenated English (`extended-euclidean-algorithm`).
  For Chinese articles, a Chinese slug is also fine and matches existing posts
  (`2026-07-12-Phd的第一课.md`). The slug becomes the URL (`/posts/:title/`), so
  **never rename a post that is already published**.

Add front matter:

```yaml
---
title: Extended Euclidean Algorithm
description: One sentence summarizing the post, used for SEO and post previews.
date: 2026-10-15 00:00:00 +0800
categories: [Cryptography]
tags: [number-theory, modular-inverse]
math: true            # only if the post has any math
---
```

- `title`: from the article's first `# Heading` if there is one (then delete that
  heading from the body, since Chirpy prints the title), otherwise write one in
  the article's language.
- `date`: same date as the filename, time `00:00:00`, timezone `+0800`.
- `categories`: reuse existing ones. Folder → category:
  `essays/` → `[随笔]`, `book-notes/` → `[Book Review]`,
  `creative-writing/` → `[随笔]`, `cryptography/` → `[Cryptography]`.
  Check what's in use: `grep -rh "^categories:" _posts | sort | uniq -c`.
- `tags`: 2–5 lowercase hyphenated tags; reuse existing tags when they fit.
- Optional: `pin: true`, `image:` (cover), `published: false` (keep a dated post hidden).
- Body headings should start at `##`, since the title is the page's `#`.

## 2. Grammar

- Fix grammar, spelling, punctuation, and obvious typos. Keep the owner's voice,
  word choice, tone, and structure. Don't rewrite sentences that are already correct,
  don't add content, and don't "improve" style.
- The owner often writes one sentence per line. Keep that layout; Markdown joins the
  lines into a paragraph anyway.
- Chinese articles: fix typos (错别字) and punctuation only (full-width `，。；：？！`).
  Classical Chinese poetry and ci (诗词) in `creative-writing/`: don't change wording.
- Never edit text inside code blocks, inline code, URLs, or quotations from other works.
- After editing, give the owner a short list of meaningful changes
  (`before → after`), not a rewrite of the whole file.

## 3. Math

MathJax runs only when the front matter has `math: true`. Delimiters
(from the theme's `assets/js/data/mathjax.js`):

- Inline: `$...$`
- Display: `$$` on its own lines, with a **blank line before and after**:

  ```markdown
  so we get

  $$
  a^{p-1} \equiv 1 \pmod p.
  $$

  where $p$ is prime.
  ```

The owner may write math loosely. Convert it to proper LaTeX without changing
its meaning:

| Owner writes | Becomes |
| --- | --- |
| `a^(p-1) = 1 mod p` | `$a^{p-1} \equiv 1 \pmod p$` |
| `gcd(x,y)`, `x_i`, `r_k+1` | `$\gcd(x, y)$`, `$x_i$`, `$r_{k+1}$` |
| `sqrt(a)`, `a/b` in display | `$\sqrt{a}$`, `$\frac{a}{b}$` |
| `<=`, `>=`, `!=`, `->`, `...` | `\le`, `\ge`, `\ne`, `\to`, `\ldots` |
| `(a/p)` (Legendre symbol) | `\left(\frac{a}{p}\right)` |
| `Z_n`, `Z/nZ` | `\mathbb{Z}_n`, `\mathbb{Z}/n\mathbb{Z}` |
| a bare variable in prose: "let x be" | "let $x$ be" |

- Multi-index subscripts/superscripts need braces: `r_{k-1}`, `a^{(p+1)/4}`.
- Equation chains: use `aligned` inside one `$$` block, aligning on `&=` / `&\equiv`.
- Number an equation with `\tag{1}` only when the text refers to it.
- Homepage previews: every math post needs a `description:`, which is what the
  homepage card shows. It may contain inline `$...$` (rendered by the loader in
  `_includes/metadata-hook.html`). Without a description, Chirpy shows the first 200
  characters of the body as plain text, which cuts formulas in half. Write the description
  as an unquoted or single-quoted YAML string (double quotes would eat the backslashes),
  use only inline math, and keep it to one sentence.
- If a formula is mathematically wrong or ambiguous, **don't silently fix it**:
  leave it and tell the owner what looks off.

Kramdown pitfalls (Markdown is processed before MathJax):

- Inside inline `$...$`, kramdown treats backslash escapes as Markdown. Write
  `\lbrace \rbrace` instead of `\{ \}`, and `\lvert`/`\rvert` (or `\mid`) instead of `|`,
  especially inside tables, where `|` splits cells.
- `*` and `_` in inline math can turn into emphasis when there are two of them on a
  line; use `\ast` for `*`, and prefer display math for formulas with many subscripts.
- Don't put `$$` inside a list item without indenting it to the item's level.
- A `$` used for money in a math post must be written `\$`.

## Verifying

Chirpy 7 needs Ruby 3.x. If `ruby -v` shows 4.x, first run
`export PATH=/opt/homebrew/opt/ruby@3.3/bin:$PATH`.

```sh
bundle install                    # once
bundle exec jekyll build          # must finish without errors
bundle exec jekyll serve          # preview at http://127.0.0.1:4000
```

Check the post appears in `_site/posts/<slug>/index.html`. For math posts, open it
in the preview and confirm every formula renders (no raw `$` or red MathJax errors).

## Site customizations

- `_includes/metadata-hook.html`: the "System" theme option follows the viewer's local
  clock (light 07:00–19:00, dark otherwise). An explicit Light/Dark choice in the
  sidebar toggle overrides it. The site's HTML is compressed onto one line, so use
  `/* */` comments in inline scripts, never `//`.
- `_plugins/posts-lastmod-hook.rb`: sets "last updated" from git history.
- CV: `_data/cv.yml`, `_includes/cv-body.html`, `_layouts/cv-print.html`; see `tools/cv-review.md`.
