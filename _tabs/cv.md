---
layout: page
icon: fas fa-id-card
order: 5
title: CV
---

<style>
  /* Scoped to .cv-wrap so it never touches the rest of the theme.
     Colors use Chirpy's CSS variables, so it adapts to light/dark mode. */
  .cv-wrap { line-height: 1.5; }

  .cv-download {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: .9rem;
    text-decoration: none;
    color: var(--btn-patch-text-color, inherit);
    border: 1px solid var(--main-border-color, #d9d9d9);
    border-radius: 6px;
    padding: 6px 14px;
    margin-bottom: 1.2rem;
  }
  .cv-download:hover { background: var(--main-border-color, #eee); }

  .cv-wrap .cv-name { font-size: 1.9rem; font-weight: 700; margin: 0; }
  .cv-wrap .cv-tagline { color: var(--text-muted-color, #888); margin: .1rem 0 .5rem; }
  .cv-wrap .cv-contacts { font-size: .85rem; color: var(--text-muted-color, #888); }
  .cv-wrap .cv-contacts .sep { margin: 0 6px; opacity: .5; }
  .cv-wrap .cv-summary { margin: .7rem 0 0; font-size: .92rem; }

  .cv-wrap .cv-section { margin-top: 1.6rem; }
  .cv-wrap .cv-section-title {
    font-size: .82rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.3px;
    border-bottom: 1.5px solid var(--main-border-color, #d9d9d9);
    padding-bottom: 4px;
    margin: 0 0 .8rem;
  }

  .cv-wrap .cv-entry { margin-bottom: .9rem; }
  .cv-wrap .cv-entry-head {
    display: flex; justify-content: space-between; align-items: baseline; gap: 16px;
  }
  .cv-wrap .cv-entry-title { font-weight: 700; }
  .cv-wrap .cv-entry-meta {
    font-size: .8rem; color: var(--text-muted-color, #888);
    white-space: nowrap; text-align: right;
  }
  .cv-wrap .cv-entry-sub { font-style: italic; }
  .cv-wrap .cv-details { margin: .3rem 0 0; padding-left: 18px; }
  .cv-wrap .cv-details li { margin: 2px 0; }
</style>

<div class="cv-wrap">
  <a class="cv-download" href="{{ '/cv/print/' | relative_url }}">&#x2913; Download / Print PDF</a>
  {% include cv-body.html %}
</div>
