import 'package:flutter/material.dart';

class PrototipoListaProductos extends StatelessWidget {
  PrototipoListaProductos({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return (new Container(
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(10),
            child: new Text(
            "Imagen.jpg",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.3,
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(10),
            child: new Column(
            children: <Widget>[
                new Text(
                text,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
                new Text(
                text,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          new RaisedButton(
            child: new Text("Botón-1"),
            onPressed: null,
          ),
          new RaisedButton(
            child: new Text("Botón-2"),
            onPressed: null,
          ),
        ],
      )
    ));
  }
}