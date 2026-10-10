# CV revision and submission review

Reviewed 9 October 2026. No deployment, publishing, or changes to unrelated website content.
This report and the rendering helper are under `tools/`, which `_config.yml` excludes from the site.

## Files and output

- `_data/cv.yml`: shared content.
- `_includes/cv-body.html`: shared markup; supports section text, entry descriptions, and an optional print page break.
- `_layouts/cv-print.html`: A4 typography, margins, page numbers, and pagination.
- `_tabs/cv.md`: scoped web styles for the shared markup and wrapping entry headers.
- `tools/render-cv.rb`: standalone local render using the actual Liquid templates.
- PDF: `/private/tmp/Junyi-Li-CV.pdf` (local review artifact, not a published asset).
- Page images: `/private/tmp/junyi-cv-page-1.png`, `/private/tmp/junyi-cv-page-2.png`.

## Submission blockers

1. **Edinburgh dates:** the existing CV and About page say September 2025–February 2026; the application correspondence described by Junyi says 2026. The [linked reconstructed branch's README](https://github.com/DendyLiJunyi/LeanHammer/tree/reconstructed) says the project originated during a November 2025 Edinburgh visit, with surviving Git records beginning in August 2026 and a retrospectively reconstructed history. This does not establish the full project or internship period. September 2025–February 2026 remains unchanged in the CV. Confirm the internship/project start and end and the physical visit dates; then show separate periods if appropriate. The README's linked HISTORY.md returned 404 during review. Do not infer original development dates from reconstructed commits.
2. **Publications:** citations were not added, and no empty Publications heading is displayed. Both [IEEE record 10296002](https://ieeexplore.ieee.org/document/10296002) and [IEEE record 10451102](https://ieeexplore.ieee.org/document/10451102) presented a JavaScript/robot verification page through browsing; direct fetches returned empty bodies. Search did not yield usable metadata. A Crossref query for the first record number returned no matches; the second yielded no usable response. Supply IEEE BibTeX/RIS exports or authoritative metadata for each: full ordered author list, exact title, venue, publication year, and DOI (plus pages/volume/issue where applicable). Verify Junyi Li's authorship, bold his name, and insert Publications between Projects and Training. Recheck pagination after adding citations.

## Update — 10 October 2026

ArkLib was omitted from the CV at Junyi’s request. The remaining section is titled “Selected Projects.” ArkLib verification is no longer a submission blocker for this version. The PDF was subsequently re-exported with ArkLib removed.

## Other factual questions and evidence limits

- **Undergraduate thesis:** no exact title, supervisor, and contribution were found in this repository or its CV history. It is omitted until these are supplied and tied to Tianjin University. The NUS MSc is explicitly coursework-based; no master's thesis is claimed. Calculus Game remains a separate NUS project supervised by Prof. Huanchen Bao.
- **Huawei:** retained the existing role/team wording, “Research Intern — Celia Innovation Product,” and Huawei Singapore Research Center. Existing evidence supports a developed lemma library and a designed LLM-assisted prover. The revision does not claim implementation/evaluation of the entire prover or measured accuracy gains. Confirm the official team spelling against internship documentation if needed.
- **Algebra/Calculus Game:** existing material identifies abstract-algebra results and basic differentiation problems but no named definitions, lemmas, exercise identifiers, repositories, or contribution counts. Descriptions were shortened to those supported facts. More specific artifacts would strengthen these entries.
- **SIGPLAN-M:** the user's clarification establishes mentee status and Mukesh Tiwari as mentor. No year was found, so none is displayed. Confirm the year for a dated entry.
- **LeanHammer:** the user's clarification establishes the independent internship and Prof. Wenda Li's supervision. The linked README confirms partial Duper reconstruction and discusses limits. Its small demonstration-suite results were not promoted to an internship evaluation claim because the original evaluation period is not established.
- **Skills:** only demonstrated Lean/tactic/SMT integration experience and documented prover design are listed. No practical Agda, Coq, MINLOG, or other language proficiency is inferred from school attendance. No ongoing work is invented when its status is unresolved.

## Export and checks

The normal website route is `/cv/print/`. Click **Save as PDF**, select **A4**, **portrait**, **100% scale**, and use the CSS/default margins (not custom margins). Turn **Headers and footers OFF** in the browser print settings. Browser timestamps, document titles, and URL headers/footers are controlled by that setting, not removed by CSS alone. Current Chrome supports the CSS page-number margin box; other browsers may omit it. Background graphics are not needed. The print dialog now opens on button click rather than automatically, allowing inspection first.

For a local preview without the full Jekyll toolchain:

```sh
ruby tools/render-cv.rb /private/tmp/junyi-cv.html
'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' --headless=new --no-first-run --no-default-browser-check --user-data-dir=/private/tmp/junyi-cv-chrome --no-pdf-header-footer --print-to-pdf=/private/tmp/Junyi-Li-CV.pdf file:///private/tmp/junyi-cv.html
```

The helper requires Ruby, Liquid, and YAML; it uses an empty base URL, matching this repository. It renders the actual shared include and print layout. It is not a substitute for a full themed Jekyll build, which was not run because Jekyll/theme gems are not installed.

Completed checks:

- YAML parsed successfully; Liquid templates rendered with strict syntax checking and strict filters.
- Ruby helper syntax check and `git diff --check` passed.
- Chrome PDF generated; PDFKit confirmed exactly two pages, each approximately 595 × 842 points (A4).
- Both rasterized PDF pages visually inspected: no clipping, split entries, stranded headings, or browser-generated headers/footers; page numbers 1 and 2 visible. Body text stays at 11 pt.
- PDF annotations retain the email, website, GitHub profile, and reconstructed LeanHammer branch links.
- Website, GitHub profile, and reconstructed branch returned HTTP 200. The mailto target matches the displayed address; mailbox delivery was not tested and no email was sent.
- Publication link reachability is limited by IEEE's verification response; no publication links or unverified citations were inserted into the CV.
- Only CV-related source and tooling changed. Unrelated About-page claims were left untouched.

## Compact print layout — 10 October 2026

Removed the forced page break before Selected Projects. Kept 11 pt body text and the existing A4 margins; reduced print line-height from 1.45 to 1.4, section spacing from 20 to 16 px, heading bottom spacing from 12 to 9 px, entry spacing from 14 to 11 px, and bullet-list top spacing from 6 to 4 px. All three selected projects now fit on page 1; training and skills flow onto page 2. Page 2 remains shorter pending verified publication content. Regenerated `/private/tmp/Junyi-Li-CV.pdf` and visually inspected both pages: two A4 pages, intact entries, no clipped text, and page numbers retained. YAML/Liquid rendering and `git diff --check` passed.
