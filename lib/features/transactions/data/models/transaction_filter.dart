class TransactionFilter {
  final String? accountId;
  final String? categoryId;
  final String? type;
  final DateTime? startDate;
  final DateTime? endDate;
  final int page;
  final int size;
  final String sortBy;
  final String sortDirection;

  TransactionFilter({
    this.accountId,
    this.categoryId,
    this.type,
    this.startDate,
    this.endDate,
    this.page = 0,
    this.size = 20,
    this.sortBy = 'transactionDate',
    this.sortDirection = 'DESC',
  });

  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (accountId != null) params['accountId'] = accountId;
    if (categoryId != null) params['categoryId'] = categoryId;
    if (type != null) params['type'] = type;
    if (startDate != null) params['startDate'] = startDate!.toIso8601String();
    if (endDate != null) params['endDate'] = endDate!.toIso8601String();
    params['page'] = page;
    params['size'] = size;
    params['sortBy'] = sortBy;
    params['sortDirection'] = sortDirection;

    return params;
  }
}
