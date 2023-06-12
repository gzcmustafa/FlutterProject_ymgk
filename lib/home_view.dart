import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final AssetsAudioPlayer assetsAudioPlayer;

  const HomeView({super.key, required this.assetsAudioPlayer});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              onPressedMusic();
            },
            icon: Icon(
              isOpen ? Icons.volume_up : Icons.volume_off,
              color: Colors.blue,
            ),
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/page3.png"), fit: BoxFit.fitWidth)),
            ),
          ),
          buildAnswerWidget("A", "30-54-116-52-17-6-200-8-152", 1, context),
          buildAnswerWidget("B", "94 -76-82-108-42-16-36-174-50-200-8-152", 2, context),
          buildAnswerWidget("C", "30-54-116-52-17-6-200-8-152", 3, context),
        ],
      ),
    );
  }

  Widget buildAnswerWidget(String leadingTxt, String answer, int answerId, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (answerId == 2) {
          Get.defaultDialog(
            title: "Tebrikler",
            titlePadding: const EdgeInsets.all(20),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/alert.png"), fit: BoxFit.fitWidth)),
              ),
            ),
            confirm: buildBtn("Tekrar Oyna", 1),
            cancel: buildBtn("Çıkış", 2),
          );
        } else {
          Get.snackbar("Hata", "Yanlış Cevap", backgroundColor: Colors.red, colorText: Colors.white, duration: const Duration(milliseconds: 800));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.35), borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: ListTile(leading: CircleAvatar(radius: 20, child: Text(leadingTxt)), title: Text(answer)),
          ),
        ),
      ),
    );
  }

  Widget buildBtn(String text, int id) {
    return GestureDetector(
      onTap: () {
        if (id == 1) {
          Navigator.pop(context);
        } else {
          exit(0);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ))),
      ),
    );
  }

  Future<void> onPressedMusic() async {
    setState(() {
      isOpen = !isOpen;
    });
    if (widget.assetsAudioPlayer.isPlaying.value) {
      await widget.assetsAudioPlayer.pause();
    } else {
      await widget.assetsAudioPlayer.play();
    }
  }
  /* 
  IconButton(
            onPressed: () async {
              await onPressed();
            },
            icon: Icon(isOpen ? Icons.music_note : Icons.music_off),
            iconSize: 30,
          ),
          const SizedBox(width: 10)
   */
}
//a) 30-54-116-52-17-6-200-8-152  B) 30-54-116-52-17-6-200-8-152   C) 30-54-116-52-17-6-200-8-152
