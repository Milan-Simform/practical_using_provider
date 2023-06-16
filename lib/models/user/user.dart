// ignore_for_file: hash_and_equals

class User {
  final String id;
  final String name;
  final String email;
  final String mobile;
  final String address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['mobile'] = mobile;
    map['address'] = address;
    return map;
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
    final currentMap = toMap();
    final otherMap = other.toMap();
    for (var key in currentMap.keys) {
      if (currentMap[key] != otherMap[key]) {
        return false;
      }
    }
    return true;
  }
}
