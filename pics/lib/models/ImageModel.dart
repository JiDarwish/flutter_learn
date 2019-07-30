class ImageModel {
  int _id;
  String _url;
  String _title;

  ImageModel(int id, String url, String title) {
    this._id = id;
    this._url = url;
    this._title = title;
  }

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    this._id = parsedJson['id'];
    this._url = parsedJson['url'];
    this._title = parsedJson['title'];
  }

  int get id => _id;
  String get url => _url;
  String get title => _title;

  @override
  String toString() {
    return 'Id = $_id, url = $url, title = $_title';
  }
}
