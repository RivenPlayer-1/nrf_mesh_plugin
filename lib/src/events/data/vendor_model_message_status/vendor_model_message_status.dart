import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_model_message_status.freezed.dart';
part 'vendor_model_message_status.g.dart';

// Converter to handle Uint8List serialization
class Uint8ListConverter implements JsonConverter<Uint8List, List<dynamic>> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(List<dynamic> json) {
    return Uint8List.fromList(json.cast<int>());
  }

  @override
  List<dynamic> toJson(Uint8List uint8List) {
    return uint8List.toList();
  }
}

@freezed
class VendorModelMessageStatusData with _$VendorModelMessageStatusData {
  const factory VendorModelMessageStatusData(
    int source,
    int modelIdentifier,
    @Uint8ListConverter() Uint8List message, // Use the converter here
  ) = _VendorModelMessageStatusData;

  factory VendorModelMessageStatusData.fromJson(Map<String, dynamic> json) =>
      _$VendorModelMessageStatusDataFromJson(json);
}
