class DocumentListModel {
  int? id;
  dynamic documentRelationId;
  dynamic applicantTypeId;
  String? title;
  String? description;
  dynamic stateId;
  dynamic cityId;
  String? documentType;
  dynamic status;
  String? createdAt;
  String? updatedAt;


  DocumentListModel({
    this.id,
    this.documentRelationId,
    this.applicantTypeId,
    this.title,
    this.description,
    this.stateId,
    this.cityId,
    this.documentType,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DocumentListModel.fromJson(Map<String, dynamic> json) => DocumentListModel(
    id: json["id"],
    documentRelationId: json["document_relation_id"],
    applicantTypeId: json["applicant_type_id"],
    title: json["title"],
    description: json["description"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    documentType: json["document_type"],
    status: json["status"],
    createdAt: json["created_at"] ,
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "document_relation_id": documentRelationId,
    "applicant_type_id": applicantTypeId,
    "title": title,
    "description": description,
    "state_id": stateId,
    "city_id": cityId,
    "document_type": documentType,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
