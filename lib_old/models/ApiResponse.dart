import 'dart:core';

class ApiResponse<T> {
  bool? success;
  int? total;
  List<T> resources;
  String? message;
  String? version;

  ApiResponse({
    required this.success,
    required this.total,
    required this.resources,
    this.message,
    this.version,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse(
      success: json['success'],
      total: json['total'],
      resources: List<T>.from(
          json['resources'].map((resource) => fromJsonT(resource))),
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
