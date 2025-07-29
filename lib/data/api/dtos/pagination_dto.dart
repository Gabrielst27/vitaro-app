class PaginationDto<T> {
  final List<T> items;
  final int total;
  final int currentPage;
  final int lastPage;
  final int perPage;

  PaginationDto({
    required this.items,
    required this.total,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
  });
}

class PaginationMapper {
  static PaginationDto toDto(Map<String, dynamic> data) {
    return PaginationDto(
      items: data['items'],
      total: data['total'],
      currentPage: data['currentPage'],
      lastPage: data['lastPage'],
      perPage: data['perPage'],
    );
  }
}
