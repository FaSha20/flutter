# Flutter's display features

## Display gifs

 `flutter_gif` package, used for dispay and manipulate gifs (for example change the speed , size and ...)

### First, we need to define a controller that controls the GIF properties:
```
  FlutterGifController controller= FlutterGifController(vsync: this);
  
    GifImage(
         controller: controller,
         image: AssetImage("images/animate.gif"),
    )
```
### These are the most common operations in FlutterGifController:

- **Repeat** an operation that displays the gif for `n` milisecond from frame `i` to `j`.
  
```
controller1.repeat(
        min: i,
        max: j,
        period: const Duration(milliseconds: n),
      );
  ```

- **AnimateTo** an operation that jump from current frame to `n` frame.
  
```
controller3.animateTo(
          n,
         duration: const Duration(milliseconds: 1000)
        );
  ```

- **Value** an operation that jumpTo thrid frame(index from `v`).
  
```
controller.value = v;
  ```
--------------------------------------------------------------------------------------------------

`gif_view` is another package that displays and manioulate gifs from assets folder, net or memory:

- GIF from **Asset** 
```
  GifView.asset(
    'assets/gif1.gif',
    height: 200,
    width: 200,
    frameRate: 30, // default is 15 FPS
  )
```
- GIF from **Network** 
```
  GifView.network(
    'https://www.showmetech.com.br/wp-content/uploads/2015/09/happy-minion-gif.gif',
    height: 200,
    width: 200,
  )
```
- GIF from **Memory** 
```
  GifView.memory(
    _bytes,
    height: 200,
    width: 200,
  )
  ```


 ## Display Video stream

 We need to use the "video_player" plug-in to display video streaming.
 As before, we need to define a controller that manages video streaming.
 ```
controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
```
  Then we can use the controller to apply operationس on video, like pause and play or getting  display status of video.

  ```
onPressed: () {
    setState(() {
      // If the video is playing, pause it.
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        // If the video is paused, play it.
        _controller.play();
      }
    });
```

## Camera Access

We can have access to camera to take pictures using `image_picker` and `camera` package.
- With this operation we can obtain a list of the available cameras on the device.

```
final cameras = await availableCameras();
```
- Once we get a camera list , we have to create and initialize a `CameraController`
  
```
class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage(
    {Key? key, required this.cameras}) : super(key:key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}
class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
```

 - We can start using the `CameraPreview` widget from the `camera` package to display a preview of the camera’s feed.
the preview looks like below:

![1_au6fdZoAqZ996fRFlcYujA](https://github.com/FaSha20/flutter/assets/90645162/c8fcfb6d-6893-4275-b3c5-81b1160a58fc)

- To take picture we need to make a call to the `takePicture` method,

```
XFile picture = await _cameraController.takePicture();
```



  
