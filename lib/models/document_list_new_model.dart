class DocumentsNewList {
  int? id;
  String? title;
  int? status;
  List<DocumentList>? documentList;

  DocumentsNewList({
    this.id,
    this.title,
    this.status,
    this.documentList,
  });

  factory DocumentsNewList.fromJson(Map<String, dynamic> json) => DocumentsNewList(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        documentList: json["document_list"] == null ? [] : List<DocumentList>.from(json["document_list"]!.map((x) => DocumentList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "document_list": documentList == null ? [] : List<dynamic>.from(documentList!.map((x) => x.toJson())),
      };
}

class DocumentList {
  int? id;
  dynamic documentRelationId;
  String? applicantTypeId;
  String? businessEntity;
  String? title;
  String? document;
  dynamic icon;
  dynamic description;
  dynamic stateId;
  dynamic cityId;
  String? documentType;
  int? status;
  int? isUploaded;

  DocumentList({
    this.id,
    this.documentRelationId,
    this.applicantTypeId,
    this.businessEntity,
    this.title,
    this.document,
    this.icon,
    this.description,
    this.stateId,
    this.cityId,
    this.documentType,
    this.status,
    this.isUploaded,
  });

  factory DocumentList.fromJson(Map<String, dynamic> json) => DocumentList(
        id: json["id"],
        documentRelationId: json["document_relation_id"],
        applicantTypeId: json["applicant_type_id"],
        businessEntity: json["business_entity"],
        title: json["title"],
        document: json["document"] ?? "",
        icon: json["icon"],
        description: json["description"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        documentType: json["document_type"],
        status: json["status"],
        isUploaded: json["is_uploaded"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "document_relation_id": documentRelationId,
        "applicant_type_id": applicantTypeId,
        "business_entity": businessEntity,
        "title": title,
        "document": document,
        "icon": icon,
        "description": description,
        "state_id": stateId,
        "city_id": cityId,
        "document_type": documentType,
        "status": status,
        "is_uploaded": isUploaded,
      };
}
