# BushmanQC SEO Playbook

This document is for **Nellie / the site owner**. It explains what was changed in the latest SEO passes and the few owner-side tasks that unlock the actual ranking benefit. Follow it top to bottom — most items take 10–20 minutes.

---

## What's been done in code

### Round 1 (PR #8) — on-page SEO baseline

- **All pages** got a fuller `<head>`: `theme-color`, `apple-touch-icon`, full Open Graph + Twitter Card, `og:site_name`, `og:locale`, explicit `robots` directive, Search Console / Bing verification placeholders.
- **Schema.org structured data** on every page: `Organization`, `ProfessionalService` with `hasOfferCatalog`, `Person` (Nellie), `WebSite`, `WebPage`, `BreadcrumbList`, `AboutPage`, `FAQPage` (15 questions), `ContactPage`, `ItemList` of services, etc.
- **New page**: `faq.html` with 15 buyer-intent FAQs (VQMS, FDA 21 CFR 820, ISO 13485, CAPA, QMSR…). Linked in main nav and footer.
- **New homepage sections**: "What Is a Virtual QMS?" explainer + "FDA 21 CFR 820 & ISO 13485 Compliance" 3-card section.
- **`sitemap.xml`** kept current; `terms.html` set to `noindex` and excluded from the sitemap.
- **Removed deprecated `<meta name="keywords">`**; improved internal anchor text.

### Round 2 (current) — content engine + playbook closures

