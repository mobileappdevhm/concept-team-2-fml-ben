import 'package:flutter/material.dart';
import './AvaliableClass.dart' as AvaliableClass;
import './MapPage.dart' as MapPage;
import './MyClasses.dart' as MyCasses;
import './ClassInfo.dart';
import './FacultyPage.dart';

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
     routes: <String, WidgetBuilder>{
       ClassInfo.routeName: (BuildContext context) => new ClassInfo(),
       FacultyPage.routeName: (BuildContext context) => new FacultyPage(),
    },
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
        backgroundColor: Colors.red,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.assignment)),
            new Tab(icon: new Icon(Icons.map)),
            new Tab(icon: new Icon(Icons.list)),
          ]
        ),
      ),
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new MyCasses.MyClasses(),
            new MapPage.MapPage(),
            new AvaliableClass.AvaliableClass(),
          ],
      ),
    );
  }
}
