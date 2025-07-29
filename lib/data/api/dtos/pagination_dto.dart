class PaginationDto<T> {
  final List<dynamic> itemsResponse;
  final int total;
  final int currentPage;
  final int lastPage;
  final int perPage;
  List<T>? itemsDto;

  PaginationDto({
    required this.itemsResponse,
    required this.total,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
  });
}

class PaginationMapper<T> {
  static PaginationDto<T> toDto<T>(Map<String, dynamic> data) {
    return PaginationDto<T>(
      itemsResponse: data['items'],
      total: data['total'],
      currentPage: data['currentPage'],
      lastPage: data['lastPage'],
      perPage: data['perPage'],
    );
  }
}
