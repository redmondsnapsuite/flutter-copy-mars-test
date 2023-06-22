class WorkOrderItem {
  String? projectRefNumber;
  int? intProjectID;
  String? jobDescription;
  String? description;
  String? created;
  String? clientName;
  String? address;
  String? city;
  String? province;
  String? postalCode;
  String? latitude;
  String? longitude;
  String? status;
  int? projectID;
  String? dueDate;
  String? customField2;
  String? customField3;
  String? projectStartDate;

  WorkOrderItem({
    required this.projectRefNumber,
    required this.intProjectID,
    required this.jobDescription,
    required this.description,
    required this.created,
    required this.clientName,
    required this.address,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.projectID,
    required this.dueDate,
    required this.customField2,
    required this.customField3,
    required this.projectStartDate,
  });

  factory WorkOrderItem.fromJson(Map<String?, dynamic> json) {
    return WorkOrderItem(
      projectRefNumber: json['projectRefNumber'],
      intProjectID: json['intProjectID'],
      jobDescription: json['jobDescription'],
      description: json['description'],
      created: json['created'],
      clientName: json['clientName'],
      address: json['address'],
      city: json['city'],
      province: json['province'],
      postalCode: json['postalCode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      status: json['status'],
      projectID: json['projectID'],
      dueDate: json['dueDate'],
      customField2: json['customField2'],
      customField3: json['customField3'],
      projectStartDate: json['projectStartDate'],
    );
  }

  @override
  String toString() {
    return 'WorkOrderItem{'
        'projectRefNumber: $projectRefNumber, '
        'intProjectID: $intProjectID, '
        'jobDescription: $jobDescription, '
        'description: $description, '
        'created: $created, '
        'clientName: $clientName, '
        'address: $address, '
        'city: $city, '
        'province: $province, '
        'postalCode: $postalCode, '
        'latitude: $latitude, '
        'longitude: $longitude, '
        'status: $status, '
        'projectID: $projectID, '
        'dueDate: $dueDate, '
        'customField2: $customField2, '
        'customField3: $customField3, '
        'projectStartDate: $projectStartDate'
        '}';
  }
}