# loessl.org

Personal homepage and blog, built with [Hugo](https://gohugo.io/) and the [Anubis](https://github.com/mitrichius/hugo-theme-anubis) theme. Deployed to GitHub Pages on push to `dev`.

## Prerequisites

Hugo extended (the CI pins to a specific version in `.github/workflows/build-hugo-site.yml`):

```sh
brew install hugo
```

## Local development

```sh
git clone --recurse-submodules https://github.com/hashier/hashier.github.io
cd hashier.github.io
make serve
```

The site is served at `http://localhost:1313`. The dev environment uses `config/development/config.toml` which sets a smaller paginator size and enables drafts by default.

## New post

```sh
cd homepage && hugo new posts/my-post-title.md
```

Edit the generated file in `content/posts/`. Set `draft: false` when ready to publish.

## Deploy

Push to `dev`. GitHub Actions builds the site and deploys it to GitHub Pages automatically.
