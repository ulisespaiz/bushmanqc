// Edge entry for bushmanqc.com.
//
// Static assets (BushmanQC/) do all the real work. This script exists only to
// 301 the www host to the apex: www.bushmanqc.com was serving a full duplicate
// of the site with 200s, which splits ranking signals between two hosts.
// Everything else is handed straight to the assets binding, which still
// applies _headers, _redirects, html_handling and the 404 page.

const CANONICAL_HOST = "bushmanqc.com";

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    if (url.hostname === "www." + CANONICAL_HOST) {
      url.hostname = CANONICAL_HOST;
      url.protocol = "https:";
      return Response.redirect(url.toString(), 301);
    }

    return env.ASSETS.fetch(request);
  },
};
