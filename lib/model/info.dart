class Info {
  int? count;
  int? pages;

  Info({this.count, this.pages,});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['pages'] = pages;
    return data;
  }
}