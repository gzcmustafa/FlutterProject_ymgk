import 'package:final_project_ymgk/onboard_second.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'onboard_widget_item.dart';

class OnboardFirst extends StatefulWidget {
  const OnboardFirst({super.key});

  @override
  State<OnboardFirst> createState() => _OnboardFirstState();
}

class _OnboardFirstState extends State<OnboardFirst> {
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    openMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnboardWidgetItem(assets: "assets/page1.png", btnText: "İleri", onPressed: () => onPressed(context)),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardSecond(assetsAudioPlayer: assetsAudioPlayer)));
  }

  Future openMusic() async {
    await assetsAudioPlayer.open(Audio("assets/ari-vzvz.mp3"), showNotification: false, volume: 2, loopMode: LoopMode.playlist);
  }
}


//a) 30-54-116-52-17-6-200-8-152  B) 30-54-116-52-17-6-200-8-152   C) 30-54-116-52-17-6-200-8-152
