import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../custom_paint/custom_paint.dart';
import 'widgets/widgets.dart';

@immutable
class WeddingPlace extends StatefulWidget {
  const WeddingPlace({
    Key? key,
  }) : super(key: key);

  @override
  State<WeddingPlace> createState() => _WeddingPlaceState();
}

class _WeddingPlaceState extends State<WeddingPlace>
    with SingleTickerProviderStateMixin {
  late MapZoomPanBehavior _zoomPanBehavior;
  MapTileLayerController? _mapController;
  // AnimationController? _animationController;
  // late Animation<double> _animation;
  // late bool _isDesktop;
  late List<_RouteDetails> _routes;
  late String _routeJson;

  @override
  void initState() {
    super.initState();
    _routeJson = 'assets/geo/london_to_british.json';
    _routes = <_RouteDetails>[
      _RouteDetails(
        const MapLatLng(54.665036, 55.928068),
        const Image(
            image: AssetImage('assets/images/weddingGeo.png'), height: 50),
        'Место свадьбы',
      ),
      // _RouteDetails(
      //     const MapLatLng(54.71821, 56.01449),
      //     Icon(Icons.location_on, color: Colors.red[600], size: 30),
      //     'Мое местоположение'),
    ];
    _mapController = MapTileLayerController();
    _zoomPanBehavior = MapZoomPanBehavior(
      minZoomLevel: 3,
      zoomLevel: 19,
      focalLatLng: const MapLatLng(54.665036, 55.928068),
      toolbarSettings: const MapToolbarSettings(
          direction: Axis.vertical, position: MapToolbarPosition.bottomRight),
      enableDoubleTapZooming: true,
    );

    // _animationController = AnimationController(
    //   duration: const Duration(seconds: 3),
    //   vsync: this,
    // );

    // _animation = CurvedAnimation(
    //   parent: _animationController!,
    //   curve: Curves.easeInOut,
    // );
  }

  @override
  void dispose() {
    // _animationController!.dispose();
    _mapController!.dispose();
    _routes.clear();
    super.dispose();
  }

  Future<dynamic> getJsonData() async {
    final List<MapLatLng> polyline = <MapLatLng>[];
    final String data = await rootBundle.loadString(_routeJson);
    final dynamic jsonData = json.decode(data);
    final List<dynamic> polylinePoints =
        jsonData['features'][0]['geometry']['coordinates'] as List<dynamic>;
    for (int i = 0; i < polylinePoints.length; i++) {
      polyline.add(MapLatLng(polylinePoints[i][1], polylinePoints[i][0]));
    }
    // ignore: unawaited_futures
    // _animationController?.forward(from: 0);

    return polyline;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 160),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 70),
            child: TopicText(headText: 'Место проведения'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 10),
            child: Transform.rotate(
              angle: 6.4,
              child: CustomPaint(
                size: Size(530, (30 * 0.11872909698996655).toDouble()),
                painter: GradientLine(),
              ),
            ),
          ),
          Transform.rotate(
            angle: 6.15,
            child: CustomPaint(
              size: Size(530, (30 * 0.11872909698996655).toDouble()),
              painter: GradientLine(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: _HeadLineText(),
          ),
          SizedBox(
            width: 300,
            child: SfMaps(
              layers: <MapLayer>[
                MapTileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  initialMarkersCount: _routes.length,
                  controller: _mapController,
                  markerBuilder: (BuildContext context, int index) {
                    if (_routes[index].icon != null) {
                      return MapMarker(
                        key: UniqueKey(),
                        latitude: _routes[index].latLan.latitude,
                        longitude: _routes[index].latLan.longitude,
                        alignment: Alignment.bottomCenter,
                        child: _routes[index].icon,
                      );
                    } else {
                      return MapMarker(
                        key: UniqueKey(),
                        latitude: _routes[index].latLan.latitude,
                        longitude: _routes[index].latLan.longitude,
                        iconColor: Colors.white,
                        iconStrokeWidth: 2.0,
                        size: const Size(15, 15),
                        iconStrokeColor: Colors.black,
                      );
                    }
                  },
                  tooltipSettings: const MapTooltipSettings(
                    color: Color.fromRGBO(45, 45, 45, 1),
                  ),
                  markerTooltipBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_routes[index].city,
                          style: themeData.textTheme.bodySmall!.copyWith(
                              color: const Color.fromRGBO(255, 255, 255, 1))),
                    );
                  },
                  zoomPanBehavior: _zoomPanBehavior,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class _HeadLineText extends StatelessWidget {
  const _HeadLineText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: DefaultTextStyle(
          style: GoogleFonts.ptSansNarrow(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'ЗАГОРОДНЫЙ КОМПЛЕКС\n',
                  style: TextStyle(height: 3.5, color: Colors.black),
                ),
                TextSpan(
                  text: '«GREEN HALL UFA»',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: ', ул. Линёвая 76/1',
                ),
              ],
            ),
          ),
        ),
      );
}

class _RouteDetails {
  _RouteDetails(this.latLan, this.icon, this.city);

  MapLatLng latLan;
  Widget? icon;
  String city;
}
