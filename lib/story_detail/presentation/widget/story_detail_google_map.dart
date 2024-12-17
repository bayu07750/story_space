import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoryDetailGoogleMap extends StatefulWidget {
  const StoryDetailGoogleMap({super.key, required this.lat, required this.lon});

  final double lat;
  final double lon;

  @override
  State<StoryDetailGoogleMap> createState() => _StoryDetailGoogleMapState();
}

class _StoryDetailGoogleMapState extends State<StoryDetailGoogleMap> {
  late GoogleMapController _googleMapController;
  late final Set<Marker> _markers = {};
  final MapType _mapType = MapType.normal;

  @override
  void initState() {
    _defaultMarker();
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final center = LatLng(widget.lat, widget.lon);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: center,
              zoom: 10,
            ),
            markers: _markers,
            mapType: _mapType,
            onMapCreated: (controller) {
              _googleMapController = controller;
              setState(() {});
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            mapToolbarEnabled: false,
            compassEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(3, 18),
            rotateGesturesEnabled: false,
            myLocationEnabled: false,
          ),
        ),
      ],
    );
  }

  void _defaultMarker() {
    geo.placemarkFromCoordinates(widget.lat, widget.lon).then((value) {
      final place = value[0];
      final street = place.street;
      final address = '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      final marker = Marker(
        markerId: const MarkerId("default"),
        position: LatLng(widget.lat, widget.lon),
        infoWindow: InfoWindow(
          title: street,
          snippet: address,
        ),
      );
      _markers.clear();
      _markers.add(marker);
      setState(() {});
    });
  }
}
