import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/components/constants.dart';

class VideoPlayerPage extends StatefulWidget {
  String? videoUrl;
  String? thumbnail;
  VideoPlayerPage({super.key, this.videoUrl, this.thumbnail});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

String dummyUrl =
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
// String videoUrl = "https://app2.radigone.com/slideshow/1691494087620.mp4";

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  bool _isError = false;

  String assetVideoPath = 'assets/videos/9th-may.mp4';
  String dummyThumbnail = PLACEHOLDER_PFP;

  late CachedVideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  late CustomVideoPlayerSettings _customVideoPlayerSettings;

  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  late CustomVideoPlayerWebSettings _customVideoPlayerWebSettings;

  @override
  void initState() {
    super.initState();

    _customVideoPlayerSettings = CustomVideoPlayerSettings(
        showSeekButtons: true,
        thumbnailWidget: Image.network(
          widget.thumbnail ??
              dummyThumbnail,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        alwaysShowThumbnailOnVideoPaused: true,
        allowVolumeOnSlide: true,
        autoFadeOutControls: true);

    _customVideoPlayerWebSettings = CustomVideoPlayerWebSettings(
      src: widget.videoUrl ?? dummyUrl,
      autoplay: true,
      thumbnailPath: widget.thumbnail ??
          dummyThumbnail,
    );


    initializedVideo();


  }

  Future<void> initializedVideo()async{

    try{

      print('In Try block');
      _videoPlayerController =
      CachedVideoPlayerController.network(widget.videoUrl ?? dummyUrl)
        ..initialize().then((onValue) => setState(() {}));


      _customVideoPlayerController = CustomVideoPlayerController(
          context: context,
          videoPlayerController: _videoPlayerController,
          customVideoPlayerSettings: _customVideoPlayerSettings);

      _customVideoPlayerWebController = CustomVideoPlayerWebController(
          webVideoPlayerSettings: _customVideoPlayerWebSettings);
    }
    catch(error){
      print('Error in Intializing the video: ${error.toString()}');
    }


  }


  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    _videoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kIsWeb
                ? CustomVideoPlayerWeb(
                    customVideoPlayerWebController:
                        _customVideoPlayerWebController)
                : CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController)
          ],
        ),
      ),
    );
  }
}
