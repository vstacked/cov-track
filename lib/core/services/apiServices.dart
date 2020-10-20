import 'dart:convert';

import 'package:cov_tracker/core/models/covidCase.dart';
import 'package:http/http.dart' as http;

String _baseUrl = "https://covid19.mathdro.id/api";
String _detailCountryUrl = "https://covid19.mathdro.id/api/countries/";

class ApiServices {
  static Future<CovidCase> fetchCaseData() async {
    var response = await http.get(_baseUrl);

    if (response.statusCode == 200)
      return CovidCase.from(jsonDecode(response.body));
    return null;
  }

  static Future<List<String>> fetchCountries(String url) async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Future.value((jsonDecode(response.body)['countries'] as List)
          .map<String>((e) => e['name'])
          .toList());
    }
    return null;
  }

  static Future<Map> fetchDetailConfirmedCountry(String country) async {
    var response = await http.get(_detailCountryUrl + country);
    if (response.statusCode == 200) {
      return Future.value((jsonDecode(response.body) as Map));
    }
    return null;
  }
}
