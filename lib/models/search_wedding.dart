class SearchWedding {
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

  SearchWedding(
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

  SearchWedding.fromJson(Map<String, dynamic> json) {
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
    data['category'] = this.category;
    return data;
  }
}