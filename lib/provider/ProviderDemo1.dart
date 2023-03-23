import 'package:final_project/models/myModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          backgroundColor: Colors.grey,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<MyModel>(
                  builder: (context, mymodel, child) {
                    // return RaisedButton(
                    //   child: Text('Do something'),
                    //   onPressed: () {
                    //     mymodel.doSomething();
                    //   },
                    // );
                    return TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        print("click");
                        mymodel.doSomething();
                      },
                      child: Text('Do something'),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  builder: (context, mymodel, child) {
                    return Text(mymodel.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
