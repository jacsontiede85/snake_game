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
          if ( event.isKeyPressed(LogicalKeyboardKey.arrowDown) ) {
            controller.direction = 'down';
          } else if ( event.isKeyPressed(LogicalKeyboardKey.arrowUp) ) {
            controller.direction = 'up';
          } else if ( event.isKeyPressed(LogicalKeyboardKey.arrowLeft) ) {
            controller.direction = 'left';
          } else if ( event.isKeyPressed(LogicalKeyboardKey.arrowRight) ) {
            controller.direction = 'right';
          }
        }
      },
      child: Scaffold(
          body: Stack(
            children: [
              Container(
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
              Positioned(
                child: Center(
                  child: Observer(builder: (_)=>
                      Visibility(
                        visible: controller.youLose,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Text('Você perdeu!', style: TextStyle(fontSize: 30, color: Colors.white),),
                        ),
                      ),
                  ),
                ),
              ),
            ],
          )
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
          color: Colors.white,
          padding: const EdgeInsets.all(0.1),
          child: Container(
            width: pixel.larg,
            height: pixel.alt,
            color: pixel.cor,
            padding: const EdgeInsets.all(0.1),
          ),
        ),
      );
}
