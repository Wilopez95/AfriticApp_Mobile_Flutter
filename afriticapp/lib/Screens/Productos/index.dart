import 'package:flutter/material.dart';
import 'package:afriticapp/Screens/Productos/data.dart';
import 'package:afriticapp/Components/PrototipoListaProductos.dart';
import 'package:draggable_floating_button/draggable_floating_button.dart';

class Productos extends StatefulWidget{
  const Productos ({Key key}) :super(key:key);

  @override
  ProductosState createState() => new ProductosState();
  
}



class ProductosState extends State<Productos> {

  RowProductoBuilder productos = new RowProductoBuilder();

  List construirLista()
  {
    return productos.listaPedidos.map(
      (producto) => (PrototipoListaProductos(
        text: producto.Nombre,
        image: DecorationImage(
            image: NetworkImage(producto.Img_url),
          )
        )
      )
    ).toList();
  }



  Widget build(BuildContext context)
  {
    AppBar appBar = new AppBar(
      title: Text("AfriticaApp"),
      backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
      actions: <Widget>[
        IconButton(
          onPressed: () {

          },
          icon: new Icon(Icons.search),
          alignment: AlignmentDirectional.centerEnd,
        ),
        IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.menu),
        )
      ],
    );

    



    return new Scaffold(
      appBar: appBar,
      body: 
        Stack(
          children: <Widget>[
            FutureBuilder(
              future: productos.cargarDatos(),
              builder: (_,op) {
                if(op.connectionState == ConnectionState.done)
                {
                  var _items = construirLista();
                  return ListView.builder(
                    padding: EdgeInsets.all(5),
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context,int index){
                      return _items[index%_items.length];
                    },
                  );
                }
              },
            )
        ] 
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
      )
    );
  }
  
}