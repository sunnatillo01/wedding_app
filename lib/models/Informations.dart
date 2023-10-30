class Information {
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
  List<int>? category;

  Information(
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
      this.category});

  Information.fromJson(Map<String, dynamic> json) {
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
    category = json['category'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id.toString();
    data['name'] = name.toString();
    data['adress'] = adress.toString();
    data['photo'] = photo;
    data['slug'] = slug.toString();
    data['price'] = price;
    data['countPersonMin'] = countPersonMin.toString();
    data['countPersonMax'] = countPersonMax.toString();
    data['dataCreated'] = dataCreated.toString();
    data['updateDate'] = updateDate.toString();
    data['description'] = description.toString();
    data['chatIdAdmin'] = chatIdAdmin.toString();
    data['time_work'] = timeWork.toString();
    data['proritet'] = proritet.toString();
    data['tg_blank'] = tgBlank.toString();
    data['category'] = category.toString();
    return data;
  }
}