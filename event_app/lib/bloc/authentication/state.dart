
import 'package:event_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../model/event.dart';



abstract class AuthenticationState extends Equatable {
  AuthenticationState();

  @override
  List<Object> get props => [];
}


// class AuthenticationEmpty extends AuthenticationState {
//   @override
//   String toString() {
//     return "AuthenticationEmpty";
//   }
// }

class AuthenticationInProgress extends AuthenticationState {
  @override
  String toString() {
    return "Uninitialized";
  }
}

class AuthenticationSuccess extends AuthenticationState {
  final CurrentUser currentUser;

  AuthenticationSuccess(this.currentUser);

  @override
  List<Object> get props => [currentUser];

  @override
  String toString() {
    return "AuthenticationSuccess";
  }
}

class AuthenticationFailure extends AuthenticationState {
  // final Error error;
  //
  // AuthenticationFailure({@required this.error})
  //     : assert(error != null);
  //
  // @override
  // List<Object> get props => [error];

  @override
  String toString() {
    return "AuthenticationFailure";
  }
}
