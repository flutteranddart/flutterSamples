/*
 * @Author: Tan Dong 
 * @Date: 2019-03-12 22:25:02 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-12 22:25:02 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

const String url =
    'https://api.soundcloud.com/tracks/266891990/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P';

class AudioSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AudioSamplesState();
  }
}

class AudioSamplesState extends State<AudioSamples> {
  AudioPlayer _audioPlayer = AudioPlayer();
  static AudioCache _cachePlayer = new AudioCache();
  @override
  void initState() {
    _audioPlayer.onAudioPositionChanged.listen((duration) {
      print('duration:$duration');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio'),
      ),
      body: audio1(),
    );
  }

  Widget audio1() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            _audioPlayer.setReleaseMode(ReleaseMode.STOP);
            _audioPlayer.play(url);
          },
          icon: Icon(Icons.play_circle_filled),
        ),
        IconButton(
          onPressed: () {
            _audioPlayer.stop();
          },
          icon: Icon(Icons.stop),
        ),
        IconButton(
          onPressed: () {
            _audioPlayer.resume();
          },
          icon: Icon(Icons.restore),
        ),
      ],
    );
  }

  Widget audio2() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            _cachePlayer.play('explosion.mp3');
          },
          icon: Icon(Icons.play_circle_filled),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.stop),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.restore),
        ),
      ],
    );
  }
}
