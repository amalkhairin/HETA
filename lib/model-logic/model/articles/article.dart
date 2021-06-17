
class Article {
  int? id;
  String? title;
  String? content;
  String? publisher;
  String? date;
  String? photo;

  Article({
    this.id,
    this.title,
    this.content,
    this.publisher,
    this.date,
    this.photo
  });

  factory Article.fromJson(Map<String, dynamic> data) {
    return Article(
      id : data["id"],
      title : data["title"],
      content : data['content'],
      publisher : data['publisher'],
      date : data['date'],
      photo : data['photo']
    );
  }

  int? get getId => this.id;

  set setId(int? id) => this.id = id;

  String? get getTitle => this.title;

  set setTitle( title) => this.title = title;

  String? get getContent => this.content;

  set setContent(content) => this.content = content;

  String? get getPublisher => this.publisher;

  set setPublisher( publisher) => this.publisher = publisher;

  String? get getDate => this.date;

  set setDate( date) => this.date = date;

  String? get getPhoto => this.photo;

  set setPhoto( photo) => this.photo = photo;
}