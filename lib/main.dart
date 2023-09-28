// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake_game/game_controller.dart';
import 'package:snake_game/pixel_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Snake Game '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GameController controller = GameController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.setSize(size);

    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) async {
        if (event is RawKeyDownEvent) {
          setState(() {
            if ( event.isKeyPressed(LogicalKeyboardKey.arrowDown) ) {
              print('arrowDown');
              // positionPixel['y'] +=1;
              // quadro[positionPixel['y']][positionPixel['x']] = pixel;
            } else if ( event.isKeyPressed(LogicalKeyboardKey.arrowUp) ) {
              print('arrowUp');
              // positionPixel['y'] -=1;
              // quadro[positionPixel['y']][positionPixel['x']] = pixel;
            }


            // else if ( event.isKeyPressed(LogicalKeyboardKey.arrowLeft) ) {
            //   positionPixel['y'] -=1;
            //   quadro[positionPixel['x']][positionPixel['y']] = pixel;
            // } else if ( event.isKeyPressed(LogicalKeyboardKey.arrowRight) ) {
            //   positionPixel['y'] +=1;
            //   quadro[positionPixel['x']][positionPixel['y']] = pixel;
            // }
          });
        }
      },
      child: Scaffold(
        body: Container(
          color: Colors.amber.shade100,
          width: size.width,
          height: size.height,
          child: ListView(
            children: [
              Observer(builder: (_)=>
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      for(var pixels in controller.jogo)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            for(var v in pixels)
                              pixel(v),
                          ],
                        ),
                    ],
                  ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){},
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }

  Widget pixel(Pixel pixel)=>
      SizedBox(
        width: pixel.larg,
        height: pixel.alt,
        child: Container(
          width: pixel.larg,
          height: pixel.alt,
          color: pixel.cor,
        ),
      );
}
