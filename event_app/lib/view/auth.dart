import 'package:event_app/bloc/authentication/bloc.dart';
import 'package:event_app/bloc/authentication/event.dart';
import 'package:event_app/bloc/authentication/repository_fireauth.dart';
import 'package:event_app/bloc/authentication/state.dart';
import 'package:event_app/bloc/signin/bloc.dart';
import 'package:event_app/bloc/signin/repository_firebase.dart';
import 'package:event_app/view/signin.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/event_list/repository_firestore.dart';
import 'eventlist.dart';

class AuthScreen extends StatelessWidget {

  AuthScreen({Key key, this.analytics, this.observer})
      : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;


  @override
  Widget build(BuildContext context) {

    final authenticationRepository = FirestoreAuthenticationRepository();

    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(authRepository: authenticationRepository)..add(AppStarted()),
          ),
          BlocProvider<SignInBloc>(
            create: (BuildContext context) => SignInBloc(signInRepository: FirebaseSignInRepository()),
          ),
        ],
        child: AuthScreenContent(
          analytics: analytics,
          observer: observer,
        )
    );

    // return BlocProvider<AuthenticationBloc>(
    //   create: (context) {
    //     return AuthenticationBloc(authRepository: authenticationRepository)
    //         ..add(AppStarted());
    //   },
    //   child: AuthScreenContent(
    //     analytics: analytics,
    //     observer: observer,
    //   )
    // );

  }
}


class AuthScreenContent extends StatelessWidget {

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  AuthScreenContent({Key key,  this.analytics, this.observer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    print('auth');

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      // bloc: authBloc,
        builder: (context, state) {
          if(state is AuthenticationInProgress){
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          if(state is AuthenticationSuccess){
            return EventListScreen();
          }

          if(state is AuthenticationFailure){
            return Center(
              child: SignInScreen(
                analytics: analytics,
                observer: observer,
              ),
            );
            // return SignInScreen();;
          }

          return Container();

        }
    );
  }
}
