// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:snake_game/pixel_model.dart';
part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;
abstract class GameControllerBase with Store{
  GameControllerBase(){
    //criarJogo();
  }

  late Size size;
  setSize(size)=> this.size = size;

  @observable
  ObservableList<ObservableList<Pixel>> jogo = ObservableList<ObservableList<Pixel>>.of([]);

  @observable
  bool startGame = false;

  @observable
  Map positionPixelComida = {'x': 0, 'y': 0};

  String direction = 'down'; /* down, up, left, right */

  @observable
  int dificuldade = 420;
  @observable
  int numMomimentos=0;
  @observable
  int comidasCapturadas=0;

  @observable
  bool youLose = false;

  List<Map> snake = [
    {'x': 5, 'y': 1},
    {'x': 5, 'y': 2},
  ];

  criarJogo(){
    startGame = true;
    jogo = ObservableList<ObservableList<Pixel>>.of([]);
    for(int y=0; y<20; y++){
      ObservableList<Pixel> pixels = ObservableList<Pixel>.of([]);
      for(int x=0; x<20; x++){
        pixels.add(Pixel());
      }
      jogo.add(pixels);
    }
    criarSnake();
    criarComida();
    onActiveMove();
  }

  onActiveMove() async{
    while(!youLose){
      print(numMomimentos);
      await Future.delayed(Duration(milliseconds: dificuldade), (){
        switch(direction){
          case 'up': moveUp(); break;
          case 'down': moveDown(); break;
          case 'left': moveLeft(); break;
          case 'right': moveRight(); break;
          default: moveDown();
        }
      });
      numMomimentos++;
    }
  }

  criarSnake(){
    for(var pos in snake) {
      try{
        jogo[pos['y']][pos['x']] = Pixel(cor: Colors.purple);
      }catch(e){
        youLose =true;
      }
    }
  }

  criarComida(){
    var rng = Random();
    int x = rng.nextInt(jogo.length-1);
    int y = rng.nextInt(jogo.length-1);
    for(var v in snake)
      if(v == {'x': x, 'y': y}) {
        criarComida();
        break;
      }
    dificuldade -= 20;
    positionPixelComida = {'x': x, 'y': y};
    jogo[y][x] = Pixel(cor: Colors.pink);
  }

  setDirection(String value) {
    if(value=='up' && direction=='down') return;
    if(value=='down' && direction=='up') return;
    if(value=='left' && direction=='right') return;
    if(value=='right' && direction=='left') return;
    if(value==direction) return;
    direction = value;
  }

  moveUp(){
    print('moveUp');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX, 'y': posY-1});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    verifications(posX, posY-1);
    criarSnake();
  }

  moveDown(){
    print('moveDown');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX, 'y': posY+1});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    verifications(posX, posY+1);
    criarSnake();
  }

  moveLeft(){
    print('moveLeft');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX-1, 'y': posY});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    verifications(posX-1, posY);
    criarSnake();
  }

  moveRight(){
    print('moveRight');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX+1, 'y': posY});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    verifications(posX+1, posY);
    criarSnake();
  }

  verifications(posX, posY) async{
    if(!await comer(posX, posY))
      lose(posX, posY);
  }

  lose(posX, posY) async{
    List<Map> snakeN = [];
    snake.map((e) => snakeN.add(e)).toList();
    snakeN.removeAt(snake.length-1);
    for(var pos in snakeN) {
      if(pos['y'] == posY && pos['x'] == posX){
        youLose =true;
        return;
      }
    }
  }

  Future<bool> comer(posX, posY) async{
    if(positionPixelComida['x'] == posX && positionPixelComida['y'] == posY){
      snake.insert(snake.length-1, {'x': positionPixelComida['x'], 'y': positionPixelComida['y']});
      criarComida();
      comidasCapturadas++;
      return true;
    }
    return false;
  }

  newGame(){
    dificuldade = 400;
    numMomimentos=0;
    comidasCapturadas=0;
    youLose = false;
    snake = [
      {'x': 5, 'y': 1},
      {'x': 5, 'y': 2},
    ];
    positionPixelComida = {'x': 0, 'y': 0};
    direction = 'down';
    criarJogo();
  }
}