part of 'case_cubit.dart';

abstract class CaseState extends Equatable {
  const CaseState();

  @override
  List<Object> get props => [];
}

class CaseInitial extends CaseState {}

class CaseLoaded extends CaseState {
  final CovidCase covidCase;
  final List<String> countries;

  CaseLoaded(this.covidCase, this.countries);

  @override
  List<Object> get props => [covidCase, countries];
}

class CaseLoadingFailed extends CaseState {
  final String message;

  CaseLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
