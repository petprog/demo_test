class DomainResponse<T, E> {
  bool success;
  T? data;
  E? error;
  DomainResponse({
    this.success = false,
    this.data,
    this.error,
  });

  DomainResponse<T, E> copyWith({
    bool? success,
    T? data,
    E? error,
  }) {
    return DomainResponse<T, E>(
      success: success ?? this.success,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'BaseResponse(success: $success, data: $data, error: $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DomainResponse<T, E> &&
        other.success == success &&
        other.data == data &&
        other.error == error;
  }

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ error.hashCode;
}
