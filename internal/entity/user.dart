class User {
  int id;
  String name;

  User(this.id, this.name);

  String get encode => '{"id": $id, "name": "$name"}';
}
