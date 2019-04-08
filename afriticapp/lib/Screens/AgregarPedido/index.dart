import 'dart:io';
import 'package:afriticapp/API_Access/Controlador.dart';
import 'package:afriticapp/API_Access/ProductosControlador.dart';
import 'package:flutter/material.dart';
import '../../Components/PrototipoProdPedido.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../Components/InputFields.dart';
import '../../Components/InputNumFields.dart';
import '../../Components/GenericButton.dart';

class AddOrder extends StatefulWidget
{

  const AddOrder  ({Key key}):super(key:key);

  @override
  AddOrderState createState() => new AddOrderState();
}

class AddOrderState extends State<AddOrder > {
  
  File image;
  String filename;
  List<int> prods = new List(),cants = new List();
  var dropOptValEst = {
            'Pendiente':'PE', 
            'Entregado':'EN',
            };
  var dropOptEst = new List<DropdownMenuItem<String>>();
  List<Product> dropOptValProd = new List<Product>();
  var dropOptProd = new List<DropdownMenuItem<int>>();
  void initState()
  {
    var c = Controlador();
    c.Inventario().then((_)
      {
        dropOptValProd = c.ProductosC.Inventario;
        setState(() {
          dropOptValProd.map(
            (prod)
            {
              dropOptProd.add(
                new DropdownMenuItem<int>(
                  value: prod.ProductID,
                  child: Text(prod.Nombre),
                )
              );
            }
          );
        });
      }      
    );
    dropOptValEst.forEach((k,v) {
          dropOptEst.add(DropdownMenuItem<String>(
            value: v,
            child: Text(k),
            )
          );
        });

  }
  

  final clienteController = new TextEditingController();
  final prodController = new TextEditingController();
  final cantController = new TextEditingController();
  String tipoEstado;
  int valorProd;
  int precio = 0;

  void add()
  {
    var c = Controlador();
    Map<String,dynamic> p ={
      "Cliente": clienteController.text,
      "Tipo_Estado": tipoEstado,
      "Precio_Total": precio,
      "Productos":[],
      "Usuario": c.UsuariosC.Logueado.UserID
    };
    List<Map<String,int>> prod = List<Map<String,int>>();
    for (var i = 0; i < prods.length; i++) {
      prod.add(
        {"ProductID": prods[i]}
      );
    }
    p["Productos"] = prod;

    
    c.Escribir(2, p);
    
  }

  Future<Null> addProd(BuildContext context)
  {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Añadir Producto'),
              content: Column(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(hintText: "ID Producto"),
                      cursorColor: Color.fromRGBO(247, 64, 106, 1.0),
                      controller: prodController,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Cantidad"),
                      cursorColor: Color.fromRGBO(247, 64, 106, 1.0),
                      controller: cantController,
                    ),
                  )                  
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('Enviar'),
                  textColor:  Color.fromRGBO(247, 64, 106, 1.0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text('Cancelar'),
                  textColor:  Color.fromRGBO(247, 64, 106, 1.0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
  }

  Future<Null> sumPrecio() async
  {
    var c = Controlador();
    var cant = cants.last;
    var response = await c.APIparametros(3, prods.last);
    if(response is int)
    {
      print("error");
    }
    else{
      precio += response['Precio']*cant;
    }

  }

  Widget build(BuildContext context)
  {
    var screenSize = MediaQuery.of(context).size;

        GestureDetector bsaveproduct = new GestureDetector(
            child: 
            GenericButton(
              title: "guardar",
            ),
            onTap: (){
              add();
              Navigator.pop(context);
            },
        );
        AppBar appBar = new AppBar(
          title: Text("Nueva Orden"),
          backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
          actions: <Widget>[
          ],
        );

        InputFieldArea cliente = 
            InputFieldArea(
              hint: "Cliente",
              obscure: false,
              controller: clienteController,
            );

        DropdownButton estadoDrop = 
          DropdownButton<String>(
              value: tipoEstado,
              style: const TextStyle(
              color: Color.fromRGBO(247, 64, 106, 1.0),
              ),                  
              onChanged: (String newValue) {
                setState(() {
                  tipoEstado = newValue;
                });
              },
              items: dropOptEst
        );

        List<PrototipoProdPedido> productos = List<PrototipoProdPedido>();

        Container neworder = Container(
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
            child:
              ListView(
                children: <Widget>[
                  Padding(
                    child: cliente,
                    padding: EdgeInsets.all(15),
                  ),
                  Padding(
                    child: estadoDrop,
                    padding: EdgeInsets.all(15),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: ListView.builder(
                        itemBuilder: (BuildContext context,int index){
                          return productos[index%productos.length];
                        },
                        itemCount: productos.length,
                        shrinkWrap: true,
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(precio.toString()),
                  ),
                  Padding(
                    child: bsaveproduct,
                    padding: EdgeInsets.all(15),
                  ),                  
                ]
              )
        );

      
    

      return (new WillPopScope(
        onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomPadding: false,
        body:Stack(
          children: <Widget>[
            Center(
              child:neworder,       
              ),
          ]
          ), 
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          addProd(context).then(
            (_)
            {
              prods.add(int.parse(prodController.text));
              cants.add(int.parse(cantController.text));
              productos.add(
                PrototipoProdPedido(
                  prod: prods[prods.length-1],
                  cant: cants[prods.length-1],
                )
              );
              sumPrecio();
            }
          );
          setState(() {
                
          });
        }
      )
    )
    ));
  }
}