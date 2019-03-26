import 'package:flutter/material.dart';

class RowProducto
{
  String text;
  DecorationImage image;
  RowProducto(this.text,this.image);
}

class RowProductoBuilder
{
  List<RowProducto> listaPedidos = new List<RowProducto>();

  RowProductoBuilder()
  {
    for (var i = 0; i < 3; i++) {
      listaPedidos.add(
        new RowProducto(
          "lala",
          DecorationImage(
            image: AssetImage("assets/avatars/avatar-"+(i+1).toString()+".jpg")
          ))
      );
    }
  }
}
