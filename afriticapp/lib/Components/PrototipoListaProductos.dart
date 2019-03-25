import 'package:flutter/material.dart';

class PrototipoListaProductos extends StatelessWidget {
  PrototipoListaProductos({this.text, this.image});
  final String text;
  final DecorationImage image;
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: (MediaQuery.of(context).size.height/10),
      width: (MediaQuery.of(context).size.height/10),
      padding: EdgeInsets.all(5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.height/10,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: image,
            ) 
          ),
          new Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: new Column(
            children: <Widget>[
                new Text(
                text,
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
                new Text(
                text,
                style: new TextStyle(
                    color: Colors.black45,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          new IconButton(
            icon: Icon(Icons.edit),
            onPressed: null,
          ),
          new IconButton(
            icon: Icon(Icons.delete),
            onPressed: null,
          ),
        ],
      )
    ));
  }
}