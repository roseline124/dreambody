import 'package:dreambody/bloc/BlocProvider.dart';
import 'package:dreambody/bloc/CounterBloc.dart';
import 'package:flutter/material.dart';

import 'package:dreambody/screens/signInScreen/signIn.dart';

import 'package:dreambody/bloc/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //
    final CounterBloc bloc = BlocProvider.of(context);
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo: Home Screen'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          StreamBuilder(
            initialData: UserInfo(currentWeight_: 0),
            stream: counterBloc.counterStream,
            builder: (BuildContext context, snapshot) {
              return Center(
                child: Text(
                  "Clicked " + snapshot.data.currentWeight.toString() + " times!",
                  style: TextStyle(fontSize: 18),
                ),
              );
            },
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: Text('DreamBody Start'),
          ),
        ],)
      ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.UpdateUserInfo('{"currentWeight": 2.0}');
        },
        tooltip: 'Update',
        child: Icon(Icons.add),
      ),
      //
    );
  }
}