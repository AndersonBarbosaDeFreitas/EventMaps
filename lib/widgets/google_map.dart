import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'marker_information.dart';

class MapGoogle extends StatefulWidget {
  @override
  _MapGoogleState createState() => _MapGoogleState();
}

class _MapGoogleState extends State<MapGoogle> {
  GoogleMapController mapController;

  Set<Marker> markers = new Set<Marker>();

  double lat = -6.8051197;
  double long = -35.0779017;

  @override
  void initState(){
    super.initState();
    markers.add(Marker(
      markerId: MarkerId('UFPB'),
      draggable: false,
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return MarkernInformationWidget(
              nameEvent: "Reunião App4Society",
              addressEvent: "Endereço do Evento Selecionado",
              colorCategory: Color(0xFF00BCD4),
            );
          },
        );
      },
      position: LatLng(lat, long),
    ),);
  }

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(lat,long),
        zoom:11,
      ),
      onMapCreated: _onMapCreated,
      markers: markers,
      zoomControlsEnabled: false,
    );
  }
}