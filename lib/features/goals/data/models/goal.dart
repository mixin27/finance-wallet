import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
abstract class Goal with _$Goal {
  const factory Goal({
    required String id,
    required String name,
    String? description,
    required double targetAmount,
    required double currentAmount,
    required double remaining,
    required double percentageComplete,
    required DateTime targetDate,
    String? color,
    String? icon,
    required bool isCompleted,
    String? accountId,
    String? accountName,
    required String currencyId,
    required String currencyCode,
    required String currencySymbol,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}
