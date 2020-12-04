
import 'package:equatable/equatable.dart';


abstract class SignInEvent extends Equatable {
  SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleOnPressed extends SignInEvent {}
class SignInAnonymouslyOnPressed extends SignInEvent {}
