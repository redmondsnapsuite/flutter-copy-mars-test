class ListItem {
  String id;
  String name;
  String title;
  String description;
  String status;
  int priority;
  DateTime dueDate;
  String type;
  DateTime created;
  String location;
  double total;

  ListItem({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.dueDate,
    required this.type,
    required this.created,
    required this.location,
    required this.total,
  });
}
