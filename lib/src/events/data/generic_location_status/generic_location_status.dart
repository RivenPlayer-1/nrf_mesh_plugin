import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_location_status.freezed.dart';
part 'generic_location_status.g.dart';

@freezed
class GenericLocationStatusData with _$GenericLocationStatusData {
  const factory GenericLocationStatusData(
    int source,
    int latitude,
    int longitude,
    int altitude,
  ) = _GenericLocationStatusData;

  factory GenericLocationStatusData.fromJson(Map<String, dynamic> json) => _$GenericLocationStatusDataFromJson(json);
}
