class User {
  int id;
  String name;
  String createdAt;
  String updatedAt;
  String deletedAt;

  User(
    this.id,
    this.name,
    [
      this.createdAt = '',
      this.updatedAt = '',
      this.deletedAt = '',
    ]
  );

  String get encode => '''
{
  "id": $id,
  "name": "$name",
  "created_at": "$createdAt",
  "updated_at": "$updatedAt",
}
  ''';

  bool get isDeleted => deletedAt != 'null';
}
