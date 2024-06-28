class CreateLeadModel {
  bool? status;
  String? message;
  String? referenceId;

  CreateLeadModel({this.status, this.message, this.referenceId});

  CreateLeadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    referenceId = json['reference_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['reference_id'] = this.referenceId;
    return data;
  }
}