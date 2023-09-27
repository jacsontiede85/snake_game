import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  Widget pixel = const SizedBox();

  List<List> quadro = [[]];

  Map positionPixel = {'x': 10, 'y': 10};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double larg = size.width/50;
    double alt = (size.height-56)/30;

    for(int y=0; y<30; y++){
      List eixoX = [
        for(int x=0; x<50; x++)
          Container(
            height: alt,
            width: larg,
            color: x%2==0? Colors.amber : Colors.amber.shade300,
          ),
      ];
      quadro.add(eixoX);
    }

    if(pixel!=null) {
      pixel = Container(
        height: alt,
        width: larg,
        color: Colors.red,
      );
    }

    quadro[positionPixel['x']][positionPixel['y']] = pixel;


    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) async {
        if (event is RawKeyDownEvent) {
          setState(() {
            if ( event.isKeyPressed(LogicalKeyboardKey.arrowDown) ) {
              print('arrowDown');
              positionPixel['y'] +=1;
              quadro[positionPixel['y']][positionPixel['x']] = pixel;
            } else if ( event.isKeyPressed(LogicalKeyboardKey.arrowUp) ) {
              print('arrowUp');
              positionPixel['y'] -=1;
              quadro[positionPixel['y']][positionPixel['x']] = pixel;
            }


            else if ( event.isKeyPressed(LogicalKeyboardKey.arrowLeft) ) {
              positionPixel['y'] -=1;
              quadro[positionPixel['x']][positionPixel['y']] = pixel;
            } else if ( event.isKeyPressed(LogicalKeyboardKey.arrowRight) ) {
              positionPixel['y'] +=1;
              quadro[positionPixel['x']][positionPixel['y']] = pixel;
            }
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Wrap(
            children: [
              for(var v in quadro)
                ...v
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
