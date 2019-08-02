import 'dart:convert' show jsonEncode, jsonDecode;

class ItemModel {
  final int _id;
  final bool _deleted;
  final String _type;
  final String _by;
  final int _time;
  final String _text;
  final bool _dead;
  final dynamic _parent;
  final List<dynamic> _kids;
  final String _url;
  final int _score;
  final String _title;
  final int _descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : _id = parsedJson['id'],
        _deleted = parsedJson['deleted'],
        _type = parsedJson['type'],
        _by = parsedJson['by'],
        _time = parsedJson['time'],
        _text = parsedJson['text'],
        _dead = parsedJson['dead'],
        _parent = parsedJson['parent'],
        _kids = parsedJson['kids'],
        _url = parsedJson['url'],
        _score = parsedJson['score'],
        _title = parsedJson['title'],
        _descendants = parsedJson['descendants'];

  ItemModel.fromDb(Map<String, dynamic> parsedJson)
      : _id = parsedJson['id'],
        _deleted = parsedJson['deleted'] == 1,
        _type = parsedJson['type'],
        _by = parsedJson['by'],
        _time = parsedJson['time'],
        _text = parsedJson['text'],
        _dead = parsedJson['dead'] == 1,
        _parent = parsedJson['parent'],
        _kids = jsonDecode(parsedJson['kids']),
        _url = parsedJson['url'],
        _score = parsedJson['score'],
        _title = parsedJson['title'],
        _descendants = parsedJson['descendants'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "parent": parent,
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants,
      "dead": dead ? 1 : 0,
      "deleted": deleted ? 1 : 0,
      "kids": jsonEncode(kids),
    };
  }

  get id => _id;
  get deleted => _deleted;
  get type => _type;
  get by => _by;
  get time => _time;
  get text => _text;
  get dead => _dead;
  get parent => _parent;
  get kids => _kids;
  get url => _url;
  get score => _score;
  get title => _title;
  get descendants => _descendants;
}
