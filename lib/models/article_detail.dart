class ArticleDetail {
  String? method;
  bool? status;
  Results? results;

  ArticleDetail({this.method, this.status, this.results});

  ArticleDetail.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['method'] = method;
    data['status'] = status;
    if (results != null) {
      data['results'] = results?.toJson();
    }
    return data;
  }
}

class Results {
  String? title;
  String? thumb;
  String? author;
  String? datePublished;
  String? description;

  Results(
      {this.title,
      this.thumb,
      this.author,
      this.datePublished,
      this.description});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    author = json['author'];
    datePublished = json['date_published'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['thumb'] = thumb;
    data['author'] = author;
    data['date_published'] = datePublished;
    data['description'] = description;
    return data;
  }
}
