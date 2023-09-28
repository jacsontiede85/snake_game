
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'pixel_model.g.dart';

class Pixel = PixelBase with _$Pixel;
abstract class PixelBase with Store{
  late Color cor;
  late double larg;
  late double alt;

  PixelBase({
    this.cor = Colors.green,
    this.larg = 20,
    this.alt = 20,
  });
}