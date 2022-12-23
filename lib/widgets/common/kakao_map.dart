import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:pet_app/styles.dart';

class KakaoMap extends ConsumerStatefulWidget {
  const KakaoMap({Key? key}) : super(key: key);

  @override
  KakaoMapState createState() => KakaoMapState();
}

class KakaoMapState extends ConsumerState<KakaoMap> {
  @override
  Widget build(BuildContext context) {
    return KakaoMapView(
        width: double.infinity,
        height: multiplyFree(defaultSize, 20),
        kakaoMapKey: 'c354c57eed796746d09fb34ecbf54bb0',
        lat: 33.450701,
        lng: 126.570667,
        showMapTypeControl: false,
        showZoomControl: true,
        markerImageURL:
            'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
        onTapMarker: (message) {
          //event callback when the marker is tapped
        });
  }
}
