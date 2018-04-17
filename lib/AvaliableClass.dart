import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'GlobalFunctions.dart';


class AvaliableClass extends StatefulWidget {
  AvaliableClass({Key key}) : super(key: key);

  @override
  _AvaliableClassState createState() => new _AvaliableClassState();
}

class _AvaliableClassState extends State<AvaliableClass>{
  List<Class> ClassList = getAvaliableClasses();

  @override
  Widget build(BuildContext context) {
    ListView Class_List;
    Class_List = new ListView(
      children: [
        new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                ClassList[index].isExpanded = !ClassList[index].isExpanded;
              });
            },
            children: ClassList.map((Class item) {
              return new ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
                    title: new Text(
                      item.header,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),

                    ),
                  );
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
        )
      ],
    );
    Scaffold scaffold = new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("Avaliable Classes"),
      ),
      body: Class_List,
    );
    return scaffold;
  }
}