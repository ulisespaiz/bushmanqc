# BushmanQC SEO Playbook

This document is for **Nellie / the site owner**. It explains what was changed in the recent SEO pass and the few one-time owner tasks that unlock the actual ranking benefit. Follow it top to bottom — each item takes 5–30 minutes.

---

## What was changed in the codebase

A summary, so you know what's already done:

- **All 6 pages** got a fuller `<head>`: `theme-color`, `apple-touch-icon`, full Open Graph + Twitter Card with image, `og:site_name`, `og:locale`, explicit `robots` directive, and Search Console / Bing verification *placeholders*.
- **Schema.org structured data** is now on every page (was only on the homepage):
  - Homepage: `Organization`, `ProfessionalService` with `hasOfferCatalog`, `Person` (Nellie), `WebSite`, `WebPage`, `BreadcrumbList`
  - About: `AboutPage`, `Person` (Nellie), `BreadcrumbList`
  - Services: `WebPage`, `BreadcrumbList`, `ItemList` of all 6 Services, `FAQPage` with 4 service-specific Q&As
  - Mission / Contact: `WebPage` + `BreadcrumbList` + (Contact) `ContactPage` with `Organization.contactPoint`
  - FAQ: `FAQPage` with 15 questions, `WebPage`, `BreadcrumbList`
- **New page: `faq.html`** with 15 buyer-intent FAQs (Virtual QMS, FDA 21 CFR 820, ISO 13485, CAPA, QMSR, etc.). Linked in main nav and footer on every page.
- **New homepage sections**: "What Is a Virtual QMS?" explainer + "FDA 21 CFR 820 & ISO 13485 Compliance" 3-card section. The hero / H1 was left exactly as it was per the owner's preference.
- **`sitemap.xml`** updated with `/faq.html`, refreshed `lastmod` dates, dropped `terms.html` from the sitemap (it's now `noindex` since legal pages don't help rankings).
- **Removed deprecated `<meta name="keywords">`** from the homepage.
- **Improved internal anchor text**: "View All Services" → "See our 7-step VQMS implementation process", "Learn More About Us" → "Meet Nellie Bushman, Quality Expert & Founder".

There's also a `/root/.claude/plans/how-is-the-seo-quirky-frog.md` file with the original audit + plan, if you want the full reasoning.

---

## Owner tasks — do these to actually unlock the ranking benefit

The on-page SEO fixes only matter if Google and Bing can see them. These six steps make that happen.

### 1. Set up Google Search Console (~15 min, free)

This is the single most important thing. Without it, you cannot see what's working, what's broken, or what queries you're starting to rank for.

1. Go to <https://search.google.com/search-console>, sign in with the same Google account you use for everything.
2. Click "Add property" → choose **URL prefix** → enter `https://bushmanqc.com/`.
3. Choose the **HTML tag** verification method. Google will give you a meta tag that looks like:
   `<meta name="google-site-verification" content="abc123XYZ_real_token_here" />`
4. Copy just the `content="..."` value. That's your token.
5. In every HTML file in `BushmanQC/`, find the line:
   `<meta name="google-site-verification" content="REPLACE_WITH_GSC_TOKEN">`
   and replace `REPLACE_WITH_GSC_TOKEN` with your real token. **Use the same token on every page** — Google only needs it on the homepage but having it everywhere is harmless and protects against page-only crawls.
6. Deploy the change (`wrangler deploy` or merge the PR).
7. Back in Search Console, click **Verify**.
8. Once verified: in the left sidebar, **Sitemaps** → enter `sitemap.xml` → Submit.
9. Then **URL Inspection** → paste `https://bushmanqc.com/` → click **Request Indexing**. Repeat for `/services.html`, `/faq.html`, `/about.html`. (You can only do ~10/day; that's fine.)

After 2–3 weeks, the **Performance** report will start showing the search queries your site is appearing for and where it ranks. The **Coverage** report shows any indexing issues.

### 2. Set up Bing Webmaster Tools (~10 min, free)

Bing powers DuckDuckGo, ChatGPT search, and increasingly Copilot/AI search results. Worth doing.

1. Go to <https://www.bing.com/webmasters>.
2. The fastest path is **Import from Google Search Console** — one click, done.
3. If you prefer manual: add `https://bushmanqc.com/`, choose Meta tag verification, replace `REPLACE_WITH_BING_TOKEN` in each HTML file, deploy, verify.
4. Submit `https://bushmanqc.com/sitemap.xml`.

### 3. Set up Google Analytics 4 (~10 min, free)

Without analytics you cannot see what people do on the site after they arrive.

1. Go to <https://analytics.google.com/> → Admin → Create Property → "BushmanQC".
2. Set up a **Web** data stream for `https://bushmanqc.com/`.
3. Copy the Measurement ID (looks like `G-ABC1234XYZ`).
4. In **every HTML file** in `BushmanQC/`, find the commented-out GA4 block near the bottom of `<head>`:
   ```html
   <!-- <script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     function gtag(){dataLayer.push(arguments);}
     gtag('js', new Date());
     gtag('config', 'G-XXXXXXXXXX');
   </script> -->
   ```
   *(currently only on `index.html` — copy it to the other 6 pages too)*
5. Uncomment it (remove the outer `<!--` and `-->`) and replace **both** instances of `G-XXXXXXXXXX` with your real Measurement ID.
6. Deploy.
7. Mark conversions: in GA4, mark `click` events on `mailto:nellie@bushmanqc.com` and `https://calendly.com/bushmanqc` links as conversions so you can count consultations booked.

> **Privacy note:** GA4 is fine for the US. If you want a privacy-first alternative that doesn't need a cookie banner, swap in **Plausible** (~$9/mo) or **Cloudflare Web Analytics** (free, since you're already on Cloudflare). Just replace the GA4 block with the provider's snippet.

