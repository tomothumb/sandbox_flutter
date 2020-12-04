import 'package:event_app/bloc/authentication/bloc.dart';
import 'package:event_app/bloc/authentication/event.dart';
import 'package:event_app/bloc/signin/bloc.dart';
import 'package:event_app/bloc/signin/event.dart';
import 'package:event_app/bloc/signin/repository_firebase.dart';
import 'package:event_app/bloc/signin/state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {

  SignInScreen({Key key, this.analytics, this.observer})
      : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Widget build(BuildContext context) {

    print('signin');

    final signInBloc = BlocProvider.of<SignInBloc>(context);
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
      ),
      body: BlocBuilder<SignInBloc, SignInState>(
        // bloc: signInBloc,
        builder: (context, state) {
          if(state is SignInLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is SignInSuccess){
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Success"),
                  RaisedButton(
                    onPressed: () {
                      authenticationBloc.add(LoggedIn());
                    },
                    child: Text('StartApp')
                  ),
                ],
              )
            );
          }

          if(state is SignInFailure){
            return Center(
              child: Text('Failure'),
            );
            // return SignInScreen();;
          }

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton.icon(
                    onPressed: (){
                      signInBloc.add(SignInAnonymouslyOnPressed());
                    },
                    icon: Icon(Icons.account_circle),
                    label: Text('Guest Login')
                ),
                RaisedButton.icon(
                  onPressed: (){
                    signInBloc.add(SignInWithGoogleOnPressed());
                  },
                  icon: Icon(Icons.login,
                  color: Colors.white),
                  label: Text("Login with Google", style: TextStyle(color: Colors.white))
                )
              ],
            )
          );

        }
      )

    );
  }
}
