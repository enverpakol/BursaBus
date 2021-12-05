// To parse this JSON data, do
//
//     final busLine = busLineFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

List<BusLine> busLineFromJson(String str) => List<BusLine>.from(json.decode(str).map((x) => BusLine.fromJson(x)));

String busLineToJson(List<BusLine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusLine {
    BusLine({
        this.hatAdi,
        this.hatId,
        this.guzergahBaslangic,
        this.guzergahBitis,
        this.haritaYayinla,
        this.saatYayinla,
        this.guzergahBilgisi,
        this.siraNo,
        this.varyantId,
    });

    String? hatAdi;
    int? hatId;
    String? guzergahBaslangic;
    String? guzergahBitis;
    bool? haritaYayinla;
    bool? saatYayinla;
    String? guzergahBilgisi;
    int? siraNo;
    int? varyantId;

    factory BusLine.fromJson(Map<String, dynamic> json) => BusLine(
        hatAdi: json["hatAdi"],
        hatId: json["hatId"],
        guzergahBaslangic: json["GuzergahBaslangic"],
        guzergahBitis: json["GuzergahBitis"],
        haritaYayinla: json["HaritaYayinla"],
        saatYayinla: json["SaatYayinla"],
        guzergahBilgisi: json["guzergahBilgisi"],
        siraNo: json["SiraNo"],
        varyantId: json["VaryantId"],
    );

    Map<String, dynamic> toJson() => {
        "hatAdi": hatAdi,
        "hatId": hatId,
        "GuzergahBaslangic": guzergahBaslangic,
        "GuzergahBitis":guzergahBaslangic,
        "HaritaYayinla": haritaYayinla,
        "SaatYayinla": saatYayinla,
        "guzergahBilgisi": guzergahBilgisi,
        "SiraNo": siraNo,
        "VaryantId": varyantId,
    };


    Future<List<BusLine>> fetchAllBusLines({required String query}) async {
    var url = Uri.parse(
        'https://kodefine.net/home/Buslines${query!=""?('?q=$query'):''}');
    var cevap =await http.get(url);
   print(cevap.statusCode);
    return busLineFromJson(cevap.body);
  }
}
