import 'package:flutter/material.dart';
import 'package:flutter_application_1/bus_map.dart';
import 'package:flutter_application_1/models/bus_line.dart';

class BusLineView extends StatefulWidget {
  BusLineView({Key? key}) : super(key: key);

  @override
  _BusLineViewState createState() => _BusLineViewState();
}

class _BusLineViewState extends State<BusLineView> {
  bool isSearching = false;
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  decoration: InputDecoration(
                      hintText: "arama yapınız",
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white)),
                  onChanged: (aramaSonucu) {
                    setState(() {
                      query = aramaSonucu;
                    });
                  },
                )
              : Text('Bus Lines'),
          actions: [
            isSearching
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        query = "";
                      });
                    },
                    icon: Icon(Icons.cancel, color: Colors.white))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    icon: Icon(Icons.search, color: Colors.white))
          ],
        ),
        body: FutureBuilder<List<BusLine>>(
            future: BusLine().fetchAllBusLines(query: query),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var busList = snapshot.data;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: busList?.length,
                    itemBuilder: (context, index) {
                      var bus = busList?[index];
                      return BusLinesCard(bus);
                    });
              } else {
                Text("No Data");
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Card BusLinesCard(BusLine? bus) {
    var hatBilgisi = bus?.guzergahBilgisi?.split("-");
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.bus_alert),
            title: Text(bus?.hatAdi ?? ""),
            subtitle: Text(
              bus?.hatId.toString() ?? "",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              bus?.guzergahBilgisi ?? "",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BusMap(BusCode: bus?.hatAdi ?? "denem")),
                  );
                },
                child: const Text('Show Map'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BusMap(BusCode: bus?.hatAdi ?? "denem")),
                  );
                },
                child: const Text('Timeline'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// ListTile(
//         leading: Text(bus?.hatAdi ?? ""),
//         title:ListView.builder(
//                     itemCount: hatBilgisi?.length,
//                     itemBuilder: (context, index) {
//                       return Text("A");
//                     }),
//         subtitle: Text(bus?.hatId.toString() ?? ""),
//       ),