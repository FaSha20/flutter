// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late FlutterGifController controller1, controller2, controller3, controller4;

  @override
  void initState() {
    controller1 = FlutterGifController(vsync: this);
    controller2 = FlutterGifController(vsync: this);
    controller4 = FlutterGifController(vsync: this);
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Different types of pictures"),
              ),
              Tab(
                child: Text("Way to control"),
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
                  image: const NetworkImage(
                      "http://img.mp.itc.cn/upload/20161107/5cad975eee9e4b45ae9d3c1238ccf91e.jpg"),                
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
                  image: const AssetImage("assets/flowers.gif"),
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
            )
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var title = 'Web Images';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: Image.network('https://picsum.photos/250?image=9',width: 1000,height: 3000,),
//       ),
//     );
//   }
// }