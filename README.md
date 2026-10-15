# Chirpy Starter

[![Gem Version](https://img.shields.io/gem/v/jekyll-theme-chirpy)][gem]&nbsp;
[![GitHub license](https://img.shields.io/github/license/cotes2020/chirpy-starter.svg?color=blue)][mit]

A minimal, ready-to-use template for creating a blog with the [**Chirpy**][chirpy] Jekyll theme. Get up and running in minutes with all critical files pre-configured.

## Why This Starter Exists

When installing Chirpy through [RubyGems.org][gem], Jekyll can only read a subset of theme files (`_data`, `_layouts`, `_includes`, `_sass`, `assets`) and limited `_config.yml` options from the gem. As a result, users cannot enjoy the full out-of-the-box experience that Chirpy offers.

To unlock all features, the following files must be present in your Jekyll site:

```shell
.
├── _config.yml
├── _plugins
├── _tabs
└── index.html
```

This starter bundles those files from the latest **Chirpy** release along with a [CD][CD] workflow, so you can start writing immediately.

## Usage

Check out the [theme's docs](https://github.com/cotes2020/jekyll-theme-chirpy/wiki).

### Writing folders

Documents in `_posts` are grouped by their purpose:

| Folder | Contents |
| --- | --- |
| `essays/` | Personal reflections, life, and academic experiences (随笔) |
| `book-notes/` | Book reviews, reading notes, and unfinished notes about books (读书笔记) |
| `creative-writing/` | Stories and poetry (创作与诗词) |
| `drafts/` | Miscellaneous drafts and works in progress (草稿) |

Add new documents to the appropriate folder. For a publishable post, keep the
`YYYY-MM-DD-title.md` filename and YAML front matter. Undated notes and empty
placeholders remain unpublished until they are given a valid post filename and
front matter.

These folders organize source files; the front matter still controls the site's
categories. The configured `/posts/:title/` permalink keeps post URLs independent
of these folders.

The `drafts/` folder here is **not** Jekyll's special `_drafts` folder. Its dated
posts with front matter remain eligible for publication, as before; a `draft`
category does not hide them. To keep a dated post unpublished, set
`published: false` in its front matter.

## Contributing

This repository is automatically updated with new releases from the theme repository. If you encounter any issues or want to contribute to its improvement, please visit the [theme repository][chirpy] to provide feedback.

## License

This work is published under [MIT][mit] License.

[gem]: https://rubygems.org/gems/jekyll-theme-chirpy
[chirpy]: https://github.com/cotes2020/jekyll-theme-chirpy/
[CD]: https://en.wikipedia.org/wiki/Continuous_deployment
[mit]: https://github.com/cotes2020/chirpy-starter/blob/master/LICENSE
