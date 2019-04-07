import 'package:afriticapp/API_Access/ProductosControlador.dart';
import 'package:flutter/material.dart';
import '../Screens/Productos/data.dart';

class PrototipoListaProductos extends StatelessWidget {
  PrototipoListaProductos({this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: (MediaQuery.of(context).size.height/10),
      width: (MediaQuery.of(context).size.height/10),
      padding: EdgeInsets.all(5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            child: new Container(
              width: MediaQuery.of(context).size.height/10,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(product.Img_url)
                ),
              ) 
            ),
            onTap: (){
              var prod = new ProductoContainer();
              prod.producto = product;
              Navigator.pushNamed(context, "/desc_prod");
            },
          ),
          new Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: new Column(
            children: <Widget>[
                new Text(
                product.Nombre,
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
                new Text(
                product.Precio.toString(),
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
            onPressed: (){

            },
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