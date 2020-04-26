import 'dart:core';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math';

class AutoDetectPlane extends StatefulWidget {
  @override
  _AutoDetectPlaneState createState() => _AutoDetectPlaneState();
}

class _AutoDetectPlaneState extends State<AutoDetectPlane> {
  ArCoreController arCoreController;
  ArCoreNode node;
  bool placed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Screen Garbage'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableUpdateListener: true,
          enableTapRecognizer: true,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onNodeTap = _handleOnNodeTap;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.last;
    //_spawnTrashPyramid(64240, 80, hit); //Takes kilograms
    //_spawnPizzaPyramid(15.75, hit);  //Takes pounds
    _spawnRedBullPyramidGal(2250, hit); //Takes liters
  }

  void _spawnTrashPyramid(double trash, int numCubes, ArCoreHitTestResult plane) {
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

  void _spawnRedBullPyramidGal(double liquid, ArCoreHitTestResult plane) {
    int numCans = (liquid/208.19755).round();
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

  void _spawnPizzaPyramid(double pounds, ArCoreHitTestResult plane) {
    int numBoxes = (pounds/1.1672).round();
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

  /*void _addKraftTap(ArCoreHitTestResult plane) async {
    print(plane.toString());
    final ByteData textureBytes = await rootBundle.load('assets/krafttexture.png');

    final material = ArCoreMaterial(
      color: Color.fromARGB(255, 0, 0, 0),
      textureBytes: textureBytes.buffer.asUint8List(),
    );
    final cube = ArCoreCube(
      materials: [material],
    );
    node = ArCoreNode(
      shape: cube,
      position: plane.translation,
      rotation: plane.rotation,
    );
    arCoreController.addArCoreNodeWithAnchor(node);
  }

  void _addKraftTap(ArCoreHitTestResult plane) async {
    final ByteData textureBytes = await rootBundle.load('assets/krafttexture.png');
    print(textureBytes.buffer.asUint8List().toString());
    final material = ArCoreMaterial(
        color: Color.fromARGB(255, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());
    final sphere = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.1, 0.1, 0.1),
    );
    node = ArCoreNode(
        shape: sphere,
        position: plane.pose.translation,
        rotation: plane.pose.rotation);
    arCoreController.addArCoreNodeWithAnchor(node);

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

  void _handleOnPlaneDetected(ArCorePlane plane) {
    if (!placed) {
      _addSphere(arCoreController, plane);
      placed = true;
    }
  }
  }*/

  void _placeCubeAtPos(vector.Vector3 v, double size) async {
    final ByteData textureBytes = await rootBundle.load('assets/trashcube.png');
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
        position: v
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
    final ByteData textureBytes = await rootBundle.load('assets/pizzabox.png');
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

  void _handleOnNodeTap(String name) {
    arCoreController.removeNode(nodeName: name);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}