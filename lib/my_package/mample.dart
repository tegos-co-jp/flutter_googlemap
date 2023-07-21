import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer' as developer;
//import 'dart:math';
import 'sample.dart';
//import 'package:json_annotation/json_annotation.dart';

class MaSample extends StatefulWidget {
  
  const MaSample({Key? key}) : super(key: key);
  
   State<MaSample> createState() => _MaSample();
  
}
class Model {
  final double lat;
  final double lng;
  //final String lat;

  Model({required this.lat, required this.lng});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
//実数データをとってくる
      lat: double.parse(json['acf']['lat']),
      lng: double.parse(json['acf']['lng']),
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,

    };
}
}

class GetJson {//extends State<MaSample>  {

Future<String>? urls;
Set<Marker>  jsonlls ={};
Future<Set<Marker>>  getJsons() async {
  //urlから　jsonデータをとってくる。

  String url = "https://dev.tegos.co.jp/wp-json/wp/v2/posts";

  http.Response response;

  response = await http.get(Uri.parse(url));
  String data = await response.body;
//jsonデータをデーコードしてlat,lngのデータをとってくる
  final List<dynamic> jsonList = jsonDecode(data);
  List<Model> jsonl = jsonList.map((json) => Model?.fromJson(json)).toList();

//Markerを作る
  for (var id in jsonl) {
  double latp =  id.lat;   //["lat"]);
  double lngp = id.lng; //["lng"]);
  LatLng llp = LatLng(latp,lngp);

   String ltxt = "緯度:"+latp.toString()+ "\n経度:"+lngp.toString();
   //print(ltxt);
    jsonlls.add(Marker(
        markerId: MarkerId(llp.toString()),
        infoWindow: InfoWindow(title: "現在位置", snippet: ltxt),
        position: llp,
    ));
  }
  return jsonlls;
}
}

class _MaSample extends State<MaSample> {
  GetJson jsonlls = GetJson();
  late GoogleMapController mapController;


  final Completer<GoogleMapController> _controller = Completer();
///ダミーの初期位置・処理が遅れた場合表示される
  static const CameraPosition _kGooglePlex = CameraPosition(
    
    target: LatLng(34.38556530264909, 132.45439220219585),

    //zoom : 1.555,
    zoom: 12.4746,
  );
//ボタンを押した時の移動位置
  static const CameraPosition _kMountain = CameraPosition(
      bearing: 12.8334901395799,
      target: LatLng(34.68566097289177, 132.71005701273683),
      tilt: 59.440717697143555,
      zoom: 16.151926040649414);


  Set<Marker> markersa  ={};

  //初期化処理
  @override
  void initState() {
    super.initState();
    _initializeMapController();
    fetchData().then((data) {
      setState(() {
        markersa = data;
      });
    });      
  }

  @override
void dispose() {
  mapController.dispose();
  super.dispose();
}
    Future<Set<Marker>> fetchData() async {
    // 非同期のデータ取得処理を実装する
    // Set<Marker> 型のデータを取得する
    Set<Marker> data = await jsonlls.getJsons();
    _adjustCameraPosition(data);
    return data;
  }
void _initializeMapController() async {
  final GoogleMapController controller = await _controller.future;
  setState(() {
    mapController = controller;
  });
}
void _adjustCameraPosition(Set<Marker> markers) {
  double minLatitude = double.infinity;
  double maxLatitude = -double.infinity;
  double minLongitude = double.infinity;
  double maxLongitude = -double.infinity;

  for (Marker marker in markers) {
    double latitude = marker.position.latitude;
    double longitude = marker.position.longitude;

    if (latitude < minLatitude) {
      minLatitude = latitude;
    }
    if (latitude > maxLatitude) {
      maxLatitude = latitude;
    }
    if (longitude < minLongitude) {
      minLongitude = longitude;
    }
    if (longitude > maxLongitude) {
      maxLongitude = longitude;
    }
  }

  LatLngBounds bounds = LatLngBounds(
    southwest: LatLng(minLatitude, minLongitude),
    northeast: LatLng(maxLatitude, maxLongitude),
  );

  CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);

  mapController.moveCamera(cameraUpdate);
}
  

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      
      body: GoogleMap(
        
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        //_kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          //OnMapPin(urlll, markersa);
        },
        
        markers: markersa,
        onLongPress: _onLongPress,
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,    
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       FloatingActionButton.extended(
        heroTag: 'fmapb',
            onPressed: () async{
                  //await 
                  Navigator.of(context).pop(
                       // MaterialPageRoute(builder: (context) {
                         // return SaHomePage();
                        //}),
                      );
            },
            label: const Text('戻る'),
            icon: const Icon(Icons.arrow_forward),
          ),   
        SizedBox(width: 16),  
      FloatingActionButton.extended(
        heroTag: 'fmap2',
        onPressed: _goToTravel,
        label: const Text('To the travel!'),
        icon: const Icon(Icons.wallet_travel),
      ),
        ],
      ),
    );
    
  }
 
       
//ボタンを押した時の処理
  Future<void> _goToTravel() async {
    final GoogleMapController controller = await _controller.future;
  
    controller.animateCamera(CameraUpdate.newCameraPosition(_kMountain));
  }

  void _onLongPress(LatLng latLng) {
    setState(() {
      String ltxt = "緯度:"+latLng.latitude.toString()+ "\n経度:"+latLng.longitude.toString();
      markersa.add(Marker(
        markerId: MarkerId(latLng.toString()),
        infoWindow: InfoWindow(title: "現在位置", snippet: ltxt),
        position: latLng,
      ));
      _adjustCameraPosition(markersa);
    });
  }
}
///

