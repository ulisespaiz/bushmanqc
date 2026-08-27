# ADD-A-PAGE — publishing a new BushmanQC article

Adding one article to bushmanqc.com touches **five files**. Miss one and the post
is either invisible to search, missing from the feed, or orphaned from the hub.

The site is hand-written static HTML served by Cloudflare Workers static assets.
There is no build step, no templating engine, and no CMS. Everything below is a
manual edit.

Repo layout:

```
/home/user/bushmanqc/
├── BushmanQC/                 <- the deployed working tree
│   ├── resources/<slug>.html  <- articles live here
│   ├── resources.html         <- the blog hub
│   ├── feed.xml               <- RSS 2.0 feed
│   ├── sitemap.xml
│   ├── llms.txt
│   ├── _redirects
│   └── css/site.css
├── templates/article-template.html   <- copy this to start
└── ADD-A-PAGE.md                     <- you are here
```

---

## Before you start

Pick the slug. It is used in **seven** places and must be identical in all of them:

- the filename `BushmanQC/resources/<slug>.html`
- the canonical URL `https://bushmanqc.com/resources/<slug>`
- three Calendly `utm_medium=resources-<slug>` strings (announcement bar, nav
  desktop, nav mobile) plus two more (footer, article CTA) — five total
- the `@id` values in the JSON-LD graph
- the sitemap, feed, hub and llms.txt entries below

Slug rules: lowercase, hyphens, no dates, no stop words you can drop, no `.html`.

---

## File 1 of 5 — `BushmanQC/resources/<slug>.html` (the article)

```bash
cp /home/user/bushmanqc/templates/article-template.html \
   /home/user/bushmanqc/BushmanQC/resources/<slug>.html
```

Then replace every `{{TOKEN}}` and delete the top comment block. The template
documents each token. The section order inside `<article class="article-body">`
is **fixed** and must not be reordered:

1. `article-meta` — byline, Published date, Last reviewed date, read time
2. `article-callout` — the answer-first **Short answer**
3. body — orienting paragraphs, then `h2` / `h3` sections
4. `article-cta`
5. `author-bio` (the bio box)
6. `article-sources` (numbered Sources list)
7. related-reading line

Checks before you move on:

- [ ] `<title>` set, ideally ≤ 60 characters including `| BushmanQC`
- [ ] `<meta name="description">` is 150–160 characters and answers the title
- [ ] `<link rel="canonical">` points at the extensionless URL
- [ ] `<link rel="alternate" type="application/rss+xml" ... href="/feed.xml">` present
- [ ] OG + Twitter tags filled, `article:published_time` / `article:modified_time` set
- [ ] JSON-LD graph has `Article` (with the full inline `author` and `publisher`),
      `WebPage`, and `BreadcrumbList`, and every `@id` uses the real slug
- [ ] all five Calendly links carry `utm_medium=resources-<slug>` and the right
      `utm_content` (`announcement-bar`, `nav-desktop`, `nav-mobile`, `footer`,
      `article-cta`) — those five positions are the whole allowed set
- [ ] 6–12 numbered inline citations, each `<sup class="cite"><a href="#src-N">N</a></sup>`
      matching an `<li id="src-N">` in the Sources list
- [ ] every CFR / ISO / QMSR / FDA claim links to a primary source
      (eCFR, Federal Register, FDA.gov, uscode.house.gov)
- [ ] at least one internal link to a `/services` anchor, one to a sibling
      `/resources` article, and `/faq` where relevant
- [ ] internal links are extensionless (`/resources/foo`, never `.html`) and
      stay in-tab; external links carry `target="_blank" rel="noopener"`
- [ ] the author bio box is copied **verbatim** from the template

Validate the JSON-LD parses:

```bash
python3 - <<'EOF'
import json,re,sys
p="/home/user/bushmanqc/BushmanQC/resources/<slug>.html"
s=open(p).read()
for b in re.findall(r'<script type="application/ld\+json">(.*?)</script>',s,re.S):
    json.load(__import__('io').StringIO(b)); print("ld+json OK")
EOF
```

---

## File 2 of 5 — `BushmanQC/resources.html` (the blog hub)

Two edits, both required:

**a. Add the card.** Put it inside the right topic group
(`Regulatory Guides` or `Practical How-Tos`), newest first within the group:

