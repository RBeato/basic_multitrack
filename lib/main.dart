import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drum_machine_demo/services/sampler.dart';
import 'package:flutter_drum_machine_demo/views/metronome_display.dart';
import 'package:flutter_drum_machine_demo/views/sequencer.dart';
import 'package:flutter_drum_machine_demo/views/transport.dart';
import 'package:flutter_drum_machine_demo/views/pad-bank.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Sampler.init();
  runApp(Multitrack());
}

class Multitrack extends StatelessWidget {
  final String _title = "Flutter Beat Machine Demo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text(_title))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MetronomeDisplay(),
            Sequencer(),
            Transport(),
            // PadBank()
          ],
        ),
      ),
    );
  }
}
