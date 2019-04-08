import 'package:flutter/material.dart';
import '../../Components/GenericButton.dart';
import '../../API_Access/Controlador.dart';
import '../Pedidos/data.dart';


class DetallePedido extends StatefulWidget
{
  const DetallePedido ({Key key}):super(key:key);

  @override
  DetallePedidoState createState() => new DetallePedidoState();
}

class DetallePedidoState extends State<DetallePedido> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;
    //pedido del dto
    var pedido = PedidoContainer.instance.pedido;

    AppBar appBar = new AppBar(
      title: Text("${pedido.Cliente} ${pedido.Fecha}"),
      backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
      actions: <Widget>[
        
      ],
    );


    var fields = <Widget>[
      Padding(
        child: Text("Precio: ${pedido.Precio_Total}"),
        padding: EdgeInsets.all(15),
      ),
      Padding(
        child: Text("Estado: ${pedido.Tipo_Estado}"),
        padding: EdgeInsets.all(15),
      ),
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