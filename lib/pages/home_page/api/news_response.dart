class NewsResponse {
  List<News>? news;
  int? currentPage;
  int? totalPages;

  NewsResponse({this.news, this.currentPage, this.totalPages});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    return data;
  }
}

class News {
  int? id;
  String? title;
  String? description;
  String? content;
  String? createdAt;
  String? createdBy;

  News(
      {this.id,
      this.title,
      this.description,
      this.content,
      this.createdAt,
      this.createdBy});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['content'] = content;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    return data;
  }
}