```html
<a class="resource-card fade-in" href="/resources/<slug>">
  <span class="resource-tag"><TOPIC TAG></span>
  <h2><ARTICLE TITLE></h2>
  <p><1–2 sentence summary, same voice as the meta description></p>
  <span class="resource-more">Read the guide &rarr;</span>
  <p class="resource-card-meta">
    <span class="resource-card-author">Nellie Bushman</span>
    <span class="resource-card-sep" aria-hidden="true">·</span>
    <time datetime="YYYY-MM-DD">Month D, YYYY</time>
    <span class="resource-card-sep" aria-hidden="true">·</span>
    <span>~N min read</span>
  </p>
</a>
```

**b. Add the `ItemList` entry** in the page's JSON-LD. Positions must be
contiguous `1..N` and must match the visual order of the cards.

```json
{
  "@type": "ListItem",
  "position": N,
  "url": "https://bushmanqc.com/resources/<slug>",
  "name": "<ARTICLE TITLE>"
}
```

---

## File 3 of 5 — `BushmanQC/feed.xml` (RSS)

Add a new `<item>` **at the top** of `<channel>` (newest first), and bump
`<lastBuildDate>` to today.

```xml
<item>
  <title><ARTICLE TITLE></title>
  <link>https://bushmanqc.com/resources/<slug></link>
  <guid isPermaLink="true">https://bushmanqc.com/resources/<slug></guid>
  <pubDate>Thu, 27 Aug 2026 00:00:00 GMT</pubDate>
  <dc:creator>Nellie Bushman</dc:creator>
  <category><TOPIC TAG></category>
  <description><plain-text summary, no HTML></description>
</item>
```

`pubDate` is RFC 822. Get it with:

```bash
python3 -c "from datetime import datetime;print(datetime.strptime('2026-08-27','%Y-%m-%d').strftime('%a, %d %b %Y 00:00:00 GMT'))"
```

Validate:

```bash
python3 -c "import xml.dom.minidom as m;m.parse('/home/user/bushmanqc/BushmanQC/feed.xml');print('feed.xml OK')"
```

---

## File 4 of 5 — `BushmanQC/sitemap.xml`

Add the URL next to the other `/resources/*` entries:

```xml
<url>
  <loc>https://bushmanqc.com/resources/<slug></loc>
  <lastmod>YYYY-MM-DD</lastmod>
  <changefreq>yearly</changefreq>
  <priority>0.7</priority>
</url>
```

Also bump `<lastmod>` on `https://bushmanqc.com/resources` — the hub changed.

Do **not** list `feed.xml` in the sitemap.

---

## File 5 of 5 — `BushmanQC/llms.txt`

Add a bullet under **## In-depth guides (Resources)**, matching the existing
shape — title, URL, then a dense one-sentence summary naming the concrete
regulatory hooks the article covers (e.g. `§ 820.10(c)`, `21 CFR 11.200`):

```markdown
- [<ARTICLE TITLE>](https://bushmanqc.com/resources/<slug>): <one dense sentence>.
```

---

## Also required: `BushmanQC/_redirects`

Not a "content" file, but every article needs two rules so the legacy `.html`
and trailing-slash forms resolve instead of 404ing. Add to the matching
sections, keeping the existing grouping:

```
/resources/<slug>.html /resources/<slug> 301
/resources/<slug>/ /resources/<slug> 301
```

Static rules only, and they must stay above any future dynamic rule.

---

## Final pass

```bash
cd /home/user/bushmanqc/BushmanQC

# no .html internal links leaked into the new article
grep -n 'href="/[^"]*\.html"' resources/<slug>.html

# every Calendly link on the page uses this article's utm_medium
grep -o 'utm_medium=[a-z0-9-]*' resources/<slug>.html | sort -u

# citation markers and source ids line up
grep -o 'href="#src-[0-9]*"' resources/<slug>.html | sort -u
grep -o 'id="src-[0-9]*"'    resources/<slug>.html | sort -u

# the frozen claims never appear
grep -rn "50+ implementations\|100% audit\|audit pass rate" resources/<slug>.html
```

The last grep must return **nothing**. The "50+ implementations" and
"100% audit pass rate" claims are frozen pending owner review and must not
appear in any new or retrofitted article, including the author bio. The
"25+ years" claim is corroborated and allowed.

## Rules that apply to every page

- **Truth rule.** No invented statistics, client stories, testimonials or
  credentials. Claims about BushmanQC come only from what the site already
  says. Regulatory and technical facts must be verifiable and cited to a
  primary source.
- **Look stays as-is.** New CSS may only be *additive* classes appended to
  `css/site.css`, matching the existing purple `#6B5B95` family and the
  existing card/typography patterns. Never modify an existing selector.
- **No nav changes.** No new nav items, ever.
- **Never run `git commit` or `git push`.** The PM handles git.
