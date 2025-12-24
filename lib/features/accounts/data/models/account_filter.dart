class AccountFilter {
  final String? accountType;
  final bool includeInactive;
  final String sortBy;
  final String sortDirection;

  AccountFilter({
    this.accountType,
    this.includeInactive = false,
    this.sortBy = 'name',
    this.sortDirection = 'ASC',
  });

  AccountFilter copyWith({
    String? accountType,
    bool? includeInactive,
    String? sortBy,
    String? sortDirection,
  }) {
    return AccountFilter(
      accountType: accountType ?? this.accountType,
      includeInactive: includeInactive ?? this.includeInactive,
      sortBy: sortBy ?? this.sortBy,
      sortDirection: sortDirection ?? this.sortDirection,
    );
  }

  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};
    if (accountType != null) params['accountType'] = accountType;
    params['includeInactive'] = includeInactive;
    params['sortBy'] = sortBy;
    params['sortDirection'] = sortDirection;
    return params;
  }
}
