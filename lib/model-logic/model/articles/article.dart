
class Article {
  int? id;
  String? title;
  String? publisher;
  String? date;
  String? photo;

  Article({int? id, String? title, String? publisher, String? date, String? photo}){
    this.id = id;
    this.title = title;
    this.publisher = publisher;
    this.date = date;
    this.photo = photo;
  }

  int? get getId => this.id;

  set setId(int? id) => this.id = id;

  String? get getTitle => this.title;

  set setTitle( title) => this.title = title;

  String? get getPublisher => this.publisher;

  set setPublisher( publisher) => this.publisher = publisher;

  String? get getDate => this.date;

  set setDate( date) => this.date = date;

  String? get getPhoto => this.photo;

  set setPhoto( photo) => this.photo = photo;
}