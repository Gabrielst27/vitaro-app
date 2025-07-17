class Result<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;

  Result.success(this.data) : isSuccess = true, errorMessage = null;

  Result.failure(this.errorMessage) : isSuccess = false, data = null;
}
