import 'package:flutter/material.dart';
import './AvaliableClass.dart' as AvaliableClass;
import './MapPage.dart' as MapPage;
import './MyClasses.dart' as MyCasses;

void main() => runApp(new MyApp());

int count=0;

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'demo_muas_sliding',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MUAS DEMO"),
        backgroundColor: Colors.lime,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.map)),
            new Tab(icon: new Icon(Icons.assignment)),
            new Tab(icon: new Icon(Icons.list)),
          ]
        ),
      ),
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new MapPage.MapPage(),
            new MyCasses.MyClasses(),
            new AvaliableClass.AvaliableClass(),
          ],
      ),
    );
  }
}
