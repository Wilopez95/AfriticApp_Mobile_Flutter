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
        product: producto,
        )
      )
    ).toList();
  }



  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;
    AppBar appBar = new AppBar(
      title: Text("Productos"),
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

    AnimatedContainer productosconteiner = AnimatedContainer(
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
            FutureBuilder(
              future: productos.cargarDatos(),
              builder: (_,op) {
                if(op.connectionState == ConnectionState.done)
                {
                  var _items = construirLista();
                  var lista = ListView.builder(
                    padding: EdgeInsets.all(5),
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context,int index){
                      return _items[index%_items.length];
                    });
                  return RefreshIndicator(
                    child: lista,
                    onRefresh: (){
                      setState(() {
                        
                      });
                    },
                  );
                }
                else
                {
                  return CircularProgressIndicator();
                }
              },
            )
        ] 

      ),
    );
    

    List<Widget> _pages = <Widget>[
      productosconteiner,
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
            Navigator.pushNamed(context, "/add_prod");
          },
          child: Icon(
          Icons.add,
          ),
        )
      ),
    ));

  }
  
}