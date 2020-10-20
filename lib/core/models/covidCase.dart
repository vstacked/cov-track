import 'package:json_annotation/json_annotation.dart';

part 'covidCase.g.dart';

@JsonSerializable()
class CovidCase {
  final Map confirmed;
  final Map recovered;
  final Map deaths;
  final String dailySummary;
  final Map dailyTimeSeries;
  final String image;
  final String source;
  final String countries;
  final Map countryDetail;
  final String lastUpdate;

  CovidCase({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.dailySummary,
    this.dailyTimeSeries,
    this.image,
    this.source,
    this.countries,
    this.countryDetail,
    this.lastUpdate,
  });

  factory CovidCase.from(Map<String, dynamic> json) =>
      _$CovidCaseFromJson(json);

  Map<String, dynamic> toJson() => _$CovidCaseToJson(this);
}
