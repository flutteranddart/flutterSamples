/*
 * @Author: Tan Dong 
 * @Date: 2019-03-12 22:25:10 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-12 22:25:10 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

const String beeUri =
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

class VideoSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoSamplesState();
  }
}

class VideoSamplesState extends State<VideoSamples> {
  VideoPlayerController _videoPlayerController;
  VideoPlayerController _netVideoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset('assets/Butterfly.mp4');
    _netVideoPlayerController = VideoPlayerController.network(beeUri);
    _netVideoPlayerController.setLooping(false);
    _netVideoPlayerController.initialize().then((_) {
      setState(() {
        print('缓冲完毕');
      });
    });
    _netVideoPlayerController.addListener(() {});
    // _netVideoPlayerController.play();
    // _videoPlayerController.setLooping(false);
    // _videoPlayerController.initialize().then((_) {
    //   setState(() {});
    // });
    // _videoPlayerController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoPlayer'),
      ),
      body: video2(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _netVideoPlayerController.dispose();
  }

  Widget video1() {
    return Center(
      child: _videoPlayerController.value.initialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : Container(),
    );
  }

  Widget video2() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          _netVideoPlayerController.value.initialized
              ? AspectRatio(
                  aspectRatio: _netVideoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_netVideoPlayerController),
                )
              : Container(),
          IconButton(
            onPressed: () {
              _netVideoPlayerController.value.initialized
                  ? _netVideoPlayerController.play()
                  : null;
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
