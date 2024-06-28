
import 'package:wireframe/models/lead_list_model.dart';

class StatusModel {
  bool? status;
  String? message;
  List<Status>? data;
  LeadData? leadDetail;
  List<DocumentsList>? documentsList;

  StatusModel({
    this.status,
    this.message,
    this.data,
    this.leadDetail,
    this.documentsList,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Status>.from(json["data"]!.map((x) => Status.fromJson(x))),
    leadDetail: json["lead_detail"] == null ? null : LeadData.fromJson(json["lead_detail"]),
    documentsList: json["documents_list"] == null ? [] : List<DocumentsList>.from(json["documents_list"]!.map((x) => DocumentsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "lead_detail": leadDetail?.toJson(),
    "documents_list": documentsList == null ? [] : List<dynamic>.from(documentsList!.map((x) => x.toJson())),
  };
}

class Status {
  int? id;
  String? name;
  String? createdAt;
  dynamic isStatus;
  List<SubStatus>? subStatus;
  Status({
    this.id,
    this.name,
    this.createdAt,
    this.isStatus,
    this.subStatus,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    isStatus: json["is_status"],
    subStatus: json["sub_status"] == null
        ? []
        : List<SubStatus>.from(json["sub_status"]!.map((x) => SubStatus.fromJson(x)))
        .where((subStatus) => subStatus.isStatus == 1)
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "is_status": isStatus,
    "sub_status": subStatus == null ? [] : List<dynamic>.from(subStatus!.map((x) => x.toJson())),
  };
}
class SubStatus {
  int? id;
  dynamic statusId;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isStatus;

  SubStatus({
    this.id,
    this.statusId,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.isStatus,
  });

  factory SubStatus.fromJson(Map<String, dynamic> json) => SubStatus(
    id: json["id"],
    statusId: json["status_id"],
    title: json["title"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isStatus: json["is_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status_id": statusId,
    "title": title,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_status": isStatus,
  };
}
class DocumentsList {
  int? id;
  dynamic documentRelationId;
  dynamic applicantTypeId;
  String? title;
  String? description;
  dynamic stateId;
  dynamic cityId;
  String? documentType;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic? isUploaded;
  String? document;

  DocumentsList({
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
    this.deletedAt,
    this.isUploaded,
    this.document,
  });

  factory DocumentsList.fromJson(Map<String, dynamic> json) => DocumentsList(
    id: json["id"],
    documentRelationId: json["document_relation_id"],
    applicantTypeId: json["applicant_type_id"],
    title: json["title"],
    description: json["description"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    documentType: json["document_type"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    isUploaded: json["is_uploaded"],
    document: json["document"],
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "is_uploaded": isUploaded,
    "document": document,
  };
}


