import 'package:emergency/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sound_generator/sound_generator.dart';
import 'package:sound_generator/waveTypes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying = false;
  double frequency = 3266;
  double balance = 0;
  double volume = 1;
  waveTypes waveType = waveTypes.SINUSOIDAL;
  int sampleRate = 96000;
  List<int> oneCycleData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.stop : Icons.play_arrow,
                  ),
                  onPressed: () {
                    setState(() {});
                    SoundGenerator.setFrequency(frequency);
                    SoundGenerator.setWaveType(waveType);
                    SoundGenerator.setVolume(volume);
                    isPlaying ? SoundGenerator.stop() : SoundGenerator.play();
                    isPlaying ? SoundGenerator.stop() : SoundGenerator.play();
                  }),
            ),
            appBar: AppBar(

              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(
                      isPlaying ? Icons.stop : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {});
                      SoundGenerator.setFrequency(frequency);
                      SoundGenerator.setWaveType(waveType);
                      SoundGenerator.setVolume(volume);
                      isPlaying ? SoundGenerator.stop() : SoundGenerator.play();
                      isPlaying ? SoundGenerator.stop() : SoundGenerator.play();
                    }),
              ],
              backgroundColor: Colors.red,
              title: const Text('Acil Durum Düdüğü'),
            ),
            body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Düdükler",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      frequency = 6863;

                                      SoundGenerator.setFrequency(6863);
                                      waveType = waveTypes.SINUSOIDAL;
                                      SoundGenerator.play();
                                    });
                                    setState(() {});
                                  },
                                  child: Icon(
                                    FlutterIcons.whistle_mco,
                                    textDirection: TextDirection.rtl,
                                    size: MediaQuery.of(context).size.width / 5,
                                    color: Colors.redAccent.shade200,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      frequency = 1250;

                                      SoundGenerator.setFrequency(1250);
                                      waveType = waveTypes.SINUSOIDAL;
                                      SoundGenerator.play();
                                    });
                                    setState(() {});
                                  },
                                  child: Icon(
                                    FlutterIcons.whistle_mco,
                                    size: MediaQuery.of(context).size.width / 4,
                                    color: Colors.red.shade900,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      frequency = 1800;

                                      SoundGenerator.setFrequency(1800);
                                      waveType = waveTypes.SINUSOIDAL;
                                      SoundGenerator.play();
                                    });
                                    setState(() {});
                                  },
                                  child: Icon(
                                    FlutterIcons.whistle_mco,
                                    size: MediaQuery.of(context).size.width / 5,
                                    color: Colors.redAccent.shade200,
                                  )),
                            ],
                          ),
                          SizedBox(height: 5),
                          SizedBox(height: 5),
                          SizedBox(height: 5),
                          Text(
                            "Frekans",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                              width: double.infinity,
                              height: 40,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                              this
                                                      .frequency
                                                      .toStringAsFixed(2) +
                                                  " Hz",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    Expanded(
                                      flex: 8, // 60%
                                      child: Slider(
                                          activeColor: Colors.indigo,
                                          min: 20,
                                          max: 10000,
                                          value: this.frequency,
                                          onChanged: (_value) {
                                            setState(() {
                                              this.frequency =
                                                  _value.toDouble();
                                              SoundGenerator.setFrequency(
                                                  this.frequency);
                                            });
                                          }),
                                    )
                                  ])),
                          SizedBox(height: 5),
                          Text("Ses Düzeyi",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                              width: double.infinity,
                              height: 40,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                              this.volume.toStringAsFixed(2),
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    Expanded(
                                      flex: 8, // 60%
                                      child: Slider(
                                          activeColor: Colors.indigo,
                                          min: 0,
                                          max: 1,
                                          value: this.volume,
                                          onChanged: (_value) {
                                            setState(() {
                                              this.volume = _value.toDouble();
                                              SoundGenerator.setVolume(
                                                  this.volume);
                                            });
                                          }),
                                    )
                                  ]))
                        ]),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Reflektörler",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FlashReflector(true, false);
                                }));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(20),
                                          right: Radius.circular(0)),
                                      color: Colors.indigo),
                                  child: Center(
                                      child: Text(
                                    "Ekran Reflektör",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
                                  height:
                                      MediaQuery.of(context).size.width / 4),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FlashReflector(false, true);
                                }));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(0),
                                          right: Radius.circular(20)),
                                      color: Colors.indigo),
                                  child: Center(
                                      child: Text(
                                    "Flaş Reflektör",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
                                  height:
                                      MediaQuery.of(context).size.width / 4),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FlashReflector(true, true);
                            }));
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              "Tümünü Çalıştır",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red),
                            width: MediaQuery.of(context).size.width * 0.99,
                            height: MediaQuery.of(context).size.height * 0.10,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Center(child: Text("Made by ARDA KALAYCI",style: TextStyle(color: Colors.grey),),),
                    )
                  ],
                ))));
  }

  @override
  void dispose() {
    super.dispose();
    SoundGenerator.release();
  }

  @override
  void initState() {
    super.initState();
    isPlaying = false;

    SoundGenerator.init(sampleRate);

    SoundGenerator.onIsPlayingChanged.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    SoundGenerator.onOneCycleDataHandler.listen((value) {
      setState(() {
        oneCycleData = value;
      });
    });

    SoundGenerator.setAutoUpdateOneCycleSample(true);
    //Force update for one time
    SoundGenerator.refreshOneCycleData();
  }
}
