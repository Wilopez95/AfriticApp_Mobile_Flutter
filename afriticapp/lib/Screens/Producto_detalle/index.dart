import 'package:flutter/material.dart';
import '../../Components/GenericButton.dart';
import '../../API_Access/Controlador.dart';
import '../Productos/data.dart';


class DetalleProducto extends StatefulWidget
{
  const DetalleProducto ({Key key}):super(key:key);

  @override
  DetalleProductoState createState() => new DetalleProductoState();
}

class DetalleProductoState extends State<DetalleProducto> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;
    //producto del dto
    var prod = ProductoContainer.instance.producto;

    AppBar appBar = new AppBar(
      title: Text("${prod.ProductID} ${prod.Nombre}"),
      backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
      actions: <Widget>[
        
      ],
    );

    // id,estado,nombre,descripcion,imagen,tipo,precio,cantidad

    var fields = <Widget>[
      Padding(
        child: Container(
          height: screenSize.height/5,
          width: screenSize.width/5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(prod.Img_url)
            ),
            shape: BoxShape.circle,
          ),
        ),
        padding: EdgeInsets.all(15),
      ),
      Padding(
        child: Text("Descripcion: ${prod.Descripcion}"),
        padding: EdgeInsets.all(15),
      ),
      Padding(
        child: Text("Precio: ${prod.Precio.toString()}"),
        padding: EdgeInsets.all(15),
      ),
      Padding(
        child: Text("Cantidad disponible: ${prod.Cantidad}"),
        padding: EdgeInsets.all(15),
      ),
      Padding(
        child: Text("Tipo: ${prod.Tipo_Producto}"),
        padding: EdgeInsets.all(15),
      ),
      Padding(
        child: Text("Estado: ${prod.Estado_Producto}"),
        padding: EdgeInsets.all(15),
      )
    ];

    Container administrar = Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: BoxDecoration(
      gradient: new LinearGradient(
        colors: <Color>[
          const Color.fromRGBO(162, 146, 199, 0.8),
          const Color.fromRGBO(51, 51, 63, 0.9),
        ],
        stops: [0.2, 1.0],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
      )),  
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: fields            
          )
        ],
      ),
    );



    List<Widget> _pages = <Widget>[
      administrar,
    ];

    return (new WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: appBar,
        body:Center(
          child: PageView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
                },       
          ),
        ),
      ),
    ));
  }
  
}