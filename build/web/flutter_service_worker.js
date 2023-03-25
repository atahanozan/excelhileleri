'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "737484acbbcc7398c808280108792770",
"assets/assets/10_ders.pdf": "bcc1e9fc258701a6095e051d1764a839",
"assets/assets/11_ders.pdf": "bb81125604f106a4cb7f0b102e628e8e",
"assets/assets/12_ders.pdf": "638ce4ebad26f1b8c785246e450ccf94",
"assets/assets/13_ders.pdf": "8631a7da63b20787aa8ed5c0dc29fcc4",
"assets/assets/14_ders.pdf": "68c9007a1ea53892c8e3743574b02b5a",
"assets/assets/15_ders.pdf": "8879c18d4e35ccbac79d732250725ee4",
"assets/assets/16_ders.pdf": "e561588110aeecc0ff68abe7ff0d2d01",
"assets/assets/17_ders.pdf": "e029be85845eeb01f2befc2da15287d6",
"assets/assets/18_ders.pdf": "d3dac74092e45bcae426fa6ea472e5d2",
"assets/assets/19_ders.pdf": "463952238a23add714997b9829a0243d",
"assets/assets/1ders.pdf": "820dbc0733b7e901057f293a18792940",
"assets/assets/2_ders.pdf": "af7310d4baaa08179e7df8d5200f5e5b",
"assets/assets/3_ders.pdf": "1806447f5961c6e6d4076ef6e5c54b5d",
"assets/assets/4_ders.pdf": "7b8fedd2de1ac27458124e493124bf09",
"assets/assets/5_ders.pdf": "be5ae083b4d4122ce08907ef015302e8",
"assets/assets/6_ders.pdf": "2103c18910f4b0af451ea62d0c7b4961",
"assets/assets/7_ders.pdf": "7c17fcb3afa4e30b9a5493910f9c4c14",
"assets/assets/8_ders.pdf": "6124d54d00df5ce9984402c88e4e16e9",
"assets/assets/9_ders.pdf": "16f22d19d53a1ad1e4d4a310eda04d36",
"assets/assets/aboutusnew.png": "e7f484af0f8ecdea1bbb00682599773d",
"assets/assets/comingsoon.png": "83da1be8394d938765552a2dd36b2784",
"assets/assets/contactusnew.png": "23820449ddaace39a387e856db74dc14",
"assets/assets/ders1.png": "9c8c0f27138860aea4dc2b0f0d10f28f",
"assets/assets/ders2.png": "13b879cd3db1aa9c109bd8761373c751",
"assets/assets/ders3.png": "0a8ad617a12538cc30703e3a1b8daeb4",
"assets/assets/logo.png": "5556e1153bed92cedea8eaf2813d478d",
"assets/assets/logo_seffaf.png": "5e0b41ab426df2189e4a8ee42adadec2",
"assets/assets/robot.gif": "9b8ddccdca6a0890991f8c3e3225f12e",
"assets/assets/robot2.gif": "05aaacbe0021c3f0ca48a80dbd4d4a79",
"assets/assets/yellowclass.png": "14aecae8b80693e92af1ccb6ed9b9dd7",
"assets/assets/yellowoffice.png": "9c14385b18ff3d8a4039e8bf6d915b2d",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "f9d279888693b6ade71e4aeae263e978",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/floating_bottom_bar/assets/images/ic_dot.svg": "1e86982d73c9ce46c44c0d74600b273d",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "99f29024aee8f4672a47cc3a81b9b84a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "48ce1bb8a42776caa951cb782d277730",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d8e9b6203ce2657c991f0b339ccb3a6d",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/shaders/ink_sparkle.frag": "ec74b85cf5d5df08f5fceeab93065135",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cd2ac29e05bd87018eb31d29844b0b1a",
"/": "cd2ac29e05bd87018eb31d29844b0b1a",
"main.dart.js": "ddc1c0cd9246b42cdceb3cd0213fba7f",
"manifest.json": "025dcccb27ccba2259d24bab6d636ae7",
"version.json": "8dcee467bb81bc469c4574db0e875b46"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
