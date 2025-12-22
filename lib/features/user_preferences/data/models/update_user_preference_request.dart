import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_preference_request.freezed.dart';
part 'update_user_preference_request.g.dart';

@freezed
abstract class UpdateUserPreferenceRequest with _$UpdateUserPreferenceRequest {
  const factory UpdateUserPreferenceRequest({
    String? defaultCurrencyId,
    String? language,
    String? dateFormat,
    int? firstDayOfWeek,
    String? timezone,
    String? theme,
    bool? enableNotifications,
    bool? enableBiometric,
    bool? autoBackup,
  }) = _UpdateUserPreferenceRequest;

  factory UpdateUserPreferenceRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserPreferenceRequestFromJson(json);
}
