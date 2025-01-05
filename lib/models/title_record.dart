class TitleRecord {
  final String title;
  final DateTime timestamp;
  final int pageId;
  final int id;

  TitleRecord({required this.title, required this.timestamp, required this.pageId, required this.id});

  factory TitleRecord.fromJson(Map<String, dynamic> json) {
    return TitleRecord(
      title: json['title'],
      timestamp: DateTime.parse(json['timestamp']),
      pageId: json['pageId'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'timestamp': timestamp.toIso8601String(),
      'pageId': pageId,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'TitleRecord{title: $title, timestamp: $timestamp, pageId: $pageId, id: $id}';
  }
  
}
