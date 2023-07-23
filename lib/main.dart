// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';


//void main() => runApp(const MyApp());

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MyApp(camera: firstCamera)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', camera: camera,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title,required this.camera}) : super(key: key);
  final String title;
  final CameraDescription camera;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late FlutterGifController controller1, controller2, controller3, controller4;
  late VideoPlayerController controller5;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    controller1 = FlutterGifController(vsync: this);
    controller2 = FlutterGifController(vsync: this);
    controller4 = FlutterGifController(vsync: this);
    loadVideoPlayer();
    cameraAccess();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller1.repeat(
        min: 0,
        max: 8,
        period: const Duration(milliseconds: 200),
      );
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller2.repeat(
        min: 0,
        max: 4,
        period: const Duration(milliseconds: 200),
      );
      controller4.repeat(
        min: 0,
        max: 6,
        period: const Duration(milliseconds: 200),
      );
    });
    controller3 = FlutterGifController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  cameraAccess(){
     _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  loadVideoPlayer(){
     controller5 = VideoPlayerController.asset('assets/Blossom.mp4');
     controller5.addListener(() {
        setState(() {});
     });
    controller5.initialize().then((value){
        setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Display gif"),
              ),
              Tab(
                child: Text("Control the gif"),
              ),
              Tab(
                child: Text("Display video"),
              ),
              Tab(
                child: Text("Take a picture"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [

            ListView(
              children: [
                const Text("Internet"),
                GifImage(
                  controller: controller2,
                  // image: const NetworkImage(
                  //     "http://img.mp.itc.cn/upload/20161107/5cad975eee9e4b45ae9d3c1238ccf91e.jpg"),                
                  image: const AssetImage("assets/flowers.gif"),
                  height: 100,
                  width: 200,
                ),
                const Text("From asset file"),
                GifImage(
                  controller: controller1,
                  image: const AssetImage("assets/mygif.gif"),
                  height: 100,
                  width: 200,
                ),
                
                const Text("MemoryImage (eg. Base64Url)"),
                GifImage(
                  controller: controller4,
                  image: const AssetImage("assets/earth.gif"),
                  height: 100,
                  width: 200, 
                )
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      child: const Text("Infinite loop"),
                      onPressed: () {
                        controller3.repeat(
                            min: 0,
                            max: 8,
                            period: const Duration(milliseconds: 500));
                      },
                    ),
                    ElevatedButton(
                      child: const Text("Pause"),
                      onPressed: () {
                        controller3.stop();
                      },
                    ),
                    ElevatedButton(
                      child: const Text("Play once"),
                      onPressed: () {
                        controller3.animateTo(5,
                            duration: const Duration(milliseconds: 1000));
                      },
                    )
                  ],
                ),
                Slider(
                  onChanged: (v) {
                    controller3.value = v;
                    setState(() {});
                  },
                  max: 8,
                  min: 0,
                  value: controller3.value,
                ),
                GifImage(
                  controller: controller3,
                  image: const AssetImage("assets/mygif.gif"),
                  height: 100,
                  width: 200, 
                ),
              ],
            ),

            ListView(
              children:[
                  AspectRatio( 
                    aspectRatio: 7/4 * controller5.value.aspectRatio,
                     child: VideoPlayer(controller5),

                  ),

                  Text("Total Duration: ${controller5.value.duration}"),

                  VideoProgressIndicator(
                    controller5, 
                    allowScrubbing: true,
                    colors:const VideoProgressColors(
                        backgroundColor: Colors.redAccent,
                        playedColor: Colors.green,
                        bufferedColor: Colors.purple,
                    )
                  ),

                  Row(
                      children: [
                         IconButton(
                             onPressed: (){
                               if(controller5.value.isPlaying){
                                 controller5.pause();
                               }else{
                                 controller5.play();
                               }

                               setState(() {
                                 
                               });
                             }, 
                             icon:Icon(controller5.value.isPlaying?Icons.pause:Icons.play_arrow)
                        ),

                        IconButton(
                             onPressed: (){
                               controller5.seekTo(const Duration(seconds: 0));

                               setState(() {
                                 
                               });
                             }, 
                             icon:const Icon(Icons.stop)
                        )
                      ],
                  )
              ]
            ),
            
            ListView(
              children: [
                FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the preview.
                      return CameraPreview(_controller);
                    } else {
                      // Otherwise, display a loading indicator.
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                FloatingActionButton(
                  // Provide an onPressed callback.
                  onPressed: () async {
                    // Take the Picture in a try / catch block. If anything goes wrong,
                    // catch the error.
                    try {
                      // Ensure that the camera is initialized.
                      await _initializeControllerFuture;

                      // Attempt to take a picture and get the file `image`
                      // where it was saved.
                      final image = await _controller.takePicture();
                      
                      
                      if (!mounted) return;

                      // If the picture was taken, display it on a new screen.
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayPictureScreen(
                            // Pass the automatically generated path to
                            // the DisplayPictureScreen widget.
                            imagePath: image.path,
                          ),
                        ),
                      );
                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      print(e);
                    }
                  },
                  child: const Icon(Icons.camera_alt),
                ),
              ],
            )],
          )
        ),
      );
  }
}


// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("**path: $imagePath");
    }
    return Scaffold(
      
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      // body: Image.file(File(imagePath)),
     
      body: Image.network(imagePath),
      
    );
  }
}




