part of 'facts_bloc.dart';

abstract class FactsEvent {
  const FactsEvent();
}

class AnotherFactClicked extends FactsEvent {
  AnotherFactClicked();
}
