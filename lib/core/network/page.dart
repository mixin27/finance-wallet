/// Generic pagination model for API responses
class Page<T> {
  final List<T> content;
  final Pageable pageable;
  final int totalElements;
  final int totalPages;
  final bool last;
  final bool first;
  final int numberOfElements;
  final int size;
  final int number;
  final bool empty;

  Page({
    required this.content,
    required this.pageable,
    required this.totalElements,
    required this.totalPages,
    required this.last,
    required this.first,
    required this.numberOfElements,
    required this.size,
    required this.number,
    required this.empty,
  });

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return Page<T>(
      content: (json['content'] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
      last: json['last'] as bool,
      first: json['first'] as bool,
      numberOfElements: json['numberOfElements'] as int,
      size: json['size'] as int,
      number: json['number'] as int,
      empty: json['empty'] as bool,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'content': content.map((item) => toJsonT(item)).toList(),
      'pageable': pageable.toJson(),
      'totalElements': totalElements,
      'totalPages': totalPages,
      'last': last,
      'first': first,
      'numberOfElements': numberOfElements,
      'size': size,
      'number': number,
      'empty': empty,
    };
  }
}

/// Pageable information
class Pageable {
  final int pageNumber;
  final int pageSize;
  final Sort sort;
  final int offset;
  final bool paged;
  final bool unpaged;

  Pageable({
    required this.pageNumber,
    required this.pageSize,
    required this.sort,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.empty() => Pageable(
    pageNumber: 0,
    pageSize: 0,
    sort: Sort(sorted: false, unsorted: true, empty: true),
    offset: 0,
    paged: false,
    unpaged: true,
  );

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      offset: json['offset'] as int,
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'sort': sort.toJson(),
      'offset': offset,
      'paged': paged,
      'unpaged': unpaged,
    };
  }
}

/// Sort information
class Sort {
  final bool sorted;
  final bool unsorted;
  final bool empty;

  Sort({required this.sorted, required this.unsorted, required this.empty});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sorted: json['sorted'] as bool,
      unsorted: json['unsorted'] as bool,
      empty: json['empty'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'sorted': sorted, 'unsorted': unsorted, 'empty': empty};
  }
}
