import 'package:flutter/material.dart';
import '../../Components/PrototipoListaPedidos.dart';
import 'package:afriticapp/Screens/Pedidos/data.dart';


class Pedidos extends StatefulWidget
{
  const Pedidos ({Key key}):super(key:key);

  @override
  PedidosState createState() => new PedidosState();
}

class PedidosState extends State<Pedidos> {

  RowPedidoBuilder pedidos =new RowPedidoBuilder();

  List construirLista()
  {
    return pedidos.listaPedidos.map(
      (pedido) => (PrototipoListaPedidos(
        text: pedido.PedidoID.toString(),
        )
      )
    ).toList();
  }

  Widget build(BuildContext context)
  {
    AppBar appBar = new AppBar(
      title: Text("Pedidos"),
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
    var screenSize = MediaQuery.of(context).size;

AnimatedContainer pedidosconteiner = AnimatedContainer(
  duration: Duration(seconds: 10),
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

        ] 

      ),
);
    

    List<Widget> _pages = <Widget>[
      pedidosconteiner,
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
        floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
        onPressed: ()
          {
            Navigator.pushNamed(context, "/add_ped");
          },
        child: Icon(
          
          Icons.add,
        ),
      )
      ),
    ));

  }
  
}
