// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covidCase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidCase _$CovidCaseFromJson(Map<String, dynamic> json) {
  return CovidCase(
    confirmed: json['confirmed'] as Map<String, dynamic>,
    recovered: json['recovered'] as Map<String, dynamic>,
    deaths: json['deaths'] as Map<String, dynamic>,
    dailySummary: json['dailySummary'] as String,
    dailyTimeSeries: json['dailyTimeSeries'] as Map<String, dynamic>,
    image: json['image'] as String,
    source: json['source'] as String,
    countries: json['countries'] as String,
    countryDetail: json['countryDetail'] as Map<String, dynamic>,
    lastUpdate: json['lastUpdate'] as String,
  );
}

Map<String, dynamic> _$CovidCaseToJson(CovidCase instance) => <String, dynamic>{
      'confirmed': instance.confirmed,
      'recovered': instance.recovered,
      'deaths': instance.deaths,
      'dailySummary': instance.dailySummary,
      'dailyTimeSeries': instance.dailyTimeSeries,
      'image': instance.image,
      'source': instance.source,
      'countries': instance.countries,
      'countryDetail': instance.countryDetail,
      'lastUpdate': instance.lastUpdate,
    };
