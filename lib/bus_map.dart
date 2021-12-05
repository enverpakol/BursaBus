import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Bus_current_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusMap extends StatefulWidget {
  final String BusCode;
  const BusMap({Key? key, required this.BusCode}) : super(key: key);
  @override
  _BusMapState createState() => _BusMapState();
}

class _BusMapState extends State<BusMap> {
  
  late BitmapDescriptor locationIcon;
  double enlem = 0.0;
  double boylam = 0.0;
  createIcon(context) {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, "content/bus.png")
        .then((icon) {
      locationIcon = icon;
    });
  }

  Future<void> getCurrentLocation() async {
    await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    enlem = position.latitude;
    boylam = position.longitude;
  }

  Completer<GoogleMapController> mapController = Completer();
  var firstLocation = CameraPosition(
    target: LatLng(38.7412482, 26.1844276),
    zoom: 4,
  );

  Future<void> setNewLocation(String Buscode) async {
    GoogleMapController controller = await mapController.future;
  
    var allBusesJson =await BusCurrentLocation().fetchAllBusCurrentLocations(query:Buscode);
    print(allBusesJson);
    var BusList = busCurrentLocationFromJson(allBusesJson.toString());
    for (var item in BusList) {
      markers.add(Marker(
        markerId: MarkerId(item.vehicleNo.toString()),
        position: LatLng(item.lat ?? 0.0, item.lng ?? 0.0),
        infoWindow: InfoWindow(
            title: item.vehicleNo.toString(),
            snippet: item.currentSpeed.toString()),
        icon: locationIcon,
      ));
    }
    setState(() {
      markers = markers;
    });
    var setLocation = CameraPosition(
      target: LatLng(BusList[0].lat ?? 0.0, BusList[0].lng ?? 0.0),
      zoom: 12,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(setLocation));
  }

  List<Marker> markers = <Marker>[];

  @override
  void initState() {
   
    setNewLocation(widget.BusCode);
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    createIcon(context);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(markers),
                initialCameraPosition: firstLocation,
                onMapCreated: (GoogleMapController controller) {
                  mapController.complete(controller);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.BusCode,
                style:
                    TextStyle(
                     fontSize: 18.0,
                     color: Colors.deepOrangeAccent,
                     fontWeight:FontWeight.bold,
                     ),
              ),
            ),
          ],
        )));
  }
}
