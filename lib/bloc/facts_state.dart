part of 'facts_bloc.dart';

class FactsState {}

class FactsLoading extends FactsState {}

class FactsLoaded extends FactsState {
  final String text;
  final DateTime updatedAt;
  final dynamic factsList;

  FactsLoaded(this.text, this.updatedAt, this.factsList);

  FactsLoaded copyWith({
    required String text,
    required DateTime updatedAt,
    required dynamic factsList,
  }) {
    return FactsLoaded(this.text, this.updatedAt, this.factsList);
  }
}
