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

  List<Map> snake = [
    {'x': 3, 'y': 1},
    {'x': 3, 'y': 2},
    {'x': 3, 'y': 3},
    {'x': 3, 'y': 4},
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
    while(i<10){
      print(i);
      await Future.delayed(const Duration(milliseconds: 500), (){
        moveDown();
      });
      i++;
    }
  }

  criarSnake(){
    for(var pos in snake) {
      jogo[pos['y']][pos['x']] = Pixel(cor: Colors.red);
    }
  }

  criarComida(){}

  moveUp(){}

  moveDown(){
    print('moveDown');
    // for(int pos=0; pos<(snake.reversed).length; pos++){
    //   print('moveDown->pos: $pos');
    //   if(pos==0)
    //
    //   else
    //     snake[pos]=snake[pos-1];
    // }
    int posX = snake[snake.length-1]['x'];
    int posY = snake[snake.length-1]['y'];
    print('posY: $posY');
    print('posX: $posX');
    snake.add({'x': posX, 'y': posY+1});
    jogo[snake[0]['y']][snake[0]['x']] = Pixel(cor: Colors.green);
    snake.removeAt(0);
    criarSnake();
    //jogo = jogo;
  }

  moveLeft(){}

  moveRigth(){}



  comer(){}
  loose(){}
  win(){}
}