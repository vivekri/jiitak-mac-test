import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(8.340765, 77.153647),
      zoom: 17,
    );

    return SizedBox(
      height: 220,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          //_controller.complete(controller);
        },
      ),
    );
  }
}
