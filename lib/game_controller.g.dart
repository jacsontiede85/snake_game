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
youLose: ${youLose}
    ''';
  }
}