- **`/insights/` content hub** (the README's own "single biggest accelerator from here"):
  - `insights/index.html` — Blog landing page with `Blog`, `WebPage`, `BreadcrumbList` schema.
  - `insights/qmsr-transition-checklist-2026.html` — pillar article (~1800 words) targeting *QMSR transition checklist*. `BlogPosting` + `BreadcrumbList` + `FAQPage` schema.
  - `insights/fda-21-cfr-820-vs-iso-13485.html` — pillar article targeting *21 CFR 820 vs ISO 13485*, with a comparison table.
  - `insights/pass-first-fda-inspection.html` — pillar article targeting *first FDA inspection*, with the top-5 483 observations.
  - "Latest from BushmanQC" homepage section linking to all three articles.
  - "Insights" added to the desktop nav, mobile nav, and footer nav on every page.
  - Three FAQ answers now deep-link to the matching insight article.
  - All four new URLs added to `sitemap.xml`.
- **Missing image assets generated** (referenced by meta tags but used to 404):
  - `images/og-image.jpg` — 1200×630 social card, brand purple, logo + headline.
  - `images/apple-touch-icon.png` — 180×180 iOS home-screen icon.
  - These are placeholder-quality but valid. Nellie can swap in a Canva-designed version later by overwriting the file at the same path; no code change needed.
- **Image optimization**: `images/nellie-400.webp` (~18 KB, down from 292 KB) replaces `nellie.webp` at every `<img>` reference. Hero image preload + `fetchpriority="high"` retained for LCP. The original `nellie.webp` is kept on disk so schema `image` references don't 404.
- **GA4 snippet** copied (still commented out) to every HTML page — was previously only on the homepage. Activate site-wide with one command (see Owner Task 1 below).
- **`404.html`** — friendly Cloudflare-served not-found page with all major links.
- **Testimonial section scaffold** on the homepage, hidden until populated (see Owner Task 4).
- **Helper script** `scripts/seo-tokens.sh` — replace GSC/Bing/GA4 placeholders across all 12 HTML files in one command.

---

## Owner tasks — do these to actually unlock the ranking benefit

The on-page work only matters if Google and Bing can see it. Items are ordered by impact.

### 1. Set up Google Search Console + Bing + GA4, then run one command (~30 min total)

The biggest single ranking unlock. Without Search Console you cannot see what queries you're ranking for or what's broken.

**Step 1 — Create the accounts and grab three values:**

1. **Google Search Console** (free) — <https://search.google.com/search-console>. Add property → URL prefix → `https://bushmanqc.com/`. Choose **HTML tag** verification. Copy the `content="..."` value (the GSC token).
2. **Bing Webmaster Tools** (free) — <https://www.bing.com/webmasters>. The fastest path is "Import from Google Search Console" (one click). Otherwise, add `https://bushmanqc.com/` and grab the meta-tag token the same way.
3. **Google Analytics 4** (free) — <https://analytics.google.com/>. Create Property → "BushmanQC" → Web data stream for `https://bushmanqc.com/`. Copy the Measurement ID (`G-XXXXXXXXXX` format).

**Step 2 — Replace placeholders in one command:**

```bash
scripts/seo-tokens.sh --gsc abc123XYZ --bing 9F8E7D --ga4 G-AB12CD34EF
```

The script replaces all three placeholders across every HTML page (root + `/insights/`) and uncomments the GA4 block in one pass. Re-run safely with whatever subset of flags you currently have — for example, run it once with just `--gsc` if Bing isn't ready yet, and again later with `--bing` and `--ga4`.

**Step 3 — Deploy and verify:**

```bash
wrangler deploy
```

Then back in Search Console click **Verify**, submit `sitemap.xml`, and use **URL Inspection** → **Request Indexing** on `/`, `/services.html`, `/faq.html`, and `/insights/` (you can do ~10/day). Do the same in Bing Webmaster Tools. In GA4, mark `click` events on `mailto:` and `calendly.com` links as conversions.

> **Privacy alternative**: if you'd rather avoid GA4's cookie banner overhead, drop in **Cloudflare Web Analytics** (free, since the site is on Cloudflare) — replace the GA4 block with the Cloudflare snippet at the same place in `<head>`. The helper script only handles GA4.

### 2. Set up Google Business Profile (~15 min, free)

Even without a street address, Google supports **service-area businesses**. This puts you in local-pack results and protects brand searches.

1. <https://business.google.com/> → **Add your business**.
2. Name: **BushmanQC**. Category: **Business management consultant** (or "Quality control consultant"). When asked about a customer-visible location → **No, I serve customers directly at their location**. Service area: **United States**. Phone: `(408) 892-8242`. Website: `https://bushmanqc.com/`.
3. Verify by phone or postcard.
4. Fill in hours, services (Virtual QMS, FDA Compliance, ISO 13485, CAPA…), description, photos (reuse `images/og-image.jpg` plus a photo of Nellie).
5. **Ask 3–5 happy clients for Google reviews** within the first 30 days. Reviews are the largest single ranking factor for service-area businesses.

### 3. Replace the placeholder social-card image (~30 min, optional)

`images/og-image.jpg` and `images/apple-touch-icon.png` are valid but generic right now. A Canva-designed version with a photo of Nellie + the BushmanQC logo will look better in social previews and Google Business Profile.

| File | Size | Notes |
| --- | --- | --- |
| `BushmanQC/images/og-image.jpg` | **1200 × 630**, JPG <200 KB | Brand purple (#6B5B95), logo, photo of Nellie, headline "Virtual QMS for Medical Devices" |
| `BushmanQC/images/apple-touch-icon.png` | **180 × 180**, PNG | Brand purple background, scaled-up logo |

Easiest path: Canva → Custom size → 1200×630 → drop in `logo.webp` and `nellie.webp`. Replace the existing files at the same paths — no code change needed.

Verify the social preview at <https://www.opengraph.xyz/url/https%3A%2F%2Fbushmanqc.com%2F> after deploy.

### 4. Collect 3–5 testimonials and turn on the scaffold (~ongoing)

The homepage has a hidden `<section class="testimonials" hidden>` block ready for client quotes. Once you have 3–5:

1. In `BushmanQC/index.html`, remove the `hidden` attribute on `<section class="testimonials">`.
2. Inside `.testimonial-grid`, replace the HTML comment with one `<figure class="testimonial-card">` per quote — there's a template inside the comment.
3. Add a `Review` + `AggregateRating` block to the homepage JSON-LD `@graph` (just below the existing `Person` block). The reviews then surface in rich results.

This is the single biggest conversion lift available, and it qualifies the homepage for review-star rich results.

### 5. Publish one new insight every month (~2 hours each)

The `/insights/` directory + 3 starter articles are live. The README's own previous recommendation — *"publish one in-depth article per month"* — is now mechanically easy: each new post is a single HTML file copy.

A good month-by-month topic backlog:

- *"CAPA root-cause analysis: 5 whys vs fishbone vs fault tree"*
- *"Design controls for AI/ML medical devices"*
- *"Supplier qualification for contract manufacturers"*
- *"ISO 14971 risk management for first-time founders"*
- *"How to write a Quality Manual that actually gets read"*
- *"Internal audits without an internal auditor"*

Each new article is also a LinkedIn post.

### 6. Backlinks (ongoing, low effort)

Backlinks from credible medical-device / regulatory sites drive long-term rankings. Tackle one at a time over months — don't pay anyone to "build backlinks" (it tanks rankings).

- **LinkedIn Company Page** for BushmanQC (separate from Nellie's personal profile). Post each new Insights article there.
- **RAPS, AdvaMed, MedTech Color** member directories.
- **MD+DI, Medical Design Briefs** guest articles (pitch a QMSR transition piece — you now have one to point them at).
- **Clutch / GoodFirms** B2B directories.
- **Podcast guest spots** (*Med Tech Talk*, *MedTech Pulse*, *Outcomes Rocket*).

Avoid paid directory networks and "$20 guest post" services — Google penalizes those.

---

## Validation checklist (after deploying)

- [ ] <https://search.google.com/test/rich-results> — paste `https://bushmanqc.com/`, `/faq.html`, `/services.html`, and `/insights/qmsr-transition-checklist-2026.html`. Each should show eligible rich-result types.
- [ ] <https://validator.schema.org/> — paste each new URL, no errors.
- [ ] <https://www.opengraph.xyz/> — preview each page; 1200×630 social card should render.
- [ ] <https://pagespeed.web.dev/> — run on `/`, `/services.html`, `/insights/`, and one article. Targets: SEO 100, Accessibility ≥95, Performance ≥85 mobile.
- [ ] `curl -I https://bushmanqc.com/does-not-exist` returns 404 + the friendly page renders.
- [ ] `site:bushmanqc.com` search in Google after ~1 week — confirm all 10 indexable pages appear (home + services + insights hub + 3 articles + faq + about + mission + contact).

## Expected timeline

- **Week 1**: All pages re-indexed; rich results start showing.
- **Weeks 2–4**: First Search Console queries appear.
- **Weeks 4–8**: Rankings move on low-competition long-tail queries (*"virtual QMS for medical device startup"*, *"QMSR transition"*).
- **Months 3–6**: Rankings move on harder head terms (*"FDA 21 CFR 820 consultant"*, *"ISO 13485 implementation"*) — only if content + backlinks keep coming.

The single biggest accelerator from here is staying on Task 5: one in-depth article per month, each shared on LinkedIn. Combined with the GBP/reviews work in Tasks 2 & 4, that's the durable ranking growth engine.

---

Questions? The original SEO plan and audit live in `~/.claude/plans/`.
