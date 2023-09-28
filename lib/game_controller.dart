// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

/*
  Arquitetura

  - Criar jogo
  - Criar snake
  - Criar comida
  - mover para cima
  - mover para baixo
  - mover para direita
  - mover para esquerda
  - pegar commida

 */

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:snake_game/pixel_model.dart';
part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;
abstract class GameControllerBase with Store{
  GameControllerBase(){
    criarJogo();
  }

  late Size size;
  setSize(size)=> this.size = size;

  @observable
  ObservableList<ObservableList<Pixel>> jogo = ObservableList<ObservableList<Pixel>>.of([]);

  Map positionPixel = {'x': 10, 'y': 10};

  String direction = 'down'; /* down, up, left, right*/

  @observable
  bool youLose = false;

  List<Map> snake = [
    {'x': 5, 'y': 1},
    {'x': 5, 'y': 2},
    {'x': 5, 'y': 3},
    {'x': 5, 'y': 4},
    {'x': 5, 'y': 5},
    {'x': 5, 'y': 6},
    {'x': 5, 'y': 7},
    {'x': 5, 'y': 8},
  ];

  criarJogo(){
    for(int y=0; y<20; y++){
      ObservableList<Pixel> pixels = ObservableList<Pixel>.of([]);
      for(int x=0; x<20; x++){
        pixels.add(Pixel());
      }
      jogo.add(pixels);
    }
    criarSnake();
    onMoveActive();
  }

  onMoveActive() async{
    int i=0;
    while(!youLose){
      print(i);
      await Future.delayed(const Duration(milliseconds: 200), (){
        switch(direction){
          case 'up': moveUp(); break;
          case 'down': moveDown(); break;
          case 'left': moveLeft(); break;
          case 'right': moveRight(); break;
          default: moveDown();
        }
      });
      i++;
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

  criarComida(){}

  moveUp(){
    print('moveUp');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX, 'y': posY-1});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    criarSnake();
  }

  moveDown(){
    print('moveDown');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX, 'y': posY+1});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    criarSnake();
  }

  moveLeft(){
    print('moveLeft');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX-1, 'y': posY});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    criarSnake();
  }

  moveRight(){
    print('moveRight');
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    snake.add({'x': posX+1, 'y': posY});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    criarSnake();
  }



  comer(){}
  loose(){}
  win(){}
}