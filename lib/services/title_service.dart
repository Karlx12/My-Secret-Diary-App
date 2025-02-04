import '../models/page_diary.dart';
import '../models/title_record.dart';

class TitleService {
  TitleRecord? checkForTitle(PageDiary page) {
    final RegExp titleRegExp = RegExp(r'^# (.+)$', multiLine: true);
    final match = titleRegExp.firstMatch(page.content);

    if (match != null) {
      return TitleRecord(
        title: match.group(1)!,
        timestamp: DateTime.now(),
        pageId: page.id!,
        id: 0, // Assuming id will be auto-generated by the database
      );
    }
    return null;
  }
}