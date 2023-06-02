import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdsDenemeSon extends StatefulWidget {
  const GoogleAdsDenemeSon({Key? key}) : super(key: key);

  @override
  State<GoogleAdsDenemeSon> createState() => _GoogleAdsDenemeSonState();
}

class _GoogleAdsDenemeSonState extends State<GoogleAdsDenemeSon> {
  late BannerAd staticAd;
  bool staticAdLoaded = false;
  late BannerAd inlineAd;
  bool inlineAdLoaded = false;

  static const AdRequest request = AdRequest();

  void loadStaticBannerAd() {
    staticAd = BannerAd(
        adUnitId: "ca-app-pub-1093035981349732/5424775007",
        size: AdSize.banner,
        request: request,
        listener: AdListener(
          onAdLoaded: (ad) {
            setState(() {
              staticAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print('failed ${error.message}');
          },
        ));
    staticAd.load();
  }

  void loadInlineBannerAd() {
    inlineAd = BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        request: request,
        listener: AdListener(
          onAdLoaded: (ad) {
            setState(() {
              inlineAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print('failed ${error.message}');
          },
        ));
    inlineAd.load();
  }

  @override
  void initState() {
    loadStaticBannerAd();
    loadInlineBannerAd();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: AdWidget(ad: staticAd),
            width: staticAd.size.width.toDouble(),
            height: staticAd.size.height.toDouble(),
          ),
        ],
      ),
    );
  }
}
