import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:story_space/add_story/presentation/widget/pick_location_result.dart';
import 'package:story_space/core/presentation/util/context_ext.dart';

class PickLocationBottomSheet extends StatefulWidget {
  const PickLocationBottomSheet({super.key});

  @override
  State<PickLocationBottomSheet> createState() => _PickLocationBottomSheetState();
}

class _PickLocationBottomSheetState extends State<PickLocationBottomSheet> {
  late GoogleMapController _googleMapController;
  late final Set<Marker> _markers = {};
  geo.Placemark? _selectedPlacemark;
  LatLng? _selectedLatlng;

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.getString.pickYourLocation),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-5.821835152908256, 106.78254323514007), // jakarta
                    zoom: 10,
                  ),
                  markers: _markers,
                  compassEnabled: false,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  onMapCreated: (controller) {
                    _googleMapController = controller;
                    setState(() {});
                  },
                  onTap: _onTapGoogleMap,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => _onSetLocation(context),
                  child: Text(context.getString.setLocation),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  _onSetLocation(BuildContext context) {
    if (_selectedLatlng != null && _selectedPlacemark != null) {
      final result = PickLocationResult(
        latitude: _selectedLatlng!.latitude,
        longitude: _selectedLatlng!.longitude,
        street: _selectedPlacemark!.street ?? '',
        address:
            '${_selectedPlacemark!.subLocality}, ${_selectedPlacemark!.locality}, ${_selectedPlacemark!.postalCode}, ${_selectedPlacemark!.country}',
      );
      context.pop(result);
    }
  }

  _getCurrentLocation() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        context.pop(context.getString.locationServiceNotAvailable);
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        if (!context.mounted) return;
        context.pop(context.getString.permissionDeniedMsg);
        return;
      }
    }

    locationData = await location.getLocation();
    final LatLng latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final placemarks = await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final placemark = placemarks[0];
    final street = placemark.street;
    final address = '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';

    _selectedLatlng = latLng;
    _selectedPlacemark = placemark;
    setState(() {});

    _createMarker(latlng: latLng, street: street ?? '', address: address);

    _googleMapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  _onTapGoogleMap(LatLng latlng) async {
    final placemarks = await geo.placemarkFromCoordinates(latlng.latitude, latlng.longitude);
    final placemark = placemarks[0];
    final street = placemark.street ?? '';
    final address = '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';

    _selectedLatlng = latlng;
    _selectedPlacemark = placemark;
    setState(() {});

    _createMarker(latlng: latlng, street: street, address: address);

    _googleMapController.animateCamera(
      CameraUpdate.newLatLng(latlng),
    );
  }

  _createMarker({
    required LatLng latlng,
    required String street,
    required String address,
  }) {
    final marker = Marker(
        markerId: const MarkerId("selectedLocation"),
        position: latlng,
        infoWindow: InfoWindow(
          title: street,
          snippet: address,
        ));

    _markers.clear();
    _markers.add(marker);
    setState(() {});
  }
}
