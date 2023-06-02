import 'dart:core';

class ListItem {
  int? id;
  String? name;
  String? title;
  String? description;
  String? status;
  int? priority;
  DateTime? dueDate;
  String? type;
  DateTime? created;
  String? location;
  String? total;

  ListItem({
    required this.id,
    this.name,
    this.title,
    this.description,
    this.status,
    required this.priority,
    this.dueDate,
    this.type,
    this.created,
    this.location,
    required this.total,
  });

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      id: json['id'],
      name: json['name'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      priority: json['priority'],
      dueDate:
          json['dueDate'] != null ? DateTime.tryParse(json['dueDate']) : null,
      type: json['type'] as String?,
      created:
          json['created'] != null ? DateTime.tryParse(json['created']) : null,
      location: json['location'] as String?,
      total: json['total'] as String?,
    );
  }

  @override
  String toString() {
    return 'ListItem('
        'id: $id, '
        'name: $name, '
        'title: $title, '
        'description: $description, '
        'status: $status, '
        'priority: $priority, '
        'dueDate: $dueDate, '
        'type: $type, '
        'created: $created, '
        'location: $location, '
        'total: $total)';
  }
}
