import 'package:flutter/material.dart';

import 'user.dart';



class Event {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String imageUrl;
  final User user;

  Event(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.date,
      @required this.imageUrl,
      @required this.user})
      : assert(id != null),
        assert(title != null),
        assert(description != null),
        assert(date != null),
        assert(imageUrl != null),
        assert(user != null),
        super();
}
