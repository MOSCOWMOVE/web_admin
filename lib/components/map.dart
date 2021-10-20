import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:moscow_move_mobile/PointOperations.dart';

import '../fetch.dart';


class Map extends StatefulWidget {
  const Map({ Key key }) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  LocalStorage storage = new LocalStorage('localstorage_app');

  List<dynamic> points = [];

  Future<dynamic> getPointPaginationData(String url) {
    fetch(url).then(
      (value)  {
        //if (value["next"] != null) {
        //  getPointPaginationData(value["next"]);
        //}
          // ignore: unnecessary_cast
          SetPoints((value["results"] as List<dynamic>).map((e) {
            return Point(
              id: e["zone_id"], 
              cords: [e["position"]["longitude"], 
              e["position"]["latitude"]], 
              type: e["accessibility"]["distance"], 
              area: e["square"]);
          }).toList() as List<Point>);
          /*points = (value["results"] as List<dynamic>).map((e)  {
            return {
            "id" : e["zone_id"],
            "cords" : [e["position"]["longitude"], e["position"]["latitude"]],
            "type" : e["accessibility"]["distance"],
            "amount": 1,
            "area" : e["square"]};
          }).toList();
          dots["markers"] = points;
          storage.setItem("dots", jsonEncode(dots));*/
        });
        
  }

  void initState() {
    getPointPaginationData("api/sport_zones");
    /*fetch_pagination("api/sport_zones").then((value) {
      SetPoints((value as List<dynamic>).map((e) {
            return Point(
              id: e["zone_id"], 
              cords: [e["position"]["longitude"], 
              e["position"]["latitude"]], 
              type: e["accessibility"]["distance"], 
              area: e["square"]);
          }).toList() as List<Point>);
    });*/
  }

  dynamic dots = {
    "markers" : []
    };

  @override
  Widget build(BuildContext context) {
    

    storage.setItem('dots', jsonEncode(dots));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'map',
            (int id) => html.IFrameElement()
          ..width = (width - 270 * 2).toString()+"px"
          ..height = height.toString()+"px"
          ..src = 'lib/components/assets/dist/index.html'
          ..style.border = 'none'
          ..style.height = "100vh"
          ..style.width = (width - 260 * 2).toString()+"px"
          ..style.position = "fixed"
          ..style.left = "260px",
          );
    return const Scaffold(
        body: HtmlElementView(viewType: "map",)
      );
  }
}