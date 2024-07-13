import 'dart:io';

import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:flutter/services.dart';
import 'package:ta/Home.dart';
import 'package:ta/DetailWisataKatalog/DetailWisata4.dart';
import 'package:vector_math/vector_math_64.dart' as VectorMath;
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ARMuseumWidget extends StatefulWidget {
  ARMuseumWidget({Key? key}) : super(key: key);
  @override
  _ARMuseumWidgetState createState() =>
      _ARMuseumWidgetState();
}

class _ARMuseumWidgetState extends State<ARMuseumWidget> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARNode? localObjectNode;
  ARNode? webObjectNode;
  ARAnchorManager? arAnchorManager;
  ARNode? fileSystemNode;
  HttpClient? httpClient;
  PageController _pageController = PageController();
  bool showCard = false;
  bool showCard1 = false;
  bool showCard2 = false;
  bool showMenu = false; // New variable to control menu visibility


  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _buildCards() {
    return [
      _buildCard('Tentang Museum Geologi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget dolor dapibus, ultricies massa ut, volutpat felis. Curabitur fermentum nisi nulla, consequat ultricies leo  ermentum nisi nulla, cconsequat ult cursus sed Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget dolor dapibus, ultricies massa ut, volutpat felis. Curabitur fermentum nisi nulla, consequat ultricies leo  ermentum nisi nulla, cconsequat ult cursus sed. Lorem ipsum dolor sit amet, .'),
      _buildCardWithYouTubeThumbnail(
        'Tentang Museum Geologi',
        'Sumber Video : youtube Endanesia',
        'https://youtu.be/lEo9KGP7rm4?si=cbLOYc35QE_S3un4',
      ),
    ];
  }

  List<Widget> _buildCards2() {
    return [
      _buildCardWithTitleAndImage('Lokasi Museum Geologi', 'Images/map2.png'),
    ];
  }



  List<Widget> _buildCards1() {
    return [
      _buildCardWithModelAndImage('Objek Berikut merupakan representasi dari bangunan Museum Geologi Bandung', "MODEL3D/museum.glb", "Images/museum.png"),
    ];
  }


  Widget _buildCard(String title, String description) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(0xFF003EB3).withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400.0,
                  height: 70,// Melebarkan hanya box yang menyeliputi teks judul
                  child: Card(
                    color: Color(0xFFBAE0FF),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 16, bottom: 10, left: 20),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 2, left: 8),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildCardWithTitleAndImage(String title, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(0xFF003EB3).withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400.0,
                  height: 70,// Melebarkan hanya box yang menyeliputi teks judul
                  child: Card(
                    color: Color(0xFFBAE0FF),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10, left: 20),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    _launchMaps(); // Panggil fungsi untuk membuka aplikasi peta
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imagePath, // Ganti dengan path relatif dari gambar yang ingin ditambahkan
                      width: double.infinity, // Mengisi lebar sesuai dengan layar
                      height: 200, // Atur tinggi gambar sesuai kebutuhan
                      fit: BoxFit.cover, // Atur tata letak gambar sesuai kebutuhan
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardWithModelAndImage(String description, String modelPath, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(0xFF003EB3).withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 160,
                          child: ModelViewer(
                            src: modelPath,
                            alt: "A 3D model",
                            autoRotate: true,
                            cameraControls: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Jarak antara model 3D dan gambar
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 160,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 12, left: 8),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardWithYouTubeThumbnail(String tittle, String description, String videoUrl) {
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId == null) {
      return Center(child: Text('Invalid YouTube URL'));
    }

    String thumbnailUrl = 'https://img.youtube.com/vi/$videoId/0.jpg';

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Color(0xFF003EB3).withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400.0,
                  height: 70,// Melebarkan hanya box yang menyeliputi teks judul
                  child: Card(
                    color: Color(0xFFBAE0FF),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 16, bottom: 10, left: 20),
                      child: Text(
                        tittle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () {
                      _launchURL(videoUrl);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(thumbnailUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 64.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 12, left: 8),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchMaps() async {
    const url = 'https://maps.app.goo.gl/GATQbErA9c4L3y6PA'; // Ganti dengan URL atau koordinat lokasi yang ingin Anda buka di aplikasi peta
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    arSessionManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.0, top: 20),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.scale,
                  duration: Duration(seconds: 2),
                  alignment: Alignment.bottomCenter,
                  child: DetailWisata4(), // ganti destinationPage dengan halaman tujuan Anda
                ),
              );
            },
            child: Container(
              width: 50.0,
              height: 50.0,
              child: Icon(
                Icons.arrow_circle_left_rounded,
                color: Colors.blueAccent,
                size: 42.0,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.0, top: 20),
            child: InkWell(
              onTap: () {
                // Handle notification icon tap
                // Implement your notification logic here
                onRemoveEverything();
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                child: Icon(
                  Icons.view_in_ar_rounded,
                  color: Colors.blueAccent,
                  size: 35.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            ARView(
              onARViewCreated: onARViewCreated,
              planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
            ),
            if (showCard)
              Positioned(
                bottom: 180.0,
                left: 26,
                right: 26,
                child: SizedBox(
                  height: 320.0,
                  child: PageView(
                    controller: _pageController,
                    children: _buildCards(),
                  ),
                ),
              ),
            if (showCard1)
              Positioned(
                bottom: 180.0,
                left: 26,
                right: 26,
                child: SizedBox(
                  height: 320.0,
                  child: PageView(
                    controller: _pageController,
                    children: _buildCards1(),
                  ),
                ),
              ),
            if (showCard2)
              Positioned(
                bottom: 180.0,
                left: 26,
                right: 26,
                child: SizedBox(
                  height: 320.0,
                  child: PageView(
                    controller: _pageController,
                    children: _buildCards2(),
                  ),
                ),
              ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (showMenu) // Conditional rendering of the menu
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                      margin: EdgeInsets.only(bottom: 10.0),
                      color: Colors.white.withOpacity(0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity, // Lebar tombol mengikuti lebar parent
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showCard = !showCard;
                                  showMenu = !showMenu;
                                  showCard1 = false;
                                  showCard2 = false;
                                });
                              },
                              child: Text("Tentang Museum Geologi"),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white, width: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,// Lebar tombol mengikuti lebar parent
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showCard1 = !showCard1;
                                  showMenu = !showMenu;
                                  showCard = false;
                                  showCard2 = false;
                                });
                              },
                              child: Text("Informasi Objek 3D"),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white, width: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,// Lebar tombol mengikuti lebar parent
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showCard2 = !showCard2;
                                  showMenu = !showMenu; // Pastikan untuk mengubah status showMenu ke false
                                  showCard = false;
                                  showCard1 = false;
                                });
                              },
                              child: Text("Lokasi Museum Geologi"),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white, width: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        primary: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Museum Geologi',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 1),
                                  Text(
                                    'Jl. Diponegoro No.57',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (showCard) {
                                  showCard = false; // Menyembunyikan kartu jika sedang ditampilkan
                                } else {
                                  showMenu = !showMenu; // Menampilkan/menyembunyikan menu jika tidak ada kartu yang ditampilkan
                                }
                                if (showCard1) {
                                  showCard1 = false; // Menyembunyikan kartu jika sedang ditampilkan
                                } else {
                                  showMenu = !showMenu; // Menampilkan/menyembunyikan menu jika tidak ada kartu yang ditampilkan
                                }
                                if (showCard2) {
                                  showCard2 = false; // Menyembunyikan kartu jika sedang ditampilkan
                                } else {
                                  showMenu = !showMenu; // Menampilkan/menyembunyikan menu jika tidak ada kartu yang ditampilkan
                                }
                              });
                            },
                            icon: Icon(
                              Icons.info_outline_rounded,
                              color: Colors.blue,
                              size: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager!.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "Images/triangle.png",
      showWorldOrigin: false,
      handlePans: true,
      handleRotation: true,
      showAnimatedGuide: true,
    );
    this.arObjectManager!.onInitialize();

    this.arSessionManager!.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager!.onPanStart = onPanStarted;
    this.arObjectManager!.onPanChange = onPanChanged;
    this.arObjectManager!.onPanEnd = onPanEnded;
    this.arObjectManager!.onRotationStart = onRotationStarted;
    this.arObjectManager!.onRotationChange = onRotationChanged;
    this.arObjectManager!.onRotationEnd = onRotationEnded;
  }

  Future<void> _addLocalObjectAtOrigin() async {
    var newNode = ARNode(
      type: NodeType.localGLTF2,
      uri: "Models/Museum/museum.gltf",
      scale: VectorMath.Vector3(0.1, 0.1, 0.1),
      position: VectorMath.Vector3(0.0, 0.0, -2.0),
      rotation: VectorMath.Vector4(1.0, 0.0, 0.0, 0.0),
    );

    bool? didAddLocalNode = await this.arObjectManager!.addNode(newNode);

    if (didAddLocalNode!) {
      setState(() {
        this.localObjectNode = newNode;
      });
    }
  }

  Future<File> _downloadFile(String url, String filename) async {
    var request = await httpClient!.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    print("Downloading finished, path: " + '$dir/$filename');
    return file;
  }

  Future<void> _downloadAndUnpack(String url, String filename) async {
    var request = await httpClient!.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    print("Downloading finished, path: " + '$dir/$filename');

    // To print all files in the directory: print(Directory(dir).listSync());
    try {
      await ZipFile.extractToDirectory(
          zipFile: File('$dir/$filename'), destinationDir: Directory(dir));
      print("Unzipping successful");
    } catch (e) {
      print("Unzipping failed: " + e.toString());
    }
  }

  Future<void> onLocalObjectAtOriginButtonPressed() async {
    if (this.localObjectNode != null) {
      this.arObjectManager!.removeNode(this.localObjectNode!);
      this.localObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          uri: "Models/Museum/museum.gltf",
          scale: VectorMath.Vector3(0.1, 0.1, 0.1),
          position: VectorMath.Vector3(0.0, 0.0, -10.0),
          rotation: VectorMath.Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddLocalNode = await this.arObjectManager!.addNode(newNode);
      this.localObjectNode = (didAddLocalNode!) ? newNode : null;
    }

  }

  Future<void> onWebObjectAtOriginButtonPressed() async {
    if (this.webObjectNode != null) {
      this.arObjectManager!.removeNode(this.webObjectNode!);
      this.webObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri:
          "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
          scale: VectorMath.Vector3(0.2, 0.2, 0.2));
      bool? didAddWebNode = await this.arObjectManager!.addNode(newNode);
      this.webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }

  Future<void> onFileSystemObjectAtOriginButtonPressed() async {
    if (this.fileSystemNode != null) {
      this.arObjectManager!.removeNode(this.fileSystemNode!);
      this.fileSystemNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri: "LocalDuck.glb",
          scale: VectorMath.Vector3(0.2, 0.2, 0.2));
      //Alternative to use type fileSystemAppFolderGLTF2:
      //var newNode = ARNode(
      //    type: NodeType.fileSystemAppFolderGLTF2,
      //    uri: "Chicken_01.gltf",
      //    scale: VectorMath.Vector3(0.2, 0.2, 0.2));
      bool? didAddFileSystemNode = await this.arObjectManager!.addNode(newNode);
      this.fileSystemNode = (didAddFileSystemNode!) ? newNode : null;
    }
  }

  Future<void> onLocalObjectShuffleButtonPressed() async {
    if (this.localObjectNode != null) {
      var newScale = Random().nextDouble() / 3;
      var newTranslationAxis = Random().nextInt(3);
      var newTranslationAmount = Random().nextDouble() / 3;
      var newTranslation = VectorMath.Vector3(0, 0, 0);
      newTranslation[newTranslationAxis] = newTranslationAmount;
      var newRotationAxisIndex = Random().nextInt(3);
      var newRotationAmount = Random().nextDouble();
      var newRotationAxis = VectorMath.Vector3(0, 0, 0);
      newRotationAxis[newRotationAxisIndex] = 1.0;

      final newTransform = Matrix4.identity();

      newTransform.setTranslation(newTranslation);
      newTransform.rotate(newRotationAxis, newRotationAmount);
      newTransform.scale(newScale);

      this.localObjectNode!.transform = newTransform;
    }
  }

  Future<void> onWebObjectShuffleButtonPressed() async {
    if (this.webObjectNode != null) {
      var newScale = Random().nextDouble() / 3;
      var newTranslationAxis = Random().nextInt(3);
      var newTranslationAmount = Random().nextDouble() / 3;
      var newTranslation = VectorMath.Vector3(0, 0, 0);
      newTranslation[newTranslationAxis] = newTranslationAmount;
      var newRotationAxisIndex = Random().nextInt(3);
      var newRotationAmount = Random().nextDouble();
      var newRotationAxis = VectorMath.Vector3(0, 0, 0);
      newRotationAxis[newRotationAxisIndex] = 1.0;

      final newTransform = Matrix4.identity();

      newTransform.setTranslation(newTranslation);
      newTransform.rotate(newRotationAxis, newRotationAmount);
      newTransform.scale(newScale);

      this.webObjectNode!.transform = newTransform;
    }
  }
  Future<void> onRemoveEverything() async {
    /*nodes.forEach((node) {
      this.arObjectManager.removeNode(node);
    });*/
    anchors.forEach((anchor) {
      this.arAnchorManager!.removeAnchor(anchor);
    });
    anchors = [];
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere(
            (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult != null) {
      var newAnchor =
      ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
      bool? didAddAnchor = await this.arAnchorManager!.addAnchor(newAnchor);
      if (didAddAnchor!) {
        this.anchors.add(newAnchor);
        // Add note to anchor
        var newNode = ARNode(
            type: NodeType.localGLTF2,
            uri: "Models/Museum/museum.gltf",
            scale: VectorMath.Vector3(0.2, 0.2, 0.2),
            position: VectorMath.Vector3(0.0, 0.0, 0.0),
            rotation: VectorMath.Vector4(1.0, 0.0, 0.0, 0.0));
        bool? didAddNodeToAnchor =
        await this.arObjectManager!.addNode(newNode, planeAnchor: newAnchor);
        if (didAddNodeToAnchor!) {
          this.nodes.add(newNode);
        } else {
          this.arSessionManager!.onError("Adding Node to Anchor failed");
        }
      } else {
        this.arSessionManager!.onError("Adding Anchor failed");
      }
    }
  }

  onPanStarted(String nodeName) {
    print("Started panning node " + nodeName);
  }

  onPanChanged(String nodeName) {
    print("Continued panning node " + nodeName);
  }

  onPanEnded(String nodeName, Matrix4 newTransform) {
    print("Ended panning node " + nodeName);
    final pannedNode =
    this.nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //pannedNode.transform = newTransform;
  }

  onRotationStarted(String nodeName) {
    print("Started rotating node " + nodeName);
  }

  onRotationChanged(String nodeName) {
    print("Continued rotating node " + nodeName);
  }

  onRotationEnded(String nodeName, Matrix4 newTransform) {
    print("Ended rotating node " + nodeName);
    final rotatedNode =
    this.nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //rotatedNode.transform = newTransform;
  }
}
