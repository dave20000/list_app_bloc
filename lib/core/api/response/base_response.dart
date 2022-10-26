import 'package:flutter/foundation.dart';

import '../mappers/to_json.dart';
import '../../app_serializers.dart';
import '../../../data/models/character_dto.dart';

class BaseResponse<T extends ToJson> {
  final List<T> docs;
  final int limit;
  final int offset;
  final int page;
  final int pages;
  final int total;

  BaseResponse({
    required this.docs,
    required this.limit,
    required this.offset,
    required this.page,
    required this.pages,
    required this.total,
  });

  BaseResponse copyWith({
    List<CharacterDto>? docs,
    int? limit,
    int? offset,
    int? page,
    int? pages,
    int? total,
  }) {
    return BaseResponse(
      docs: docs ?? this.docs,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      page: page ?? this.page,
      pages: pages ?? this.pages,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docs': docs.map((x) => x.toJson()).toList(),
      'limit': limit,
      'offset': offset,
      'page': page,
      'pages': pages,
      'total': total,
    };
  }

  factory BaseResponse.fromJson(Map<String, dynamic> map) {
    return BaseResponse(
      docs: List<T>.from(
        map['docs']?.map(
          (x) => AppSerializers.serializers[T]!(x as Map<String, dynamic>),
        ),
      ),
      limit: map['limit']?.toInt() ?? 0,
      offset: map['offset']?.toInt() ?? 0,
      page: map['page']?.toInt() ?? 0,
      pages: map['pages']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'BaseResponse(docs: $docs, limit: $limit, offset: $offset, page: $page, pages: $pages, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseResponse &&
        listEquals(other.docs, docs) &&
        other.limit == limit &&
        other.offset == offset &&
        other.page == page &&
        other.pages == pages &&
        other.total == total;
  }

  @override
  int get hashCode {
    return docs.hashCode ^
        limit.hashCode ^
        offset.hashCode ^
        page.hashCode ^
        pages.hashCode ^
        total.hashCode;
  }
}
