import 'dart:core';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math';

class AutoDetectPlane extends StatefulWidget {
  final String state;
  final double data;

  AutoDetectPlane({this.state, this.data});
  
  @override
  State<StatefulWidget> createState() {
    return _AutoDetectPlaneState(
      state: this.state,
      data: this.data,
    );
  }
}

class _AutoDetectPlaneState extends State<AutoDetectPlane> {
  ArCoreController arCoreController;
  ArCoreNode node;
  bool placed = false;
  int multiplier;
  int walle;
  String state;
  double data;

  _AutoDetectPlaneState({this.state, this.data});

  double getData(type) {
    if (state == type) {
      return data;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
        backgroundColor: Color(0xff5361c2),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff89e5ff)),
          onPressed: () {
            while (Navigator.canPop(ctxt)) {
              Navigator.pop(ctxt);
            }
          }
        ),
        title: new Text ("AR Viewer", textAlign: TextAlign.center),
      ),
        body: Stack(
          children: <Widget>[
            ArCoreView(
              onArCoreViewCreated: _onArCoreViewCreated,
              enableUpdateListener: true,
              enableTapRecognizer: true,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Day"),
                    color: Color(0xff5361c2),
                    onPressed: () => _day(),
                  ),
                  RaisedButton(
                    child: Text("Week"),
                    color: Color(0xff5361c2),
                    onPressed: () => _week(),
                  ),
                  RaisedButton(
                    child: Text("Year"),
                    color: Color(0xff5361c2),
                    onPressed: () => _year(),
                  ),
                  RaisedButton(
                    child: Text("Lifetime"),
                    color: Color(0xff5361c2),
                    onPressed: () => _lifetime(),
                  ),
                  RaisedButton(
                    child: Text("Clear"),
                    onPressed: () => _clear(),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  void _clear() {
    for (int i = 0; i < walle; i++) {
      arCoreController.removeNode(nodeName: 'a');
    }
  }

  void _day() {
    multiplier = 1;
    walle = 1;
  }

  void _week() {
    multiplier = 7;
    walle = 7;
  }

  void _year() {
    multiplier = 365;
    walle = 52;
  }

  void _lifetime() {
    multiplier = 365*80;
    walle = 80;
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _spawnTrashPyramid(getData("trash") * multiplier, walle, hit); //Takes kilograms
    _spawnPizzaPyramid(getData("food") * multiplier, hit);  //Takes pounds
    _spawnRedBullPyramidGal(getData("water") * multiplier, hit); //Takes liters
  }

  void _spawnTrashPyramid(double trash, int numCubes, ArCoreHitTestResult plane) {
    if (trash != 0) {
      double density = 56.3613;
      double trashPerCube = trash/numCubes;
      double cubeSize = trashPerCube/density;
      cubeSize = pow(cubeSize, 1/3);
      int l = 1;
      int n = 1;
      double tapx = plane.pose.translation.x;
      double tapy = plane.pose.translation.y;
      double tapz = plane.pose.translation.z;
      while (numCubes.toDouble()/l > 1.0) {
        n++;
        l += (n*n);
      }
      for (int z = n; z > 0; z--) {
        for (int x = z; x > (z*-1); x -= 2) {
          for (int y = z; y > (z*-1); y -= 2) {
            if (numCubes > 0) {
              _placeCubeAtPos(vector.Vector3(tapx + (x.toDouble()*cubeSize*.55), tapz + ((n*cubeSize) - (z.toDouble()*cubeSize)), tapy + (y.toDouble()*cubeSize*.55)), cubeSize);
              numCubes--;
            }
          }
        }
      }
    }
  }

  void _spawnRedBullPyramidGal(double liquid, ArCoreHitTestResult plane) {
    if (liquid != 0) {
      int numCans = (liquid/208.19755).round();
      walle = numCans;
      int l = 1;
      int n = 1;
      final double tapx = plane.pose.translation.x;
      final double tapy = plane.pose.translation.y;
      final double tapz = plane.pose.translation.z;
      while (numCans.toDouble()/l > 1.0) {
        n++;
        l += (n*n);
      }
      for (int z = n; z > 0; z--) {
        for (int x = z; x > (z*-1); x -= 2) {
          for (int y = z; y > (z*-1); y -= 2) {
            if (numCans > 0) {
              _placeGalRedBullAtPos(vector.Vector3(tapx + (x.toDouble()*0.584*.55), tapz + ((n*0.876) - (z.toDouble()*0.876)), tapy + (y.toDouble()*0.584*.55)));
              numCans--;
            }
          }
        }
      }
    }
  }

  void _spawnPizzaPyramid(double pounds, ArCoreHitTestResult plane) {
    if (pounds != 0) {
      int numBoxes = (pounds/1.1672).round();
      walle = numBoxes;
      int l = 1;
      int n = 1;
      final double tapx = plane.pose.translation.x;
      final double tapy = plane.pose.translation.y;
      final double tapz = plane.pose.translation.z;
      while (numBoxes.toDouble()/l > 1.0) {
        n++;
        l += (n*n);
      }
      for (int z = n; z > 0; z--) {
        for (int x = z; x > (z*-1); x -= 2) {
          for (int y = z; y > (z*-1); y -= 2) {
            if (numBoxes > 0) {
              _placePizzaAtPos(vector.Vector3(tapx + (x.toDouble()*0.254*.55), tapz + ((n*0.05) - (z.toDouble()*0.05)), tapy + (y.toDouble()*0.254*.55)));
              numBoxes--;
            }
          }
        }
      }
    }
  }

  /*
    void _spawnRedBullPyramid(double liquid, ArCoreHitTestResult plane) {
    int numCans = liquid~/12;
    int l = 1;
    int n = 1;
    final double tapx = plane.pose.translation.x;
    final double tapy = plane.pose.translation.y;
    final double tapz = plane.pose.translation.z;
    while (numCans.toDouble()/l > 1.0) {
      n++;
      l += (n*n);
    }
    for (int z = n; z > 0; z--) {
      for (int x = z; x > (z*-1); x -= 2) {
        for (int y = z; y > (z*-1); y -= 2) {
          _placeRedBullAtPos(vector.Vector3(tapx + (x.toDouble()*0.06*.55), tapz + ((n*0.16) - (z.toDouble()*0.16)), tapy + (y.toDouble()*0.06*.55)));
        }
      }
    }
  }

  Future _placeRedBullAtPos(vector.Vector3 v) async {
    final ByteData textureBytes = await rootBundle.load('assets/bottlelabel.png');
    final material = ArCoreMaterial(
      color: Color.fromARGB(255, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
      metallic: 1,
    );
    final cylinder = ArCoreCylinder(
      materials: [material],
      radius: .16,
      height: .03,
    );
    node = ArCoreNode(
        shape: cylinder,
        position: v
        );
    arCoreController.addArCoreNodeWithAnchor(node);
  }
  */

  void _placeCubeAtPos(vector.Vector3 v, double size) async {
    final ByteData textureBytes = await rootBundle.load('images/trashcube.png');
    final material = ArCoreMaterial(
        roughness: 1,
        color: Color.fromARGB(255, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(size, size, size),
    );
    node = ArCoreNode(
        shape: cube,
        position: v,
        name: 'a'
    );
    arCoreController.addArCoreNodeWithAnchor(node);
  }

  void _placeGalRedBullAtPos(vector.Vector3 v) async {
    final ByteData textureBytes = await rootBundle.load('images/bottlelabel.png');
    final material = ArCoreMaterial(
      color: Color.fromARGB(255, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
      metallic: 1,
    );
    final cylinder = ArCoreCylinder(
      materials: [material],
      radius: .876,
      height: .292,
    );
    node = ArCoreNode(
        shape: cylinder,
        position: v
        );
    arCoreController.addArCoreNodeWithAnchor(node);
  }

  void _placePizzaAtPos(vector.Vector3 v) async {
    final ByteData textureBytes = await rootBundle.load('images/pizzabox.png');
    final material = ArCoreMaterial(
      color: Color.fromARGB(255, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
      metallic: 1,
    );
    final box = ArCoreCube(
      materials: [material],
      size: vector.Vector3(.254, .04445, .254),
    );
    node = ArCoreNode(
        shape: box,
        position: v
        );
    arCoreController.addArCoreNodeWithAnchor(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}


