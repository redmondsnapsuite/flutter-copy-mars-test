import 'dart:core';

class ApiResponseItem<T> {
  bool? success;
  int? total;
  T? resources;
  String? message;
  String? version;

  ApiResponseItem({
    required this.success,
    required this.total,
    required this.resources,
    this.message,
    this.version,
  });

  factory ApiResponseItem.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseItem(
      success: json['success'],
      total: json['total'],
      resources:json['resources'],
      message: json['message'],
      version: json['version'],
    );
  }

  @override
  String toString() {
    return 'ApiResponse<${T.toString()}>('
        'success: $success, '
        'total: $total, '
        'resources: $resources, '
        'message: $message, '
        'version: $version)';
  }
}
