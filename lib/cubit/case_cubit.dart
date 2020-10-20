import 'package:bloc/bloc.dart';
import 'package:cov_tracker/core/models/covidCase.dart';
import 'package:cov_tracker/core/services/apiServices.dart';
import 'package:equatable/equatable.dart';

part 'case_state.dart';

class CaseCubit extends Cubit<CaseState> {
  CaseCubit() : super(CaseInitial());

  Future<void> fetchCaseData() async {
    CovidCase _case = await ApiServices.fetchCaseData();
    List<String> _countries = await ApiServices.fetchCountries(_case.countries);
    if (_case != null && _countries.isNotEmpty) {
      // for (String country in _countries) {
      //   detailConfirmedCountry
      //     ..add(await ApiServices.fetchDetailConfirmedCountry(
      //         (_case.countryDetail['pattern'] as String)
      //             .replaceAll('[country]', country)));
      // }
      // if (detailConfirmedCountry.isNotEmpty)
      emit(CaseLoaded(_case, _countries));
    } else
      emit(CaseLoadingFailed('Failed to fetch data'));
  }

  Future<Map> fetchDetailCountry(String country) async =>
      await ApiServices.fetchDetailConfirmedCountry(country);
}
