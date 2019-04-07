import 'dart:io';

import 'package:afriticapp/API_Access/Controlador.dart';
import 'package:flutter/material.dart';
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

  final nombreController = new TextEditingController();
  final descController = new TextEditingController();
  final tipoController = new TextEditingController();
  final precioController = new TextEditingController();
  final cantController = new TextEditingController();

   Future _getImage() async{
    var selectedImagen =await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
     image =selectedImagen;
     filename =basename(image.path);
    });
  }

  void add()
  {
    int precio = int.tryParse(precioController.text);
    int cant = int.tryParse(cantController.text);
    Map<String,dynamic> p ={
      "Nombre": nombreController.text,
      "Descripcion": descController.text,
      "Img_url" : "nono",
      "Tipo_Producto": tipoController.text,
      "Precio": precio,
      "Cantidad": cant
    };

    var c = Controlador();
    c.Escribir(1, p);
    
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
              //Navigator.pushNamed(context, "/pedidos");
            },
          );
              AppBar appBar = new AppBar(
              title: Text("Nueva Orden"),
              backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
              actions: <Widget>[
              ],
            );

           

             AnimatedContainer neworder = AnimatedContainer(
                duration: Duration(seconds: 10),
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
                        children: <Widget>[  
                        ],
                      )
                    ],
                  ),
             );

       

    List<Widget> _pages = <Widget>[
      neworder,
    ];
    

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
              child: PageView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
                },       
          ),
        ),
          ],
          
        )
        

      ),
    ));
  }  
}