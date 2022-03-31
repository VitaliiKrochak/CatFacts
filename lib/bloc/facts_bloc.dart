import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cat_facts_app/repository/facts_repository.dart';
part 'facts_event.dart';
part 'facts_state.dart';

class FactsBloc extends Bloc<FactsEvent, FactsState> {
  FactsBloc(this.factsRepository) : super(FactsState());
  final FactsRepository factsRepository;

  @override
  Stream<FactsState> mapEventToState(FactsEvent event) async* {
    if (event is AnotherFactClicked) {
      yield FactsLoading();
      final response = await factsRepository.getCatFacts();
      factsRepository.factList.add(response);
      yield FactsLoaded(
          response.text, response.updatedAt, factsRepository.factList);
    }
  }
}
