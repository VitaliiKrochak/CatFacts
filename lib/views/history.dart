import 'package:cat_facts_app/models/cat_facts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/facts_bloc.dart';

class History extends StatelessWidget {
  final scrollController = ScrollController();

  History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15, left: 15),
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                  alignment: Alignment.topLeft,
                ),
              ),
              BlocBuilder<FactsBloc, FactsState>(builder: (context, state) {
                if (state is FactsLoaded) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return cards(state.factsList[index]);
                      },
                      itemCount: state.factsList.length);
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget cards(CatFactsModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            model.text,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            DateFormat('yyyy-MM-dd').format(model.updatedAt),
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
