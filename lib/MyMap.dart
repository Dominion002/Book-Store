import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  // GoogleMapController mymapcontroller = GoogleMapController();
  Completer<GoogleMapController> mymapcontroller = Completer<GoogleMapController>();
  LatLng? updateposition;

  CameraPosition currentLocation = CameraPosition(
      target: LatLng(6.5764, 3.3653),
      zoom: 70);

  Future<void>getLocationByaddress(String address)async{
    List<Location> position =
    await locationFromAddress(address);

    var status = await Permission.location.request();
    LatLng updatelatng;

    if (status.isGranted){
      final GoogleMapController controller = await  mymapcontroller.future;

      setState(() {
        LatLng  updatelatng = LatLng(position.first.latitude, position.first.longitude);
        currentLocation = CameraPosition(
            target: updatelatng,
            zoom: 14,
        );
        print("lattitude is" +
            (position.first.latitude).toString() +
            ", Longitude is " +
            ( position.first.longitude).toString()
        );
      });
      await controller
          .animateCamera(CameraUpdate.newCameraPosition(currentLocation));
    }
    else{
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Permission Denied'),
              content:
              Text("Pesse grnt loction permission"),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('OK')
                )
              ],
            );
          }
      );
    }

  }

  Future<void> _goToTheLake() async {
    var status = await Permission.location.request();
    LatLng updatelatng;
    Position position;
    if (status.isGranted){
      final GoogleMapController controller = await  mymapcontroller.future;
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        LatLng  updatelatng = LatLng(position.latitude, position.longitude);
        currentLocation = CameraPosition(
            target: updatelatng,
          zoom: 14
        );
        print("lattitude is" +
            (position.latitude).toString() +
            ", Longitude is " +
            (position.longitude).toString()
        );
      });
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(currentLocation));
    }
    else{
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Permission Denied'),
              content:
              Text("Pesse grnt loction permission"),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text('OK')
                  )
                ],
            );
          }
      );
    }
  }

  // Future<void> main() async {
  //   const String googelApiKey = 'YOUR_API_KEY';
  //   final bool isDebugMode = true;
  //   final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);
  //   final placeSearchResults = await api.placeGeocoding(
  //     'ChIJd8BlQ2BZwokRAFUEcm_qrcA',
  //     language: 'en',
  //   );
  // }
  TextEditingController serch = TextEditingController();

  var done = false;
  Future<void> closeOpen()async{
    setState(() {
      done = !done;
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "This is rider app",
        home: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: currentLocation,
                  onMapCreated: (GoogleMapController controller){
                    mymapcontroller.complete(controller);
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color:Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )

                    ),
                    child: Container(
                      child: IconButton(
                        icon: Icon(Icons.add_location),
                        onPressed: (){
                          _goToTheLake();
                        },
                      ),
                    ),
                  ),
                ),
                if(done)
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextField(
                              controller: serch,
                              onTap: (){
                                getLocationByaddress(serch.text);
                              },
                              decoration: InputDecoration(
                                  hintText: "Location Search",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )
                              ),

                            ),
                          ),
                        ),

                        ElevatedButton(
                            onPressed:() {
                              setState(() {
                                getLocationByaddress(serch.text);
                              });
                            }, child: Text("Search")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton:Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 200,
                child: FloatingActionButton(
                   onPressed:(){
                       closeOpen();
                   },
                   child: (done) ? Icon(Icons.menu): Icon(Icons.close)
    ),
              )


            ],
        )
        )
    );
  }
}
