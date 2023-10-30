class WeddingModel {
  int? id;
  String? name;
  String? adress;
  String? photo;
  String? slug;
  String? price;
  int? countPersonMin;
  int? countPersonMax;
  String? dataCreated;
  String? updateDate;
  String? description;
  String? chatIdAdmin;
  String? timeWork;
  int? proritet;
  String? tgBlank;
  Null phoneNumber;
  List<int>? category;
  List<Photos>? photos;
  List<ServicesName>? servicesName;

  WeddingModel(
      {this.id,
      this.name,
      this.adress,
      this.photo,
      this.slug,
      this.price,
      this.countPersonMin,
      this.countPersonMax,
      this.dataCreated,
      this.updateDate,
      this.description,
      this.chatIdAdmin,
      this.timeWork,
      this.proritet,
      this.tgBlank,
      this.phoneNumber,
      this.category,
      this.photos,
      this.servicesName});

  WeddingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adress = json['adress'];
    photo = json['photo'];
    slug = json['slug'];
    price = json['price'];
    countPersonMin = json['countPersonMin'];
    countPersonMax = json['countPersonMax'];
    dataCreated = json['dataCreated'];
    updateDate = json['updateDate'];
    description = json['description'];
    chatIdAdmin = json['chatIdAdmin'];
    timeWork = json['time_work'];
    proritet = json['proritet'];
    tgBlank = json['tg_blank'];
    phoneNumber = json['phone_number'];
    category = json['category'].cast<int>();
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    if (json['services_name'] != null) {
      servicesName = <ServicesName>[];
      json['services_name'].forEach((v) {
        servicesName!.add(new ServicesName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['adress'] = this.adress;
    data['photo'] = this.photo;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['countPersonMin'] = this.countPersonMin;
    data['countPersonMax'] = this.countPersonMax;
    data['dataCreated'] = this.dataCreated;
    data['updateDate'] = this.updateDate;
    data['description'] = this.description;
    data['chatIdAdmin'] = this.chatIdAdmin;
    data['time_work'] = this.timeWork;
    data['proritet'] = this.proritet;
    data['tg_blank'] = this.tgBlank;
    data['phone_number'] = this.phoneNumber;
    data['category'] = this.category;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.servicesName != null) {
      data['services_name'] =
          this.servicesName!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  String? image;

  Photos({this.image});

  Photos.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class ServicesName {
  String? nameservice;

  ServicesName({this.nameservice});

  ServicesName.fromJson(Map<String, dynamic> json) {
    nameservice = json['nameservice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameservice'] = this.nameservice;
    return data;
  }
}

