class Page {
  final int? id;
  final int pageNumber;
  final String content;
  final String? title;

  Page({this.id, required this.pageNumber, required this.content, this.title});

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
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
    return 'Page{id: $id, pageNumber: $pageNumber, content: $content, title: $title}';
  }
}
