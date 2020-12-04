import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './state.dart';
import './event.dart';
import './repository.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository _signInRepository;

  SignInBloc({@required SignInRepository signInRepository})
      : assert(signInRepository != null),
        _signInRepository = signInRepository,
        super(SignInEmpty())
  ;

  SignInState get initialState => SignInEmpty();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if( event is SignInWithGoogleOnPressed) {
      yield* _mapSignInWithGoogleOnPressed();
    } else if( event is SignInAnonymouslyOnPressed) {
      yield* _mapSignInAnonymouslyOnPressed();
    }
  }
  Stream<SignInState> _mapSignInWithGoogleOnPressed() async* {
    yield SignInLoading();
    print('_mapSignInWithGoogleOnPressed');
    try{
      await _signInRepository.signInWithGoogle();
      print('SignInSuccess');
      yield SignInSuccess();
    } catch (_) {
      print('SignInFailure');
      yield SignInFailure();
    }
  }

  Stream<SignInState> _mapSignInAnonymouslyOnPressed() async* {
    yield SignInLoading();
    print('_mapSignInAnonymouslyOnPressed');
    print(_signInRepository);

    try{
      await _signInRepository.signInWithAnonymously();
      print('SignInSuccess');
      yield SignInSuccess();
    }catch(_){
      print('SignInFailure');
      yield SignInFailure();
    }
  }

}
