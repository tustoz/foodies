class Article {
  String? method;
  bool? status;
  List<Results>? results;

  Article({this.method, this.status, this.results});

  Article.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['method'] = method;
    data['status'] = status;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? title;
  String? thumb;
  String? tags;
  String? key;

  Results({this.title, this.thumb, this.tags, this.key});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    tags = json['tags'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['thumb'] = thumb;
    data['tags'] = tags;
    data['key'] = key;
    return data;
  }
}
