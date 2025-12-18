import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_request.freezed.dart';
part 'transfer_request.g.dart';

@freezed
abstract class TransferRequest with _$TransferRequest {
  const factory TransferRequest({
    required String fromAccountId,
    required String toAccountId,
    required double amount,
    double? exchangeRate,
    required DateTime transactionDate,
    required String description,
    String? note,
  }) = _TransferRequest;

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);
}
