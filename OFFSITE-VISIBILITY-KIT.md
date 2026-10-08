# BushmanQC Off-Site Visibility Kit

**For:** Nellie Bushman (owner) and the BushmanQC web developer
**Prepared:** 2026-10-08
**Goal:** Get BushmanQC listed, described the same way, and cited on the third-party sites that Google and the AI assistants (ChatGPT, Claude, Perplexity, Gemini, Copilot) read when someone asks "who can help my medical device startup with a QMS?"

> **Why off-site matters.** AI assistants rarely recommend a business only because of its own website. They look for the same name, URL and description repeated on sources they trust: search-engine indexes, LinkedIn, vendor partner directories, industry publications and community answers. This kit gets BushmanQC onto those sources, each with the same wording.

**How to use this file**

- Every block in a grey box is **ready to paste**. Character counts were checked against each platform's limit on 2026-10-08.
- `[FILL IN: ...]` means only Nellie knows the answer. Never guess these. If she doesn't want to share something, delete the phrase.
- **Nellie** does steps marked 👤 (logging in, writing, posting). **The developer** does steps marked 🛠 (DNS, code).
- Everything is free unless it is marked **💲 PAID**.

---

## 0. Prioritized checklist

Work from the top down. The first four items take about an hour and unlock everything else.

| # | Item | Who | Time | Cost | Why it matters |
|---|------|-----|------|------|----------------|
| 1 | [Google Search Console](#1-google-search-console): Domain property via a Cloudflare DNS TXT record, then submit the sitemap | 🛠 + 👤 | 15 min (+ up to 72 h for DNS to update) | Free | Google and Gemini's index. Shows what Google can see and which searches you appear for. |
| 2 | [Bing Webmaster Tools](#2-bing-webmaster-tools): import from GSC, turn on IndexNow (Cloudflare Crawler Hints) | 👤 + 🛠 | 10 min | Free | Bing powers Copilot and is widely reported to feed ChatGPT search. Its **AI Performance** report shows when Copilot cites you. |
| 3 | [Brave Search](#3-brave-search) URL submit | 👤 | 5 min | Free | Brave is the web-search provider Anthropic lists for Claude. |
| 4 | [Fill in the master NAP + description block](#10b-master-nap--description-block-reuse-everywhere) | 👤 | 20 min | Free | Every listing below copies from it, so the wording stays consistent. |
| 5 | [LinkedIn Company Page + profile link + Service Page](#5-linkedin-company-page) | 👤 | 45 min | Free (Premium is optional and not needed) | LinkedIn is one of the most-cited sources for "who is X" questions. |
| 6 | [QMS vendor partner directories](#6-qms-software-vendor-partner--consultant-directories): Qualio, SimplerQMS, Greenlight Guru, Matrix Req | 👤 | 15 min each | Free to apply (no fee stated) | Software buyers ask AI "who implements Qualio/Greenlight?" and these directories answer that. |
| 7 | [Industry and B2B directories](#7-b2b--industry-directories): OpenRegulatory, Clutch, Crunchbase, BBB (free listing), Advisera | 👤 | 15–20 min each | Free. **💲 RAPS membership and BBB accreditation are paid** | Third-party confirmation that BushmanQC exists and what it does. |
| 8 | [Google Business Profile](#4-google-business-profile-read-the-eligibility-warning-first): **only if eligible** (see warning) | 👤 | 30 min + verification | Free | Google Maps and local results. **Fully online businesses aren't eligible under Google's rules.** |
| 9 | [Review requests](#10a-review-request-email-google--clutch) (Google, if you have a profile, and Clutch) | 👤 | 30 min setup, then 5 min per client | Free | Reviews are the strongest trust signal on both platforms. |
| 10 | [Reddit / LinkedIn / Q&A participation](#8-reddit-linkedin--qa-participation-playbook) | 👤 | 1–2 h per week, ongoing | Free | AI engines quote community answers often. |
| 11 | [Guest articles and podcasts](#9-guest-article--podcast-pitches) | 👤 | 2–3 h per pitch | Free | Earned mentions on industry sites carry the most authority. |
| 12 | [Monthly AI visibility check](#11-monthly-ai-visibility-check) | 👤 | 45 min per month | Free. **💲 Otterly AI (optional) is about $29/mo** | Shows whether any of the above is working. |

**Never pay for:** "guaranteed AI ranking", link packages, "directory blasts" to hundreds of sites, paid reviews, or "featured expert" badges you didn't apply for. See [the warning in section 7](#7d-what-to-avoid-paid-link-schemes).

---

## 1. Google Search Console

**Recommendation: use a Domain property, verified with a DNS TXT record in Cloudflare.** It needs no code change or redeploy. It also covers every version of the site in one property (`https://`, `http://`, `www.` and any subdomain), which matters because `www.bushmanqc.com` has had problems before (see `README-SEO.md`).

### 1a. Domain property via Cloudflare DNS (recommended), about 15 minutes

👤 **Nellie (in Search Console)**
1. Go to <https://search.google.com/search-console> and sign in with the Google account BushmanQC will use long term. Use an account the business controls, not the developer's.
2. Click the property drop-down (top left), then **+ Add property**.
3. In the **Domain** box (left side), type `bushmanqc.com`. Don't type `https://` or `www`. Click **Continue**.
4. Google shows a **Verify domain ownership via DNS record** dialog.
   - If **Cloudflare** appears in the provider list with a **Start verification** button, use it. You'll sign in to Cloudflare, approve, and verification should happen immediately.
   - Otherwise choose **Any DNS provider**, make sure the record type is **TXT**, and **Copy** the value. It looks like `google-site-verification=AbC123...`. Send it to the developer, or do step 5 yourself.
   - Leave this tab open.

🛠 **Developer (in Cloudflare)**

5. Log in at <https://dash.cloudflare.com>, select **bushmanqc.com**, then go to **DNS → Records → Add record**.
   - **Type:** `TXT`
   - **Name:** `@` (this means the root domain)
   - **Content:** paste the full `google-site-verification=...` value, with no quotes and no spaces
   - **TTL:** Auto
   - Click **Save**.

👤 **Nellie**

6. Back in Search Console, click **Verify**. If it fails, wait an hour and try again. Google says DNS changes can take up to 2–3 days to show up. You can check progress with the TXT tab of Google's Admin Toolbox Dig tool (<https://toolbox.googleapps.com/apps/dig/#TXT/bushmanqc.com>).
7. **Never delete that TXT record.** Search Console re-checks it periodically, and you lose access if it's gone.

### 1b. Alternative: URL-prefix property with the HTML tag (needs a code change)

Only use this if DNS access isn't possible. The site already has a placeholder for it.

1. Under **Add property**, choose **URL prefix** and enter `https://bushmanqc.com/`.
2. Choose **HTML tag** and copy only the `content="..."` value.
3. 🛠 In every HTML file under `BushmanQC/`, replace `REPLACE_WITH_GSC_TOKEN` in `<meta name="google-site-verification" content="REPLACE_WITH_GSC_TOKEN">` with the real token, then deploy. Google only requires it on the homepage, inside `<head>`, within the first 2 MB.
4. Check that the tag appears in the live page source, then click **Verify**.
5. Downsides: this property covers only `https://bushmanqc.com/`, and the tag must never be removed.

> 🛠 **Developer note:** if you use the DNS method (1a), the `REPLACE_WITH_GSC_TOKEN` placeholder becomes unnecessary. It's harmless, so leave it until a later code pass, then remove it or fill it in.

### 1c. After verification (about 10 minutes)

1. Left menu, **Indexing → Sitemaps**: enter `https://bushmanqc.com/sitemap.xml`, then **Submit**. The status should say *Success* within a day or two.
2. **URL inspection** (search bar at the top): paste each URL below, then click **Request indexing**. There's a small daily quota, so spread these over 2–3 days.
   - `https://bushmanqc.com/`
   - `https://bushmanqc.com/services`
   - `https://bushmanqc.com/faq`
   - `https://bushmanqc.com/resources`
   - each `/resources/...` guide, as listed in the sitemap
3. **Settings → Users and permissions**: add the developer as a **Full** user, not Owner.
4. After 2–3 weeks, check **Performance** (the searches you show up for) and **Indexing → Pages** (anything blocked or not indexed).

---

## 2. Bing Webmaster Tools

Bing's index powers Microsoft Copilot and Bing's AI answers, and it's widely reported to feed ChatGPT's search results. Do this right after Search Console.

### 2a. Import from Google Search Console (about 5 minutes)

1. Go to <https://www.bing.com/webmasters> and sign in. Microsoft, Google and Facebook accounts all work. Using the same Google account as Search Console makes the next step easiest.
2. On the welcome screen (or **My Sites**), choose **Import** under *Import your sites from GSC*.
3. Click **Continue** and sign in with the Google account that owns the Search Console property. Click **Allow** so Bing can read your verified sites and sitemaps.
4. Tick **bushmanqc.com**, then click **Import**. The site is verified automatically and your sitemap comes along.
5. **Keep that Google connection in place.** Bing re-checks ownership through it. If you revoke access later, you'll have to verify again.
6. Traffic data can take up to 48 hours to appear.

**If the import doesn't work** (for example, it doesn't pick up a Domain property): choose **Add your site manually**, enter `https://bushmanqc.com/`, and use either:
- **CNAME (DNS):** 🛠 add the CNAME record Bing shows in Cloudflare (**DNS → Records → Add record → CNAME**, set **Proxy status** to *DNS only*). No code change needed. Or:
- **Meta tag:** 🛠 replace `REPLACE_WITH_BING_TOKEN` in `<meta name="msvalidate.01" ...>` on every page, then deploy.

Then **Sitemaps → Submit sitemap**: `https://bushmanqc.com/sitemap.xml`.

### 2b. AI Performance report: see when Copilot cites you

- **What it is:** Microsoft launched **AI Performance** in Bing Webmaster Tools as a public preview on **10 February 2026**. It shows how often your pages are cited as sources in **Microsoft Copilot, AI summaries in Bing, and some partner integrations**.
- **Where:** after verification, open **AI Performance** in the left menu (Microsoft's short link is aka.ms/BWTAIpref).
- **What you'll see:** *Total citations*, *Average cited pages* (unique pages cited per day), *Grounding queries* (sample phrases the AI used when it pulled your content), per-page citation counts, and a trend over time. It doesn't show clicks.
- **What to do monthly:** note which `/resources` guides get cited and which grounding queries appear. Write the next guide around grounding queries you *almost* win. Record the totals in the [monthly log](#11-monthly-ai-visibility-check).
- Third parties report that more dimensions were added after launch (intents, topics, citation share). I couldn't confirm the exact dates with Microsoft.

### 2c. IndexNow: tell Bing about new or updated pages immediately

IndexNow lets the site notify participating search engines when a page is added or changed. Current participants include Bing, Yandex, Seznam, Naver, Yep, the Internet Archive and Amazonbot. Google doesn't take part.

🛠 **Easiest option, no code (recommended):** in Cloudflare, select **bushmanqc.com → Caching → Configuration → Crawler Hints → On**. Crawler Hints uses Cloudflare's cache signals to send IndexNow notices automatically. It's included on the Free plan.

🛠 **Manual alternative (optional, needs a code change):** generate a key at <https://www.bing.com/indexnow/getstarted>, save it as a UTF-8 `.txt` file named after the key at the site root (for example `https://bushmanqc.com/<key>.txt`), and POST new URLs to `https://api.indexnow.org/indexnow` after each deploy.

To check it's working, open **URL Submission / IndexNow** in Bing Webmaster Tools a week later and confirm URLs are arriving.

---

## 3. Brave Search

**Why:** Anthropic's subprocessor list names **Brave Search** as a web-search provider for Claude. A second provider, TurboPuffer, also appears. If Brave hasn't indexed a page, Claude's web search is unlikely to find it.

**How Brave finds pages:** Brave runs its own crawler and index. The crawler doesn't use a distinct user-agent and follows the same limits as Googlebot: if Googlebot is blocked, Brave is too. It also finds pages through the opt-in **Web Discovery Project** in the Brave browser. **Brave has no webmaster console and no sitemap upload.** Pages get found through crawling, links from other sites and Brave users visiting. That's another reason the off-site listings below matter.

👤 **Steps (about 5 minutes)**
1. Go to <https://search.brave.com/submit-url>.
2. Submit `https://bushmanqc.com/`, then `https://bushmanqc.com/services`, `https://bushmanqc.com/resources` and `https://bushmanqc.com/faq`. Brave uses the same form to re-crawl a page, for example after a big update.
3. After 2–3 weeks, search Brave for `site:bushmanqc.com` and for `BushmanQC`. If nothing shows, submit again. Brave gives no indexing timeline.
4. To see Brave traffic, look for `search.brave.com` as a referrer in your analytics.

> Not verified: I couldn't read the form's fields (the page needs JavaScript) or find any stated submission limit. Brave's help page links to the form for re-crawl requests, and moderators on Brave's community forum point site owners to it for indexing too.

---

## 4. Google Business Profile (read the eligibility warning first)

> ⚠️ **Eligibility warning. Decide before you create anything.** Google's help pages currently say: *"Only businesses that make face-to-face contact with customers are eligible for a Business Profile"* and *"Business Profiles aren't for online-only businesses."* A service-area business must also have a real base location staffed during its listed hours, and its service area should be within roughly **2 hours' drive** of that base, with a **maximum of 20 service areas**. It can't be "the whole United States."
>
> - **Create a profile only if** Nellie really does meet clients face to face. For example: on-site gap assessments, supplier audits, or in-person training at client facilities within driving distance of her base. `[FILL IN: Do you ever work on-site with clients? Where is your base city/region?]`
> - **If BushmanQC is 100% remote, skip this section.** A profile that breaks the rules can be suspended, which removes its reviews. Put the time into sections 5–7 instead. Clutch and LinkedIn reviews (section 10) do the same trust-building job.

### 4a. Setup as a service-area business (only if eligible), about 30 minutes plus verification

1. Go to <https://business.google.com/create> and sign in with the business Google account.
2. **Business name:** `BushmanQC`. Use the real-world name only. Google doesn't allow extra keywords in the name.
3. **Business category:** start typing and pick from the drop-down. These categories appear on a current (May 2026) third-party copy of Google's category list. Google doesn't publish an official list, so confirm the exact wording in the drop-down:
   - **Primary:** `Consultant`, or `Business management consultant`
   - **Additional (up to 9 more allowed):** `Business management consultant` / `Consultant` (whichever isn't primary), `Engineering consultant`, `Industrial consultant`, `Health consultant`
   - There is **no** "Quality assurance consultant", "Regulatory consultant" or "Medical device consultant" category. Avoid `Medical equipment supplier`, `Medical equipment manufacturer` and `Certification agency`, because they describe a different kind of business.
4. **"Do you want to add a location customers can visit?"** Choose **No**. This makes it a service-area business and hides the address.
5. **Service areas:** add the cities or regions near your base where you really meet clients (up to 20). `[FILL IN: service-area cities/regions]`
6. **Contact info:** phone `(408) 892-8242`, website `https://bushmanqc.com`.
7. **Verify:** Google chooses the method, often a short video of the business. Follow the on-screen steps. A private address is still needed for verification but stays hidden.
8. After verification, open **Edit profile** and fill in each section using the copy below.
   - **Hours:** `[FILL IN]`
   - **Opening date:** `[FILL IN: year founded]`
   - **Booking link:** `https://calendly.com/bushmanqc`
   - **Logo** and **cover photo:** add both.
   - To check the address stays hidden: **Edit profile → Location → Business location**, and make sure **Show business address to customers** is **Off**.

### 4b. Business description (limit: 750 characters, no links or URLs, no promotions or prices), 739 characters

```text
BushmanQC builds Virtual Quality Management Systems (VQMS) for small and startup medical device companies. Led by Nellie Bushman, Quality Expert & Founder, with 25+ years of quality management experience and 50+ QMS implementations, BushmanQC helps teams meet FDA 21 CFR 820 / QMSR (in effect since February 2, 2026), ISO 13485 and 21 CFR Part 11 without building a large in-house quality department. Services include Virtual QMS implementation using a structured 7-step process, document control management, training and employee qualification, supplier management, CAPA implementation, and quality system remediation, including gap assessments. BushmanQC works with clients virtually and on-site within its service area.
```

> The last sentence only applies if section 4's eligibility check is true. Remove it otherwise, and then don't publish a profile at all.

### 4c. Services list (Edit profile → Services → Add custom service)

Service names are kept under 120 characters and descriptions under 300. Third-party guides report those limits, so check the counter in the form.

| Service name | Description (paste) |
|---|---|
| Virtual QMS Implementation | `A complete, right-sized Virtual Quality Management System for a small or startup medical device company, built with a structured 7-step process to meet FDA QMSR (21 CFR 820), ISO 13485 and 21 CFR Part 11.` |
| Document Control Management | `Set-up and management of controlled documents and records, including approval, revision and distribution workflows that support 21 CFR 820 / QMSR, ISO 13485 and 21 CFR Part 11 electronic records.` |
| Training & Employee Qualification | `Training programs and qualification records so every employee's competence is documented and inspection-ready under FDA QMSR and ISO 13485.` |
| Supplier Management | `Supplier qualification, approved supplier lists and ongoing supplier monitoring for medical device companies, aligned with ISO 13485 and FDA QMSR.` |
| CAPA Implementation | `Corrective and preventive action (CAPA) processes, from investigation and root cause to effectiveness checks, built to satisfy FDA and ISO 13485 auditors.` |
| Quality System Remediation | `Gap assessments of an existing quality system against FDA QMSR, ISO 13485 and Part 11, followed by a prioritized remediation plan and hands-on fixes.` |

### 4d. Getting reviews on Google

1. In the profile dashboard (Search or Maps), find **Ask for reviews**. It may be labeled *Get more reviews* or *Share review form*. Click **Copy link** and save it in the email template in [section 10a](#10a-review-request-email-google--clutch).
2. Ask **every** client after a milestone, such as a QMS go-live or a passed audit. Don't pick only the happy ones (see the rules in 10a).
3. Reply to every review within a week, positive or negative, without revealing any client confidential information.

---

## 5. LinkedIn Company Page

There are three parts: **(a)** create the BushmanQC Page, **(b)** link it from Nellie's profile so her job shows the logo and links to the Page, and **(c)** optionally add a free **Service Page** to her profile.

### 5a. Create the Page (desktop or the iOS app; Android isn't supported), about 20 minutes

1. Sign in as Nellie at linkedin.com. Make sure `nellie@bushmanqc.com` is added and confirmed under **Settings → Sign in & security → Email addresses**, because LinkedIn may ask for a company-domain email.
2. Click **For Business** (top right), then **Create a Company Page**, then **Company**.
3. Fill in:
   - **Name:** `BushmanQC`
   - **LinkedIn public URL:** `linkedin.com/company/bushmanqc` (if it's taken, try `bushmanqc-vqms`)
   - **Website:** `https://bushmanqc.com`
   - **Industry:** pick from the drop-down. Try `Business Consulting and Services`, or a medical-device or quality option if the drop-down offers one.
   - **Organization size:** `0-1 employees`, or the smallest option
   - **Organization type:** `Self-Owned` or `Sole Proprietorship`, whichever the drop-down shows
   - **Logo:** use the square logo file from the site's `images/` folder
   - **Tagline:** use 5b
4. Tick the box confirming you can act on behalf of the company, then click **Create page** and **Start building your page**.
5. Go to **Edit page → Details / About** and add:
   - **Overview:** 5c
   - **Specialties:** 5d
   - **Phone:** `(408) 892-8242`
   - **Year founded:** `[FILL IN]`
   - **Location:** `[FILL IN: city, state, or leave blank if you prefer]`
   - **Custom button:** *Visit website* or *Contact us*, pointing to `https://calendly.com/bushmanqc`
6. Add a cover image, and share the Page's first post: link to the newest `/resources` guide.

### 5b. Tagline (limit: 120 characters), 105 characters

```text
Virtual QMS for medical device startups: FDA QMSR (21 CFR 820), ISO 13485 & Part 11 compliance, remotely
```

### 5c. Overview / About (limit: 2,000 characters), 1,323 characters

```text
BushmanQC (BushmanQC Virtual QMS) builds Virtual Quality Management Systems (VQMS) for small and startup medical device companies in the United States.

Founded and led by Nellie Bushman, Quality Expert & Founder, BushmanQC gives early-stage teams a right-sized, fully virtual QMS that meets FDA 21 CFR 820 / QMSR (in effect since February 2, 2026), ISO 13485 and 21 CFR Part 11, without hiring a full in-house quality department.

What we do:
• Virtual QMS Implementation (a structured 7-step process)
• Document Control Management
• Training & Employee Qualification
• Supplier Management
• CAPA Implementation
• Quality System Remediation, including gap assessments

Experience:
• 25+ years of quality management experience
• 50+ QMS implementations
• 100% audit pass rate
• Fully virtual, working with medical device teams across the US

Free guides at bushmanqc.com/resources: QMSR transition checklist, 21 CFR 820 vs ISO 13485, what a QMS costs, design controls for founders, your first FDA inspection, and Part 11 electronic signatures.

Book a free 30-minute consultation: https://calendly.com/bushmanqc
Email: nellie@bushmanqc.com · Phone: (408) 892-8242
```

### 5d. Specialties (LinkedIn allows up to 20; enter one at a time)

```text
Virtual QMS
Quality Management Systems
FDA 21 CFR 820
QMSR
ISO 13485
21 CFR Part 11
Medical Device Quality
Document Control
CAPA
Supplier Management
Training and Qualification
Gap Assessments
Quality System Remediation
Medical Device Startups
FDA Inspection Readiness
Design Controls
```

Delete any specialty you don't want to be hired for.

### 5e. Link the Page from Nellie's personal profile (about 10 minutes)

Profile: <https://www.linkedin.com/in/nellie-bushman-1986784>

1. Open your profile, click **Add profile section → Core → Add position**. If you already have an entry, edit it with the pencil icon.
2. **Title:** `Quality Expert & Founder`.
3. **Company or organization:** start typing `BushmanQC` and **select the Page from the drop-down**. That's what puts the logo on your profile and links it to the Page. If you type the name without selecting it, there's no link.
4. **Employment type:** Self-employed. **Location type:** Remote. **Start date:** `[FILL IN]`. Tick **I am currently working in this role**.
5. **Description:** paste the 300-character short description from [10b](#10b-master-nap--description-block-reuse-everywhere).
6. Check **Notify network** if you want an announcement post, then **Save**.
7. **Contact info** (pencil next to your name): add `https://bushmanqc.com` as a website (type *Company*).
8. **Featured** section: add links to `https://bushmanqc.com/resources` and the Calendly page.
9. **Headline** suggestion (220-character limit):
   `Quality Expert & Founder, BushmanQC | Virtual QMS for medical device startups | FDA QMSR (21 CFR 820), ISO 13485, Part 11`

### 5f. Optional: free LinkedIn Service Page on Nellie's profile

LinkedIn describes the Service Page as a free landing page for freelancers and small businesses. It lets you list up to 10 services, and Premium isn't required for the basic page.

1. On your profile, click **Open to → Providing services**. The menu label may vary.
2. Add these services: Virtual QMS Implementation, Document Control, Training & Qualification, Supplier Management, CAPA, Quality System Remediation.
3. **Description:** paste the 300-character short description. Third-party guides say the limit is about 500 characters; check the counter.
4. Choose **Remote** as the work location.
5. ⚠️ LinkedIn says you can't later switch whether services are managed from your profile or the Company Page, so choose carefully. **The profile is recommended,** since people hire Nellie personally.

---

## 6. QMS software vendor partner / consultant directories

Startups often pick an eQMS first and then ask "who can implement this for us?" Vendor partner directories answer that, and AI engines read them.

> **Before applying:** these programs often pay referral commissions (Qualio's page states 20%). If you accept one, tell clients in writing. Regulated buyers expect independent advice.

### 6a. Verified status (checked 2026-10-08)

| Vendor | Partner program for consultants? | Public directory? | How to apply | Cost |
|---|---|---|---|---|
| **Qualio** | ✅ Yes. The "Referral network" and "Solution network" are aimed at QA/RA consultants. 20% referral commission stated. | ✅ Yes, the **Qualio Partner Directory** at <https://www.qualio.com/our-partners> (about 37 listings: logo, name, short description; independent consultants included) | <https://www.qualio.com/partners>, then **Become a partner** / *Get in touch* | No fee stated |
| **Greenlight Guru** | ✅ Yes. The "Quality" track names QA/RA consultants. | ⚠️ The page shows partner logos and a search box, but I couldn't confirm a public consultant directory | <https://www.greenlight.guru/partner>, then **Become a Partner** (form further down the page) | No fee stated |
| **SimplerQMS** | ✅ Yes. Aimed at quality/regulatory consultants, auditors and validation experts. Free *Partner Collaboration License*; referral compensation optional and agreed individually. | ✅ Yes, a partner directory at <https://simplerqms.com/partners/> (only 2 partners listed when checked, so it's an early-mover opportunity) | <https://simplerqms.com/partner-program/>, then the **Explore a Partnership** form (first name, last name, email, phone, company; request a 30-minute call). Questions: info@simplerqms.com | Free to apply; license free |
| **Matrix Req** (formerly Matrix Requirements; now the Matrix One brand) | ✅ Yes. Referral, co-marketing, solution and integration partners, including "consultancy and advisory firms". | ⚠️ A "Collaborators" section shows 9 partner profiles, but there's no searchable directory | <https://matrixone.health/partners> (old matrixreq.com/partners redirects there). Click **Sign up**; the form asks for name, business email, phone, country and company size. Reply promised within 48 h. | No fee stated |
| **Ketryx** | ⚠️ Referral partnerships aimed at cybersecurity, DevOps, software and compliance/risk advisory firms | ❌ No public directory found | <https://www.ketryx.com/partnerships>: book a discovery call | Not stated. **Low fit**, since Ketryx focuses on software and AI development lifecycle tooling. Skip unless a client uses it. |
| **OpenRegulatory** | Not a vendor partner program, but it runs a **free public directory of medical device regulatory consultants**, searchable by country and specialty (FDA, EU MDR and others). It also has a program for consultants using its *Formwork* eQMS. | ✅ Yes: <https://openregulatory.com/regulatory-consultants> | Directory page, then **"Are you a consultant?" → Add your listing**. Submissions are reviewed before publishing. | ⚠️ I couldn't confirm whether it's free (the site blocked automated reading). Check before submitting. |

**Order to apply:** SimplerQMS (directory is nearly empty) → Qualio (directory is live) → OpenRegulatory (see 7a) → Greenlight Guru → Matrix Req.

### 6b. Partner-application blurb (about 120 words, paste into "Tell us about your company" or similar)

```text
BushmanQC is a fully virtual quality consultancy led by Nellie Bushman, Quality Expert & Founder, with 25+ years of quality management experience and 50+ QMS implementations. We build Virtual Quality Management Systems for small and startup US medical device companies to meet FDA QMSR / 21 CFR 820, ISO 13485 and 21 CFR Part 11, and we provide document control, training and employee qualification, supplier management, CAPA and quality system remediation (gap assessments). Many of our clients are choosing their first eQMS. We'd like to [FILL IN: refer / implement / configure] [PLATFORM NAME] where it's the right fit, and to be listed in your partner directory so startups can find experienced implementation help. [FILL IN: clients you have already set up on this platform, if any.]
```

**Directory listing short version** (for directories that ask for a one-liner), 147 characters:

```text
Virtual QMS for small and startup US medical device companies: FDA QMSR (21 CFR 820), ISO 13485 and Part 11, built and run by Nellie Bushman.
```

---

## 7. B2B / industry directories

Use the [10b master block](#10b-master-nap--description-block-reuse-everywhere) for every field. Keep a list of each listing's URL so the developer can add them to the site's schema (see 7e).

### 7a. Verified directories (checked 2026-10-08)

| Directory | Fit | Cost | How to list | Notes |
|---|---|---|---|---|
| **OpenRegulatory consultant directory** | ⭐ High. A medical-device-specific directory with a US list. | Not confirmed (see 6a) | <https://openregulatory.com/regulatory-consultants>, then **Add your listing** | Listings show type (individual/company), country and specialties. Choose **FDA** and anything else that applies. Reviewed before going live. |
| **Clutch** | Medium. Has *Compliance Consulting* and *Healthcare consulting* categories but no device-specific one. | **Basic profile free.** 💲 *Verified* and *Advertiser* tiers are paid (prices not published) | <https://clutch.co/get-listed>: sign in with LinkedIn, Google or company email, then fill in company name, tagline, employees (1), minimum project size, hourly rate, website, location, contact, overview and service focus. The profile is reviewed before publishing. | Reviews are collected and checked by Clutch, sometimes through an analyst interview with your client. Submit 2–3 client references as soon as the profile is live. Ignore sales calls for paid tiers. |
| **Crunchbase** | Medium. An entity source that AI engines often cite for "what is X". | Free account can create a profile | Sign up at crunchbase.com and connect Google or LinkedIn (needed before you can add profiles). Search "BushmanQC" first, then go to **Resources → Create Profile → Organization**. | Fill in logo, founded date `[FILL IN]`, website, LinkedIn, short and long description, HQ `[FILL IN]`, 3–5 industries (Medical Device, Consulting, Compliance, Quality Assurance), and founder (Nellie Bushman). New accounts may be reviewed manually. |
| **BBB (Better Business Bureau)** | Low–medium. US trust signal. | **Free listing.** 💲 **Accreditation is paid** (fees set by each local BBB; third parties estimate a few hundred dollars and up per year). Not needed. | <https://www.bbb.org/get-listed>: search for your business, then **Add it now** | A free listing gives you a profile but no website link or badge. Paid accreditation adds both. Optional, so it's last in the queue. |
| **Advisera ISO Consultant Directory** | Medium. Filterable by standard (ISO 13485) and location. | ⚠️ Not confirmed | <https://advisera.com/consultants/>, then **Join the Consultant Directory** | Listings show name, title, company, short bio, languages, standards and location. Check for fees before signing up. |
| **RAPS** (Regulatory Affairs Professionals Society) | High credibility | 💲 **PAID: membership.** The 2025 application form lists $245/year for an individual (2-year: $465). I couldn't confirm 2026 dues. | <https://www.raps.org/join-raps> | The member directory is for **networking only**. Members agree not to use it for marketing, so it's not a lead-generation listing. Membership is worth it mainly for credibility, the RAPS community and the chance to publish in its journal (see 9). |
| **Expertise.com** | Low | n/a | No open submission. Its editors pick businesses. | If you get an unsolicited "you've been selected, pay for a badge" email, don't pay. |

**Not recommended right now:** generic "submit to 200 directories" services, and paid "Top 10 consultants" lists.

### 7b. Field cheat-sheet for these directories

| Field | Value |
|---|---|
| Company name | `BushmanQC` (aka `BushmanQC Virtual QMS`) |
| Website | `https://bushmanqc.com` |
| Email | `nellie@bushmanqc.com` |
| Phone | `(408) 892-8242` |
| Founder / key person | Nellie Bushman, Quality Expert & Founder |
| Employees | 1 |
| Location / HQ | `[FILL IN: city, state]` (or "United States, remote" where allowed) |
| Founded | `[FILL IN: year]` |
| Service area | United States (remote) |
| Booking | `https://calendly.com/bushmanqc` |
| LinkedIn | Company Page URL from section 5, plus <https://www.linkedin.com/in/nellie-bushman-1986784> |
| Hourly rate / min. project | `[FILL IN]` (Clutch requires these; pick a range you're comfortable showing) |
| Certifications | `[FILL IN: e.g., ASQ, RAC, lead auditor — only if you hold them]` |

### 7c. Keyword tags to choose when a directory offers them

Medical devices · Quality management system (QMS) · ISO 13485 · FDA 21 CFR 820 / QMSR · 21 CFR Part 11 · CAPA · Document control · Supplier management · Gap assessment · Compliance consulting · Startups

### 7d. What to avoid: paid link schemes

⚠️ **Don't buy links, "guest post packages", "DA 50+ backlinks", private blog network placements, mass directory submissions, paid reviews, or "AI ranking guarantees."** Google's spam policies treat buying or selling links to manipulate rankings as link spam, and sites can lose rankings for it. Since 21 October 2024 the FTC's Consumer Reviews and Testimonials Rule (16 CFR Part 465) also lets regulators seek civil penalties for fake or bought reviews. A real directory you can see buyers using, like the ones in 7a, is fine. Anything priced by "number of links" is not.

### 7e. 🛠 Developer follow-up (later, after listings exist; not part of this task)

Add each live profile URL (LinkedIn Company Page, Crunchbase, Clutch, partner-directory pages and so on) to the `sameAs` array of the `Organization` / `ProfessionalService` schema in `index.html`. Today it only lists Nellie's personal LinkedIn. This helps search and AI engines connect the listings to the website.

---

## 8. Reddit, LinkedIn & Q&A participation playbook

AI answers often quote community threads. The aim is to be **the most useful person in the thread**, not to advertise.

### 8a. Communities

| Community | Status (third-party data, Oct 2026) | Fit |
|---|---|---|
| **r/MedicalDevices** | Exists, about 27k members. Describes itself as "Reddit's news and discussion community for medical device professionals." | ⭐ Best fit |
| **r/regulatoryaffairs** | Exists, about 16k members. For discussing the regulation of medical products (devices, drugs, biologics), US FDA and international. | ⭐ Good fit |
| **r/FDA** | Exists, about 12k members (third-party count) | Occasional |
| **r/QualityAssurance** | Exists, but it's **mostly software QA/testing**. Link posts are disabled and low-effort articles are removed as spam. | ⚠️ Low fit. Join only threads about regulated or device QA. |
| **r/ISO13485** | Exists but tiny (around 100 members) | Low reach. Fine to answer the occasional question. |
| **r/startups**, **r/biotech** | Large general communities. Medtech founders sometimes ask QMS questions there. | Search before posting |

> **Not verified:** Reddit blocks automated access, so I couldn't read each subreddit's own rules. **Before your first post in any subreddit, read its sidebar *Rules* and any pinned posts.** If self-promotion rules are unclear, message the moderators.

**LinkedIn equivalents:** comment on posts by FDA/QMSR commentators and eQMS vendors, especially their QMSR content. Answer questions in medtech LinkedIn groups you're a member of. Repost each new `/resources` guide from the Company Page with a 3-line summary.

### 8b. Rules of thumb

1. **About 9 helpful contributions for every 1 that mentions BushmanQC.** Many professional subreddits are stricter than that.
2. **Answer the question fully in the post itself.** A link should be optional extra reading, never the answer.
3. **Link a `/resources` guide only when it directly answers the question,** and at most once per thread.
4. **Always disclose:** "(Disclosure: I run BushmanQC, a QMS consultancy.)" Reddit moderators look at post history. Undisclosed self-promotion gets accounts banned, and the FTC rule above covers undisclosed connections in reviews and testimonials too.
5. **Never ask for DMs or offer a "free consult" in a thread.** If someone asks how to hire you, reply privately.
6. **Never discuss client details.** Use hypotheticals.
7. **Post under one account, using your real name or one clearly tied to BushmanQC.** Don't post from multiple accounts.
8. **Don't paste the same answer into multiple subreddits.** Reddit treats that as spam.
9. **Keep claims accurate.** Cite the regulation (for example 21 CFR 820, ISO 13485 clause numbers) and tell people to check the current FDA text.

### 8c. Three example answers (edit them into your own voice before posting)

**Example 1. Question: "QMSR is in effect now. Do we have to rebuild our ISO 13485 QMS from scratch?"** *(links a guide because it genuinely answers the question)*

```text
Short answer: no, but you do need to do a deliberate gap check rather than assume you're covered.

Since Feb 2, 2026, FDA's Quality Management System Regulation (QMSR) incorporates ISO 13485:2016 by reference, so if you already run a genuine 13485 system you're starting from the right place. Where small companies usually get caught:

1. FDA-specific requirements that sit outside 13485 still apply. QMSR keeps US-specific pieces (for example around complaint/servicing records, labeling and packaging controls, UDI), and it still points to related regs like MDR reporting (Part 803) and corrections/removals (Part 806).
2. Terminology. FDA no longer names the DHF/DMR/DHR the way the old QS reg did, but the content still has to exist in your Medical Device File and records. Make sure your procedures map cleanly.
3. Records FDA can now see. Under the old rule, management review, internal audit and supplier audit reports had an inspection carve-out. That carve-out is gone, so write those records assuming an investigator will read them.
4. Inspection approach. FDA has moved away from QSIT, so mock-inspect against the new approach, not an old checklist.

Practical next step: do a clause-by-clause crosswalk of your procedures against the QMSR text and 13485, list the gaps, and fix the high-risk ones (CAPA, complaints, design controls, supplier controls) first.

I wrote up a checklist version of this here if it's useful: https://bushmanqc.com/resources/qmsr-transition-checklist

(Disclosure: I run BushmanQC, a QMS consultancy. Always confirm against the current FDA text.)
```

**Example 2. Question: "Can we just use DocuSign / Google Docs approvals for design review sign-offs, or does Part 11 rule that out?"** *(links a guide because it genuinely answers the question)*

```text
You can use an off-the-shelf e-signature tool, but "it has a signature button" isn't the same as Part 11 compliant. What FDA expects for electronic signatures on records you're required to keep (21 CFR Part 11) includes:

- Each signature is unique to one person and never shared or reassigned.
- The signed record shows the signer's printed name, the date/time, and the meaning of the signature (e.g., "approved," "reviewed").
- The signature is linked to the record so it can't be copied or moved onto a different document.
- Non-biometric signatures use at least two components (e.g., user ID + password), with controls around how they're issued and changed.
- Your organization sends FDA a one-time certification letter stating that your electronic signatures are the legally binding equivalent of handwritten ones (11.100(c)). Startups often miss this one.
- The system is validated for its intended use, with audit trails and access controls documented.

Google Docs comment-approvals generally won't get you there on their own. Some e-signature platforms offer a "Part 11 module" that can, if you configure and validate it and write a procedure around it.

Longer walkthrough with a startup checklist: https://bushmanqc.com/resources/21-cfr-part-11-electronic-signatures-startup

(Disclosure: I run BushmanQC, a QMS consultancy.)
```

**Example 3. Question: "Seed-stage, 5 people, Class II device. Hire a full-time QA person or use a consultant?"** *(no link, because no guide answers this exact question and a link would just be promotion)*

```text
Depends less on headcount and more on where you are in design controls.

- Pre-design-freeze, no manufacturing yet: a full-time quality hire is often underused. A part-time or fractional quality lead plus an engineer who owns design control documentation day-to-day usually covers it. The non-negotiable is that someone with real authority owns the QMS. Investors and FDA both look for that.
- Heading into verification/validation, supplier selection, or a submission: workload jumps (CAPA, supplier controls, risk management, DHF/Medical Device File). This is usually when a dedicated QA/RA hire pays for itself.
- Either way, don't outsource ownership. Whoever helps you should build procedures your team can actually run, and train you on them, not a binder only they understand.

Questions to ask any candidate or consultant: How many ISO 13485 / FDA systems have you built from scratch at this stage? Who will own each process after you're gone? How do you size the system so it isn't overbuilt for 5 people?

(Disclosure: I'm a QMS consultant, so weigh my bias accordingly.)
```

> Check before posting: the regulatory points above are general. Nellie should edit or confirm them against current FDA text, since it's her name on the post.

---

## 9. Guest article & podcast pitches

### 9a. Verified outlets (checked 2026-10-08)

| # | Outlet | Type | How to pitch | Key rules |
|---|---|---|---|---|
| 1 | **MedTech Intelligence** | Trade publication | <https://medtechintelligence.com/editorial-submissions/>. Check topic fit first with rwest@innovativepublishing.net, then upload a Word file through the form. | Features 1,200–2,000 words; columns 600–1,200. **No promotion**: product and company names are removed in editing. Must be original. Review takes 2–3 weeks; publication up to a month. Topics include regulatory & quality. |
| 2 | **Medical Design & Outsourcing (MDO)** | Trade publication | Pitch the managing editor (Jim Hammerand, per the contributor-guidelines page) with: summary, practical tips, outline, headline/subhead ideas, visual-aid ideas and a bio of 2 sentences or fewer | 700–800 words, "how-to" style. **Exclusive** to MDO, so you can't republish it on bushmanqc.com. **AI-generated text is rejected.** Free. Headshot and an image required. (Guidelines page dated March 2022.) |
| 3 | **Med Device Online** | Trade publication | Email info@meddeviceonline.com, subject **"Proposed Guest Expert Article"**, with an abstract or outline | 1,000–2,000 words; exclusive. ⚠️ **Doesn't accept content from vendors, suppliers or outsourcing partners**, and authors can't be in marketing roles. A consultant may count as a vendor, so **ask the editor first**. |
| 4 | **RAPS Journal of Regulatory Affairs** (successor to RF Quarterly) | Peer-reviewed journal | Proposal to the RAPS content editor (details at <https://www.raps.org/news-insights/for-authors.html>): headline ≤70 characters, author details, 75–80-word abstract, 3–5 keywords | 💲 **Content is exclusive to members**, so membership is effectively required. 3,200–7,000 words, double-blind peer review, **no AI-generated text**, no promotion of your own services. High authority, high effort. |
| 5 | **Medical Compliance With Clarissa** (Intertek) | Podcast | Guest-request form: <https://www.intertek.com/medical/resources/compliance-with-clarissa-guest-request/> | Wants guests from device product compliance or regulatory, or with an interesting compliance angle. Not everyone gets scheduled. |
| 6 | **The State of Medtech** | Podcast / community | Guest form: <https://tally.so/r/wdxljK> (category, bio, professional profile, headshot, episode idea) | Focus is medtech marketing, sales and business. Pitch angle: "Your QMS is a fundraising and acquisition asset." |
| 7 | **Global Medical Device Podcast** (Greenlight Guru) | Podcast | No guest form found. Use Greenlight Guru's contact page or podcast@greenlight.guru (that address appears in show notes for listener ideas). | Active (episodes listed Sept 2026). Pairs naturally with a Greenlight Guru partner application (section 6). |
| 8 | **Let's Talk Risk!** (Dr. Naveen Agarwal) | Weekly LinkedIn Live audio | Message the host on LinkedIn | Not a podcast: a live, informal conversation about risk management. Good fit for CAPA, risk and QMSR topics. |

**Rules that apply everywhere:** educational, not promotional. Write it yourself; several outlets reject AI-written text. Don't reuse your own `/resources` article word-for-word, since most want exclusive content. Do link to your site from the author bio.

### 9b. Pitch email template (articles)

```text
Subject: Article pitch: [WORKING HEADLINE, e.g., "QMSR is in force: the 5 gaps we keep finding at medical device startups"]

Hi [EDITOR FIRST NAME],

I'm Nellie Bushman, founder of BushmanQC, a consultancy that builds virtual quality management systems for small and startup US medical device companies. I'd like to propose an original, exclusive [feature / column] for [PUBLICATION] readers.

Working headline: [HEADLINE]
Sub-headline: [ONE LINE]

Why now: [e.g., FDA's QMSR took effect Feb 2, 2026, and small manufacturers are now being inspected against it.]

What readers will take away (practical, non-promotional):
1. [Takeaway / section 1]
2. [Takeaway / section 2]
3. [Takeaway / section 3]
4. [Optional takeaway 4]

Length: [match the outlet's guidelines] words. Visuals: [e.g., a one-page crosswalk table].

About me: Nellie Bushman is Quality Expert & Founder of BushmanQC, with 25+ years of quality management experience and 50+ QMS implementations for medical device companies.

I've read your contributor guidelines, and the piece will be original, exclusive to [PUBLICATION], and free of product promotion. Happy to adjust the angle to fit your editorial calendar.

Thank you,
Nellie Bushman
Quality Expert & Founder, BushmanQC
https://bushmanqc.com · nellie@bushmanqc.com · (408) 892-8242
```

### 9c. Pitch template (podcasts and LinkedIn Live)

```text
Subject: Guest idea for [SHOW]: [TOPIC, e.g., "Building a QMS a 5-person medtech startup will actually use"]

Hi [HOST FIRST NAME],

I've enjoyed [SPECIFIC EPISODE — mention it genuinely]. I'm Nellie Bushman, founder of BushmanQC; I build virtual quality management systems for small and startup US medical device companies (25+ years in quality management, 50+ QMS implementations).

Three angles I could cover for your listeners:
1. [e.g., What actually changed for startups now that QMSR is in force]
2. [e.g., Right-sizing CAPA and document control for a team of five]
3. [e.g., What investors and acquirers look for in a startup's QMS]

I'll keep it practical and vendor-neutral. Happy to send a short outline or adapt to your format.

Nellie Bushman · https://bushmanqc.com · https://www.linkedin.com/in/nellie-bushman-1986784
```

---

## 10. Reviews + the master NAP/description block

### 10a. Review request email (Google + Clutch)

**Rules:**
- **Ask every client**, not only the happy ones. Asking selectively ("review gating") breaks Google's policy.
- **No incentives** of any kind: no discounts and no gifts. Never write or edit a review for a client.
- Your own family or friends shouldn't review you.
- Medical device clients often have confidentiality obligations. Tell them they can describe the work in general terms without naming the device.

Breaking these rules can get your reviews removed or your profile restricted, and the FTC can seek penalties for fake or bought reviews.

**Setup:**
1. Google link: Business Profile → **Ask for reviews** → **Copy link** (only if you have a profile).
2. Clutch link: after your Clutch profile is published, use the review-request link in your Clutch dashboard, or list the client as a reference so Clutch contacts them.

**When to send:** at a natural success point, such as QMS go-live, a passed audit or inspection, or a closed remediation project.

```text
Subject: A quick favor? (2 minutes)

Hi [CLIENT FIRST NAME],

Thank you again for the work on [PROJECT, e.g., your ISO 13485 QMS implementation]. It was a pleasure helping [COMPANY / "your team"] get there.

BushmanQC is a small, one-person consultancy, so honest reviews from clients are the main way other medical device founders find me. If you're willing, would you share a few sentences about your experience, good or bad?

• Google: [GOOGLE REVIEW LINK]
• Clutch: [CLUTCH REVIEW LINK] (Clutch verifies reviews, so they may contact you briefly)

Either one is a huge help; both is wonderful. Please keep it general. There's no need to mention your device or anything confidential.

Thank you,
Nellie

Nellie Bushman | Quality Expert & Founder, BushmanQC
https://bushmanqc.com · (408) 892-8242
```

If you don't have a Google profile, delete the Google line. A **LinkedIn recommendation** (Nellie's profile → **Recommendations → Ask for a recommendation**) makes a good third option.

**Follow-up** (once, 7 days later, then stop):

```text
Hi [NAME], just floating this back up in case it got buried. If now's not a good time, no worries at all. [LINK] Thanks! — Nellie
```

### 10b. Master NAP + description block (reuse everywhere)

Copy these exactly. Consistency across sites is what lets search engines and AI connect the listings to one business.

| Field | Value |
|---|---|
| **Name** | BushmanQC |
| **Also known as** | BushmanQC Virtual QMS |
| **Website** | https://bushmanqc.com |
| **Phone** | (408) 892-8242 |
| **Email** | nellie@bushmanqc.com |
| **Founder** | Nellie Bushman, Quality Expert & Founder |
| **Booking** | https://calendly.com/bushmanqc (free 30-minute consultation) |
| **Address** | `[FILL IN: city, state]`. Remote business, so don't publish a street address. |
| **Service area** | United States (fully virtual) |
| **Founded** | `[FILL IN: year]` |

**One-liner (limit: 160 characters), 148 characters**

```text
BushmanQC builds virtual quality management systems for small and startup US medical device companies: FDA QMSR (21 CFR 820), ISO 13485 and Part 11.
```

**Short description (limit: 300 characters), 286 characters**

```text
BushmanQC (BushmanQC Virtual QMS) is a fully virtual consultancy led by Nellie Bushman, Quality Expert & Founder. It builds right-sized Virtual Quality Management Systems for small and startup US medical device companies to meet FDA QMSR (21 CFR 820), ISO 13485 and 21 CFR Part 11.
```

**Long description (limit: 750 characters), 733 characters.** Contains no URLs, so it's also safe for Google Business Profile with one edit (see note).

```text
BushmanQC (BushmanQC Virtual QMS) builds Virtual Quality Management Systems (VQMS) for small and startup medical device companies across the United States. Founder Nellie Bushman, Quality Expert & Founder, brings 25+ years of quality management experience and 50+ QMS implementations. BushmanQC helps teams meet FDA 21 CFR 820 / QMSR (in effect since February 2, 2026), ISO 13485 and 21 CFR Part 11 without building a large in-house quality department. Services: Virtual QMS implementation using a structured 7-step process, document control management, training and employee qualification, supplier management, CAPA implementation, and quality system remediation, including gap assessments. Fully virtual. Free 30-minute consultation.
```

> For Google Business Profile, use the 4b version instead. It drops "Free 30-minute consultation", which counts as a promotion there, and "Fully virtual", which conflicts with Google's eligibility rules.
>
> About "100% audit pass rate": it's on the website and in the LinkedIn overview. It's left out of the short blocks because third-party sites and editors often ask for proof of absolute claims. Use it only where you're comfortable backing it up.

---

## 11. Monthly AI visibility check

**When:** the first business day of each month, about 45 minutes.

**How:**
- Use a **new chat** each time, in a **private/incognito window, logged out where possible** (or with memory/personalization turned off).
- Turn on **web search** where it's a toggle: ChatGPT *Search*, Claude *Web search*. Perplexity, Copilot and Gemini search by default.
- Ask each of the 12 prompts **exactly as written**, in all five engines:
  - ChatGPT: chatgpt.com
  - Claude: claude.ai
  - Perplexity: perplexity.ai
  - Gemini: gemini.google.com
  - Copilot: copilot.microsoft.com
- If time is short, run prompts 1, 2, 5, 10 and 11 in every engine each month, and the full set every quarter.

### 11a. The 12 fixed buyer prompts

| # | Prompt (paste exactly) | What it tests |
|---|---|---|
| 1 | `Who are the best virtual QMS consultants for medical device startups in the US?` | Category recommendation |
| 2 | `I'm founding a Class II medical device startup. Who can help me set up a quality management system that meets FDA QMSR and ISO 13485?` | Founder-intent recommendation |
| 3 | `Recommend a consultant who can build an ISO 13485 quality management system remotely for a small medical device company.` | Remote / ISO angle |
| 4 | `What is a virtual quality management system (VQMS) for medical devices, and which consultants provide one?` | Definition + provider |
| 5 | `Who can do a QMSR gap assessment for a small medical device company?` | Remediation service |
| 6 | `Which consultants help medical device startups with 21 CFR Part 11 electronic signatures and document control?` | Part 11 / document control |
| 7 | `How much does it cost to implement a QMS at a medical device startup, and which consultants specialize in startups?` | Cost guide + recommendation |
| 8 | `Who can help a medical device startup prepare for its first FDA inspection?` | Inspection guide + recommendation |
| 9 | `I need outsourced CAPA and supplier management help for a small medical device company. Who should I contact?` | CAPA / supplier services |
| 10 | `What is BushmanQC?` | Brand / entity accuracy |
| 11 | `Who is Nellie Bushman?` | Founder / entity accuracy |
| 12 | `Is BushmanQC a good choice for setting up a QMS for a medical device startup? What are the alternatives?` | Reputation + competitors |

### 11b. Log template (copy into a Google Sheet; one row per prompt per engine)

| Date | Engine | Prompt # | BushmanQC mentioned? (Y/N) | Position (1st / listed / not listed) | bushmanqc.com cited? (URL) | Other sources cited (e.g., LinkedIn, Qualio directory) | Facts correct? (Y/N + what's wrong) | Competitors named | Action |
|---|---|---|---|---|---|---|---|---|---|
| 2026-11-02 | ChatGPT | 1 | | | | | | | |
| 2026-11-02 | Claude | 1 | | | | | | | |
| 2026-11-02 | Perplexity | 1 | | | | | | | |
| 2026-11-02 | Gemini | 1 | | | | | | | |
| 2026-11-02 | Copilot | 1 | | | | | | | |

**Monthly summary rows to add:**
- Score = number of the 60 prompt × engine checks where BushmanQC was mentioned
- Bing **AI Performance** total citations (section 2b)
- Google Search Console clicks and impressions (section 1c)

**What to do with the results:**
- **Wrong facts** in prompts 10–12: fix the source the engine cited (usually a directory or LinkedIn field), then re-check next month.
- **Competitors named but not you:** look at which sources the engine cited for them (directories, articles, Reddit threads) and get BushmanQC onto those same sources.
- **The engine cites one of your `/resources` guides but doesn't name BushmanQC:** make the guide's author box and intro state "BushmanQC" and "Nellie Bushman" clearly. 🛠 This is a small content edit.

### 11c. Optional paid upgrade: Otterly AI 💲

- **What:** automatically runs a set of prompts across AI engines daily and tracks mentions and citations.
- **Price (third-party reports, 2026; Otterly's own pricing page couldn't be read):** **Lite about $29/month** (about $25/month billed annually) for **15 prompts**. It covers ChatGPT, Google AI Overviews, Perplexity and Microsoft Copilot. **Gemini, Google AI Mode and, reportedly, Claude are paid add-ons.** Higher tiers are about $189/month (100 prompts) and about $489/month (400 prompts). A free trial is reported, with no card required.
- **Recommendation:** only consider it after 3 months of the free manual log show progress, and confirm current pricing at otterly.ai/pricing first. The free monthly check above is enough for a one-person consultancy.

---

## Things I could not verify (as of 2026-10-08)

- **Search Console + Cloudflare one-click:** Google documents a "Start verification" flow for supported DNS providers, but I couldn't confirm Cloudflare is on that list. The manual TXT method always works.
- **Bing import of a Domain property:** the import feature is documented, but not specifically for Domain properties. A CNAME or meta-tag fallback is given above.
- **Brave submit-url form:** I couldn't read its fields or limits (the page needs JavaScript). Brave has no webmaster console.
- **Google Business Profile categories:** taken from a May 2026 third-party copy of the list, since Google publishes no official one. Confirm in the drop-down. The 300-character service-description limit also comes from third parties.
- **LinkedIn limits:** tagline 120 and overview 2,000 come from LinkedIn Learning; 20 specialties from a third-party guide; the Service Page's roughly 500-character description from third parties. LinkedIn's help pages state no limits, so check the on-screen counters.
- **Subreddit rules:** Reddit blocks automated access. Existence and member counts come from third-party trackers.
- **OpenRegulatory and Advisera directory costs:** the sites blocked automated reading or didn't state pricing.
- **Greenlight Guru public partner directory:** not confirmed. **Ketryx** has no consultant directory.
- **RAPS 2026 dues:** only the 2025 application form ($245/year individual) was available.
- **Intertek podcast form:** confirmed via search listing; the page blocked direct reading.
- **Greenlight Guru podcast guest intake:** no official guest form. The email address is the one used for listener ideas.
- **Otterly AI pricing:** from third-party 2026 reviews, not Otterly's own page.
- **ChatGPT using Bing:** widely reported, but OpenAI doesn't document its search providers in detail.

---

## Sources (verified on 2026-10-08)

**Search engines and indexing**
- Google, Verify your site ownership (Search Console): https://support.google.com/webmasters/answer/9008080
- Google Admin Toolbox Dig (TXT check): https://toolbox.googleapps.com/apps/dig/
- Cloudflare, Create DNS records: https://developers.cloudflare.com/dns/manage-dns-records/how-to/create-dns-records/
- Cloudflare, Crawler Hints (IndexNow): https://developers.cloudflare.com/cache/advanced-configuration/crawler-hints/
- Bing Webmaster Blog, Import sites from Search Console: https://blogs.bing.com/webmaster/september-2019/Import-sites-from-Search-Console-to-Bing-Webmaster-Tools
- Bing Webmaster Blog, Introducing AI Performance (Public Preview), Feb 10 2026: https://blogs.bing.com/webmaster/February-2026/Introducing-AI-Performance-in-Bing-Webmaster-Tools-Public-Preview
- Search Influence, Bing AI Performance report analysis (Feb 2026): https://www.searchinfluence.com/blog/bing-ai-performance-report-copilot-citations/
- Search Engine Land, Bing Domain Connect verification: https://searchengineland.com/bing-webmaster-tools-adds-domain-connect-verification-integration-320898
- IndexNow get started: https://www.bing.com/indexnow/getstarted
- IndexNow participating engines: https://www.indexnow.org/searchengines.json
- Brave Search crawler help: https://search.brave.com/help/brave-search-crawler
- Brave Search submit URL: https://search.brave.com/submit-url
- Simon Willison, Anthropic uses Brave for web search: https://simonwillison.net/2025/Mar/21/anthropic-used-brave
- TechCrunch, Anthropic appears to use Brave: https://techcrunch.com/2025/03/21/anthropic-appears-to-be-using-brave-to-power-web-searches-for-its-claude-chatbot/
- Xponent21, Claude web-search subprocessors (checked Jul 2026): https://xponent21.com/insights/claude-web-search-brave-turbopuffer/

**Google Business Profile**
- Guidelines for representing your business: https://support.google.com/business/answer/3038177
- Eligibility (face-to-face / online-only): https://support.google.com/business/answer/7039811
- Service-area businesses: https://support.google.com/business/answer/10514137
- Restrictions for policy violations (fake engagement): https://support.google.com/business/answer/14114287
- Category list (third-party, updated May 2026): https://daltonluka.com/blog/google-my-business-categories
- BrightLocal, description guidance: https://www.brightlocal.com/learn/google-business-profile-description/

**LinkedIn**
- Create a LinkedIn Page: https://www.linkedin.com/help/linkedin/answer/a543852
- Edit your Page: https://www.linkedin.com/help/lms/answer/a564346
- LinkedIn Learning, tagline: https://www.linkedin.com/learning/growing-your-business-with-linkedin-pages-22873022/creating-your-tagline
- LinkedIn Learning, overview: https://www.linkedin.com/learning/growing-your-business-with-linkedin-pages-22873022/about-overview-and-company-description
- Service Page overview (third party): https://internshala.com/blog/how-to-find-freelance-work-on-linkedin/

**Vendor partner programs and directories**
- Qualio partners: https://www.qualio.com/partners · Directory: https://www.qualio.com/our-partners
- Greenlight Guru partners: https://www.greenlight.guru/partner
- SimplerQMS partner program: https://simplerqms.com/partner-program/ · Directory: https://simplerqms.com/partners/
- Matrix Req / Matrix One partners: https://matrixone.health/partners
- Ketryx partnerships: https://www.ketryx.com/partnerships
- OpenRegulatory consultant directory: https://openregulatory.com/regulatory-consultants
- Advisera consultants: https://advisera.com/consultants/ · Directory: https://marketplace.advisera.com/consultant/iso-13485
- Clutch, get listed: https://help.clutch.co/en/knowledge/get-listed-on-clutch · https://clutch.co/get-listed
- Crunchbase, create a profile: https://support.crunchbase.com/hc/en-us/articles/115011823988
- BBB, get listed: https://www.bbb.org/get-listed · BrightLocal BBB guide: https://www.brightlocal.com/learn/how-to-add-or-claim-your-better-business-bureau-listing/
- RAPS membership: https://www.raps.org/join-raps · 2025 application form: https://media.raps.org/m/37f4479a0b221ed7/original/2025-01-RAPS-Membership-Application-Form_v3.pdf

**Community, publications, podcasts**
- r/MedicalDevices stats (third party): https://gummysearch.com/r/MedicalDevices/
- r/regulatoryaffairs stats (third party): https://gummysearch.com/r/regulatoryaffairs
- Regulatory subreddits list (third party): https://painonsocial.com/subreddits/regulatory-affairs-specialists
- MedTech Intelligence editorial submissions: https://medtechintelligence.com/editorial-submissions/
- Medical Design & Outsourcing contributor guidelines: https://www.medicaldesignandoutsourcing.com/?p=260837
- Med Device Online guest expert guidelines: https://www.meddeviceonline.com/doc/guest-expert-article-guidelines-0001
- RAPS, for authors: https://www.raps.org/news-insights/for-authors.html
- Intertek, Medical Compliance With Clarissa guest request: https://www.intertek.com/medical/resources/compliance-with-clarissa-guest-request
- The State of Medtech guest form: https://tally.so/r/wdxljK
- Global Medical Device Podcast (Apple listing): https://podcasts.apple.com/podcast/id1458125111
- Let's Talk Risk (Substack): https://naveenagarwalphd.substack.com/p/celebrating-25-lets-talk-risk-conversations

**Reviews, compliance and tools**
- FTC Consumer Reviews and Testimonials Rule Q&A: https://www.ftc.gov/business-guidance/resources/consumer-reviews-testimonials-rule-questions-answers
- FTC 16 CFR Part 465 final rule: https://www.ftc.gov/legal-library/browse/federal-register-notices/16-cfr-part-465-trade-regulation-rule-use-consumer-reviews-testimonials-final-rule
- Otterly AI pricing (third-party summaries): https://www.g2.com/products/otterlyai/pricing · https://www.capterra.com/p/10023384/Otterly-AI/pricing/
