import 'package:cat_facts_app/bloc/facts_bloc.dart';
import 'package:cat_facts_app/config/app_settings.dart';
import 'package:cat_facts_app/views/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  final scrollController = ScrollController();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              BlocBuilder<FactsBloc, FactsState>(builder: (context, state) {
                return state is FactsLoaded
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              '${AppSettings.catsImagesUrl}?${DateTime.now().millisecondsSinceEpoch.toString()}',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              state.text,
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(state.updatedAt),
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
              }),
              BlocBuilder<FactsBloc, FactsState>(builder: (context, state) {
                return TextButton(
                  key: const Key('click'),
                  onPressed: () =>
                      context.read<FactsBloc>().add(AnotherFactClicked()),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  child: const Text(
                    'Another fact',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History()));
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: const Text(
                  'History',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
