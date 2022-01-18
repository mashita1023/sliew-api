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

  bool get isDeleted => deletedAt != 'null';

  String get encode => '''
{
  "id": $id,
  "name": "$name",
  "created_at": "$createdAt",
  "updated_at": "$updatedAt",
}
  ''';

  String get encodeDeleted => '{"success": $isDeleted}';

}
