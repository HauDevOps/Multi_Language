import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_lang/provider/counter.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('vn', ''),
          Locale('ja', ''),// Spanish, no country code
        ],
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, countPro, child){
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).helloWorld,
                ),
                Text(
                  countPro.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      //C1: làm gọn
                      click = !click;
                      S.load(Locale(click ? 'vn' : 'en'));

                      //C2: Truyền thống
                      // if(!click){
                      //   S.load(Locale('vn'));
                      //   click = true;
                      // }else{
                      //   S.load(Locale('en'));
                      //   click = false;
                      // }
                    });
                  },
                  child: Text('Change Language'),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              countPro.incrementCounter();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
