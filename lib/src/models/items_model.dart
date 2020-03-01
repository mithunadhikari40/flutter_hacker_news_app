/*
id
deleted
type
by
time
text
dead
parent
poll
kids
url
score
title
parts
descendants*/

class ItemModel {
  String by;
  int descendants;
  int id;
  List<int> kids;
  int score;
  String text;
  int time;
  String title;
  String type;
  String url;

  ItemModel(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.text,
      this.time,
      this.title,
      this.type,
      this.url});

  ItemModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = json['kids'].cast<int>();
    score = json['score'];
    text = json['text'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['descendants'] = this.descendants;
    data['id'] = this.id;
    data['kids'] = this.kids;
    data['score'] = this.score;
    data['text'] = this.text;
    data['time'] = this.time;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
