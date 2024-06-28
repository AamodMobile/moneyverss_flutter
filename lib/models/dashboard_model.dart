class DashboardModel {
  bool? status;
  String? message;
  List<Banner>? banner;
  List<Loantype>? loantype;
  List<Loantype>? loanShorttype;
  List<Testimonial>? testimonial;

  DashboardModel(
      {this.status,
        this.message,
        this.banner,
        this.loantype,
        this.loanShorttype,
        this.testimonial});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(Banner.fromJson(v));
      });
    }
    if (json['loantype'] != null) {
      loantype = <Loantype>[];
      json['loantype'].forEach((v) {
        loantype!.add(Loantype.fromJson(v));
      });
    }
    if (json['loantype'] != null) {
      loanShorttype= json["loantype"] == null
          ? []
          : List<Loantype>.from(json["loantype"]!.map((x) => Loantype.fromJson(x)))
          .where((subStatus) => subStatus.name != "Topup")
          .toList();
    }

    if (json['testimonial'] != null) {
      testimonial = <Testimonial>[];
      json['testimonial'].forEach((v) {
        testimonial!.add(Testimonial.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    if (loantype != null) {
      data['loantype'] = loantype!.map((v) => v.toJson()).toList();
    }
    if (loanShorttype != null) {
      data['loantype'] = loanShorttype!.map((v) => v.toJson()).toList();
    }
    if (testimonial != null) {
      data['testimonial'] = testimonial!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  int? id;
  String? image;
  String? title;

  Banner({this.id, this.image, this.title});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image']??"";
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    return data;
  }
}

class Loantype {
  int? id;
  String? name;
  String? type;
  dynamic status;
  String? image;
  dynamic bank;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Loantype(
      {this.id,
        this.name,
        this.type,
        this.status,
        this.image,
        this.bank,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Loantype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    image = json['image']??"";
    bank = json['bank'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['status'] = status;
    data['image'] = image;
    data['bank'] = bank;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Testimonial {
  int? id;
  String? name;
  String? rating;
  String? description;
  String? image;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  Testimonial(
      {this.id,
        this.name,
        this.rating,
        this.description,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
      });

  Testimonial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    description = json['description'];
    image = json['image']??"";
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rating'] = rating;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}