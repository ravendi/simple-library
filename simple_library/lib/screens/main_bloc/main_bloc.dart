import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplelibrary/database/database.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final Database database;

  MainBloc({@required this.database});

  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {

  }
}
