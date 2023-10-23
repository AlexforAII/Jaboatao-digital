import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/MusicPage.dart';

List<MusicInfo> listMusic = [
  MusicInfo(
      path: "musicas/Life in Rio.mp3",
      musicName: "Life in Rio",
      singer: "Ytb/Phonk"),
  MusicInfo(
      path: "musicas/MONTAGEM CANIBAL PHONK.mp3",
      musicName: "MONTAGEM CANIBAL PHONK",
      singer: "Ytb/Phonk"),
  MusicInfo(
      path: "musicas/MTG - PISTA TOMA.mp3",
      musicName: "PISTA TOMA",
      singer: "Ytb/Phonk"),
  MusicInfo(
      path: "musicas/ORQUESTRA MALDITA.mp3",
      musicName: "ORQUESTRA MALDITA",
      singer: "Ytb/Phonk"),
  MusicInfo(
      path: "musicas/REI DO BRASIL.mp3",
      musicName: "REI DO BRASIL",
      singer: "Ytb/Phonk"),
  MusicInfo(
      path: "musicas/TREINAMENTO DE FORÇA.mp3",
      musicName: "TREINAMENTO DE FORÇA",
      singer: "Ytb/Phonk"),
  MusicInfo(
      path: "musicas/TUCA DONKA.mp3",
      musicName: "TUCA DONKA",
      singer: "Ytb/Phonk"),
];

class MusicInfo {
  late String path;
  late String singer;
  late String musicName;

  MusicInfo(
      {required this.path, required this.musicName, required this.singer});
}

class MusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          Column(
            children: listMusic
                .asMap()
                .entries
                .map(
                  (e) => Container(
                    margin: EdgeInsets.only(top: 15, right: 12, left: 5),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFF30314D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          (e.key + 1).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 25),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => MusicPage(
                                  musicName: e.value.musicName,
                                  pathMusic: e.value.path,
                                  singerName: e.value.singer,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.value.musicName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Baixar",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "-",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "04:30",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            size: 25,
                            color: Color(0xFF31314F),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
