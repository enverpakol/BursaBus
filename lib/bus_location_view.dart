import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/bus_location.dart';

class BusLocationView extends StatefulWidget {
  BusLocationView({Key? key}) : super(key: key);

  @override
  _BusLocationViewState createState() => _BusLocationViewState();
}

class _BusLocationViewState extends State<BusLocationView> {
  bool isSearching = false;
  String query = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  decoration: InputDecoration(hintText: "arama yapınız"),
                  onChanged: (aramaSonucu) {
                    setState(() {
                      query = aramaSonucu;
                    });
                  },
                )
              : Text('Bus Lines'),
          actions: [
            isSearching ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        query="";
                      });
                    },
                    icon: Icon(Icons.cancel,color: Colors.white))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    icon: Icon(Icons.search,color: Colors.white))
          ],
        ),
        body: FutureBuilder<List<Burulas>>(
            future: Burulas().fetchAllData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var busList = snapshot.data;
                return ListView.builder(
                    itemCount: busList?.length,
                    itemBuilder: (context, index) {
                      var bus = busList?[index];
                      return Card(child: BusCard(bus));
                    });
              } else {
                Text("No Data");
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  ListTile BusCard(Burulas? bus) {
    return ListTile(
        leading: Text(bus?.line ?? ""),
        title: Text(bus?.nextStationName ?? ""),
        subtitle: Text(bus?.distanceToTarget.toString() ?? ""),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print(bus?.line ?? "");
        });
  }
}
