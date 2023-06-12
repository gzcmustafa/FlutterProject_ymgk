import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:final_project_ymgk/home_view.dart';
import 'package:flutter/material.dart';

import 'onboard_widget_item.dart';

class OnboardSecond extends StatelessWidget {
  final AssetsAudioPlayer assetsAudioPlayer;
  const OnboardSecond({super.key, required this.assetsAudioPlayer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: OnboardWidgetItem(
          assets: "assets/page2.png",
          btnText: "Hadi Başlıyalım",
          onPressed: () => onPressed(context),
        ));
  }

  void onPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeView(assetsAudioPlayer: assetsAudioPlayer,)));
  }
  
}

//a) 30-54-116-52-17-6-200-8-152  B) 30-54-116-52-17-6-200-8-152   C) 30-54-116-52-17-6-200-8-152
