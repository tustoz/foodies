class SearchFood {
  String? method;
  bool? status;
  List<Results>? results;

  SearchFood({this.method, this.status, this.results});

  SearchFood.fromJson(Map<String, dynamic> json) {
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
  String? key;
  String? times;
  String? serving;
  String? difficulty;

  Results(
      {this.title,
      this.thumb,
      this.key,
      this.times,
      this.serving,
      this.difficulty});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    key = json['key'];
    times = json['times'];
    serving = json['serving'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['thumb'] = thumb;
    data['key'] = key;
    data['times'] = times;
    data['serving'] = serving;
    data['difficulty'] = difficulty;
    return data;
  }
}
