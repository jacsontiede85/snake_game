// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameController on GameControllerBase, Store {
  late final _$jogoAtom =
      Atom(name: 'GameControllerBase.jogo', context: context);

  @override
  ObservableList<ObservableList<Pixel>> get jogo {
    _$jogoAtom.reportRead();
    return super.jogo;
  }

  @override
  set jogo(ObservableList<ObservableList<Pixel>> value) {
    _$jogoAtom.reportWrite(value, super.jogo, () {
      super.jogo = value;
    });
  }

  late final _$startGameAtom =
      Atom(name: 'GameControllerBase.startGame', context: context);

  @override
  bool get startGame {
    _$startGameAtom.reportRead();
    return super.startGame;
  }

  @override
  set startGame(bool value) {
    _$startGameAtom.reportWrite(value, super.startGame, () {
      super.startGame = value;
    });
  }

  late final _$positionPixelComidaAtom =
      Atom(name: 'GameControllerBase.positionPixelComida', context: context);

  @override
  Map<dynamic, dynamic> get positionPixelComida {
    _$positionPixelComidaAtom.reportRead();
    return super.positionPixelComida;
  }

  @override
  set positionPixelComida(Map<dynamic, dynamic> value) {
    _$positionPixelComidaAtom.reportWrite(value, super.positionPixelComida, () {
      super.positionPixelComida = value;
    });
  }

  late final _$dificuldadeAtom =
      Atom(name: 'GameControllerBase.dificuldade', context: context);

  @override
  int get dificuldade {
    _$dificuldadeAtom.reportRead();
    return super.dificuldade;
  }

  @override
  set dificuldade(int value) {
    _$dificuldadeAtom.reportWrite(value, super.dificuldade, () {
      super.dificuldade = value;
    });
  }

  late final _$numMomimentosAtom =
      Atom(name: 'GameControllerBase.numMomimentos', context: context);

  @override
  int get numMomimentos {
    _$numMomimentosAtom.reportRead();
    return super.numMomimentos;
  }

  @override
  set numMomimentos(int value) {
    _$numMomimentosAtom.reportWrite(value, super.numMomimentos, () {
      super.numMomimentos = value;
    });
  }

  late final _$comidasCapturadasAtom =
      Atom(name: 'GameControllerBase.comidasCapturadas', context: context);

  @override
  int get comidasCapturadas {
    _$comidasCapturadasAtom.reportRead();
    return super.comidasCapturadas;
  }

  @override
  set comidasCapturadas(int value) {
    _$comidasCapturadasAtom.reportWrite(value, super.comidasCapturadas, () {
      super.comidasCapturadas = value;
    });
  }

  late final _$youLoseAtom =
      Atom(name: 'GameControllerBase.youLose', context: context);

  @override
  bool get youLose {
    _$youLoseAtom.reportRead();
    return super.youLose;
  }

  @override
  set youLose(bool value) {
    _$youLoseAtom.reportWrite(value, super.youLose, () {
      super.youLose = value;
    });
  }

  @override
  String toString() {
    return '''
jogo: ${jogo},
startGame: ${startGame},
positionPixelComida: ${positionPixelComida},
dificuldade: ${dificuldade},
numMomimentos: ${numMomimentos},
comidasCapturadas: ${comidasCapturadas},
youLose: ${youLose}
    ''';
  }
}
