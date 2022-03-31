import 'package:cat_facts_app/repository/facts_repository.dart';
import 'package:cat_facts_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/facts_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FactsRepository(),
      child: BlocProvider(
        create: (context) => FactsBloc(context.read<FactsRepository>())
          ..add(AnotherFactClicked()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(),
        ),
      ),
    );
  }
}
