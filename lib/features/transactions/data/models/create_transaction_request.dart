import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_transaction_request.freezed.dart';
part 'create_transaction_request.g.dart';

@freezed
abstract class CreateTransactionRequest with _$CreateTransactionRequest {
  const factory CreateTransactionRequest({
    required String accountId,
    required String type, // INCOME, EXPENSE
    required double amount,
    String? categoryId,
    required DateTime transactionDate,
    required String description,
    String? note,
    String? payee,
    String? location,
    double? latitude,
    double? longitude,
    List<String>? tags,
  }) = _CreateTransactionRequest;

  factory CreateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionRequestFromJson(json);
}
