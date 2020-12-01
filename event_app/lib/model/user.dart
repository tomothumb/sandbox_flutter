import 'package:flutter/material.dart';


class User {
  final String id;
  final String name;
  final String profUrl;
  final bool isAnonymous;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({@required this.id,
    @required this.name,
    @required this.profUrl,
    @required this.isAnonymous,
    @required this.createdAt,
    @required this.updatedAt})
      : assert(id != null),
        assert(name != null),
        assert(profUrl != null),
        assert(isAnonymous != null),
        assert(createdAt != null),
        assert(updatedAt != null)
  ;

// User({@required this.name}) : assert(name != null);
}

class CurrentUser extends User {


}
