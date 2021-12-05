// To parse this JSON data, do
//
//     final busCurrentLocation = busCurrentLocationFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

List<BusCurrentLocation> busCurrentLocationFromJson(String str) => List<BusCurrentLocation>.from(json.decode(str).map((x) => BusCurrentLocation.fromJson(x)));

String busCurrentLocationToJson(List<BusCurrentLocation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusCurrentLocation {
    BusCurrentLocation({
        this.averageSpeed,
        this.detourRoute,
        this.direction,
        this.distanceToNextStation,
        this.lastGpsTime,
        this.lineCode,
        this.nextStation,
        this.vehicleNo,
        this.lat,
        this.lng,
        this.currentSpeed,
    });

    int? averageSpeed;
    int? detourRoute;
    int? direction;
    int? distanceToNextStation;
    DateTime? lastGpsTime;
    int? lineCode;
    String? nextStation;
    int? vehicleNo;
    double? lat;
    double? lng;
    double? currentSpeed;

    factory BusCurrentLocation.fromJson(Map<String, dynamic> json) => BusCurrentLocation(
        averageSpeed: json["averageSpeed"],
        detourRoute: json["detourRoute"],
        direction: json["direction"],
        distanceToNextStation: json["distanceToNextStation"],
        lastGpsTime: DateTime.parse(json["lastGpsTime"]),
        lineCode: json["lineCode"],
        nextStation: json["nextStation"],
        vehicleNo: json["vehicleNo"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        currentSpeed: json["currentSpeed"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "averageSpeed": averageSpeed,
        "detourRoute": detourRoute,
        "direction": direction,
        "distanceToNextStation": distanceToNextStation,
        "lastGpsTime": lastGpsTime,
        "lineCode": lineCode,
        "nextStation": nextStation,
        "vehicleNo": vehicleNo,
        "lat": lat,
        "lng": lng,
        "currentSpeed": currentSpeed,
    };
    Future<String> fetchAllBusCurrentLocations({required String query}) async {
    var url = Uri.parse(
        'https://kodefine.net/Home/vehicleLocation?code=$query');
    var cevap =await http.get(url);
    print(url.toString());
    return cevap.body;
  }
}
