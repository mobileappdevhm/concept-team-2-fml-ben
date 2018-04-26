import 'package:flutter/material.dart';

typedef List<Widget> ResultBuilder(String result);

class SearchWidget extends StatefulWidget {

  final Widget child;
  final ResultBuilder onResult;
  SearchWidget(this.child, {this.onResult});

  @override
  State createState() => new _SearchWidgetState();

}

class _SearchWidgetState extends State<SearchWidget> {

  String _searchText = "";
  Widget _child;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    _child = widget.child;
    controller = new TextEditingController(text: _searchText);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
          child: new TextField(
            onChanged: (newText) {
              setState(() {
                _searchText = newText;
                if (widget.onResult != null &&_searchText.length > 0) {
                  _child = new ListView(
                    children: widget.onResult(_searchText),
                  );
                }
                else {
                  _child = widget.child;
                }
              });
            },
            decoration: new InputDecoration(
              hintText: 'Search...',
              suffixIcon: _searchText.length > 0 ? new GestureDetector(
                onTap: () {
                  setState(() {
                    controller.clear();
                    _searchText = '';
                    _child = widget.child;
                  });
                },
                child: new Icon(Icons.clear),
              ) : null
            ),
            controller: controller,
          ),
        ),
        new Expanded(
          child: _child,
        )
      ],
    );
  }

}