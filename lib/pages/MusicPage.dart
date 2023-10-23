import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/widgets/MusicList.dart';

class MusicPage extends StatefulWidget {
  final String pathMusic;
  final String musicName;
  final String singerName;

  const MusicPage(
      {super.key,
      required this.pathMusic,
      required this.musicName,
      required this.singerName});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool hasPlaying = false;

  AudioPlayer player = AudioPlayer();
  Duration maxDuration = const Duration(seconds: 10);
  Duration currentDuration = const Duration(seconds: 0);

  void TogglePlay() {
    if (player.state == PlayerState.playing) {
      player.pause().then((value) {
        hasPlaying = false;
      });
    } else {
      player.resume().then((value) {
        hasPlaying = true;
      });
    }
    setState(() {});
  }

  double getCurrentDurationSlider() {
    return (currentDuration.inSeconds / maxDuration.inSeconds) * 100;
  }

  format(Duration d) => d.toString().substring(2, 7);

  @override
  void initState() {
    player.onDurationChanged.listen((Duration d) {
      setState(() => maxDuration = d);
    });
    player.onPositionChanged.listen((Duration p) {
      setState(() => currentDuration = p);
    });
    player.setSource(AssetSource(widget.pathMusic));
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "images/background.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5),
                const Color(0xFF31314F).withOpacity(1),
                const Color(0xFF31314F).withOpacity(1),
              ],
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const HomePage(),
                            ),
                          );
                        },
                        child: const Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 85,
                                  child: Text(
                                    widget.musicName,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.singerName,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Slider(
                            min: 0,
                            max: 100,
                            value: getCurrentDurationSlider(),
                            onChanged: (value) {
                              // player.seek(
                              //   Duration(
                              //     seconds: double.parse(
                              //             (maxDuration * (value / 100))
                              //                 .toString())
                              //         .toInt(),
                              //   ),
                              // );
                              setState(() {});
                            },
                            activeColor: Colors.white,
                            inactiveColor: Colors.white54,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  format(currentDuration),
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  format(maxDuration),
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.list,
                            color: Colors.white,
                            size: 32,
                          ),
                          GestureDetector(
                            onTap: () {
                              int index = listMusic.indexWhere((element) =>
                                  element.path == widget.pathMusic);

                              if (index == 0) return;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => MusicPage(
                                    musicName: listMusic[index - 1].musicName,
                                    pathMusic: listMusic[index - 1].path,
                                    singerName: listMusic[index - 1].singer,
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              CupertinoIcons.backward_end_fill,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                TogglePlay();
                              },
                              child: Icon(
                                !hasPlaying ? Icons.play_arrow : Icons.stop,
                                color: const Color(0xFF31314F),
                                size: 45,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              int index = listMusic.indexWhere((element) =>
                                  element.path == widget.pathMusic);
                              if (index == listMusic.length - 1) return;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => MusicPage(
                                    musicName: listMusic[index + 1].musicName,
                                    pathMusic: listMusic[index + 1].path,
                                    singerName: listMusic[index + 1].singer,
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              CupertinoIcons.forward_end_fill,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 32,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
