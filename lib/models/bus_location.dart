import 'package:http/http.dart' as http;
import 'dart:convert';

List<Burulas> burulasFromJson(String str) => List<Burulas>.from(json.decode(str).map((x) => Burulas.fromJson(x)));

String burulasToJson(List<Burulas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Burulas {
    Burulas({
        this.line,
        this.nextStationCode,
        this.nextStationName,
        this.vehicleNo,
        this.distanceToTarget,
    });

    String? line;
    String? nextStationCode;
    String? nextStationName;
    int? vehicleNo;
    int? distanceToTarget;

    factory Burulas.fromJson(Map<String, dynamic> json) => Burulas(
        line: json["line"],
        nextStationCode: json["nextStationCode"],
        nextStationName: json["nextStationName"],
        vehicleNo: json["vehicleNo"],
        distanceToTarget: json["distanceToTarget"],
    );

    Map<String, dynamic> toJson() => {
        "line": line,
        "nextStationCode": nextStationCode,
        "nextStationName": nextStationName,
        "vehicleNo": vehicleNo,
        "distanceToTarget": distanceToTarget,
    };
  
  
Future<List<Burulas>> fetchAllData() async {
    var url = Uri.parse(
        'https://kodefine.net/');
    var cevap =await http.get(url);
    return burulasFromJson(cevap.body);
  }
}
