import 'package:freezed_annotation/freezed_annotation.dart';

part 'pick_location_result.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class PickLocationResult with _$PickLocationResult {
  const factory PickLocationResult({
    required double latitude,
    required double longitude,
    required String street,
    required String address,
  }) = _PickLocationResult;
}
