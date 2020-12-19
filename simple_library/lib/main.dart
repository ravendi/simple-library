import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplelibrary/database/local_storage_database.dart';
import 'package:simplelibrary/screens/home/home.dart';
import 'package:simplelibrary/screens/main_bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Library',
      home: BlocProvider(
        create: (context) => MainBloc(
          database: LocalStorageDatabase()
        ),
        child: Home(),
      ),
    );
  }
}