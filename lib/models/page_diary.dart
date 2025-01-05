class PageDiary {
  final int? id;
  final int pageNumber;
  final String content;
  final String? title;

  PageDiary({this.id, required this.pageNumber, required this.content, this.title});

  factory PageDiary.fromJson(Map<String, dynamic> json) {
    return PageDiary(
      id: json['id'],
      pageNumber: json['pageNumber'],
      content: json['content'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pageNumber': pageNumber,
      'content': content,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'PageDiary{id: $id, pageNumber: $pageNumber, content: $content, title: $title}';
  }
}