### 4. Create the missing image assets (~30 min)

- ✅ **`BushmanQC/images/og-image.jpg` is done** — a 1200 × 630, ~98 KB branded share card (BushmanQC logo, "Virtual QMS, done simply." headline, FDA 21 CFR 820 / ISO 13485 / 21 CFR Part 11 chips, CTA, and Nellie's headshot) now ships in the repo and is referenced by the Open Graph / Twitter meta on every page. Test the preview at <https://www.opengraph.xyz/url/https%3A%2F%2Fbushmanqc.com%2F> after deploy.
- ✅ **`BushmanQC/images/apple-touch-icon.png` is done** — a 180 × 180 brand-purple tile with a legible "BQC / VIRTUAL QMS" mark, referenced by the `apple-touch-icon` link on every page.

### 5. Optimize `nellie.webp` — ✅ done

The hero image was a 292 KB PNG mislabeled `.webp`. It's now re-encoded as a **true WebP at ~24 KB** (same 400×500 dimensions, no visible quality loss) — a ~92% reduction. Because the filename is unchanged, the hero, the `<link rel="preload">`, the Schema.org `image`, and the About-page reference all benefit automatically with no markup changes. This is the LCP image, so it directly improves the mobile PageSpeed score Google uses as a ranking tiebreaker.

### 6. Set up Google Business Profile (~15 min, free)

Even though BushmanQC has no street address, Google supports **service-area businesses**. This puts you in the local pack and brand searches.

1. Go to <https://business.google.com/>.
2. Click **Add your business**.
3. Business name: **BushmanQC** (or "BushmanQC — Virtual QMS" if you want the keyword).
4. Category: **Business management consultant** (or "Quality control consultant" if available).
5. When asked "Do you want to add a location customers can visit?" → **No, I serve customers directly at their location**.
6. Service area: **United States**.
7. Phone: `(408) 892-8242`. Website: `https://bushmanqc.com/`.
8. Verify by phone or postcard.
9. Once verified, fill in: hours, services (Virtual QMS, FDA Compliance, ISO 13485, CAPA…), description, photos (use the same `og-image.jpg` plus a photo of Nellie).
10. **Ask 3–5 happy clients to leave a Google review** within the first 30 days. Reviews are the largest single ranking factor for service-area businesses.

### 7. Quality backlinks (ongoing)

Backlinks from credible medical device / regulatory sites are what drive long-term rankings. Tackle these one at a time over a few months — don't pay anyone to "build backlinks" (it tanks rankings).

- **LinkedIn Company Page**: today the site links to Nellie's *personal* LinkedIn. Create a **BushmanQC company page** as well, link it from the personal one, and post the FAQ articles there. Free authoritative backlinks.
- **RAPS (Regulatory Affairs Professionals Society)**: member directory listing.
- **AdvaMed**: industry association directory.
- **MedTech Color**: directory + community.
- **MD+DI / Medical Design Briefs**: pitch a guest article on "QMSR transition for startup medical device companies".
- **Clutch / GoodFirms**: B2B service directories — modest but reliable backlinks.
- **Substack / podcast guest spots**: pitch shows like *Med Tech Talk*, *MedTech Pulse*, *Outcomes Rocket* on the QMSR transition. Each appearance = a backlink.

Avoid: paid directory networks, "guest post for $20" services, generic citation builders. Google penalizes these aggressively.

---

## Validation checklist (after deploying)

Before announcing the changes are live, walk through this list:

- [ ] Open <https://search.google.com/test/rich-results> — paste `https://bushmanqc.com/` and `/faq.html` and `/services.html`. Each should show eligible rich-result types (Organization, FAQPage, Service, BreadcrumbList).
- [ ] Open <https://validator.schema.org/> — paste each page URL, no errors.
- [ ] Open <https://www.opengraph.xyz/> — preview each page. The 1200×630 social card should render once `og-image.jpg` is created (step 4 above).
- [ ] Run <https://pagespeed.web.dev/> on `/`, `/services.html`, `/faq.html`. Target: SEO 100, Accessibility ≥95, Performance ≥85 mobile.
- [ ] Open the live site on a phone, click every nav link, including FAQ on every page.
- [ ] Search `site:bushmanqc.com` in Google after ~1 week — confirm all 6 indexable pages appear.

## Expected timeline

- **Week 1**: All 6 pages re-indexed, rich results start showing.
- **Weeks 2–4**: First Search Console queries appear, you can see what people are searching to find you.
- **Weeks 4–8**: Rankings start moving for low-competition long-tail queries (e.g. *"virtual QMS for medical device startup"*).
- **Months 3–6**: Rankings move on the harder head terms (*"FDA 21 CFR 820 consultant"*, *"ISO 13485 implementation"*) **only if** content + backlinks keep coming.

The single biggest accelerator from here is **publishing one in-depth article per month** — e.g., "QMSR Transition Checklist for 2026", "FDA 21 CFR 820 vs ISO 13485: A Founder's Cheat Sheet", "How to Pass Your First FDA Inspection". Each one becomes a long-tail ranking magnet and gives Nellie content to share on LinkedIn.

---

Questions? The original SEO plan with all the reasoning is at `~/.claude/plans/how-is-the-seo-quirky-frog.md`.
