import 'dart:io';

import 'package:afriticapp/API_Access/Controlador.dart';
import 'package:afriticapp/API_Access/ProductosControlador.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../Components/InputFields.dart';
import '../../Components/GenericButton.dart';

class AddProducto extends StatefulWidget
{

  const AddProducto ({Key key}):super(key:key);

  @override
  AddProductoState createState() => new AddProductoState();
}

class AddProductoState extends State<AddProducto> {

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
       
    var fields = <Widget>[
      Padding(
        padding: EdgeInsets.all(15),
        child: new GestureDetector(
                      onTap: (){
                        _getImage();
                      },
                      child: new Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                              "https://www.freeiconspng.com/uploads/no-image-icon-32.png"
                                )
                        )
                    )),
                  ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: InputFieldArea(
          hint: "Nombre",
          obscure: false,
          controller: nombreController,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: InputFieldArea(
          hint: "Descripcion",
          obscure: false,
          controller: descController,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: InputFieldArea(
          hint: "Tipo Producto",
          obscure: false,
          controller: tipoController,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: InputFieldArea(
          hint: "Precio",
          obscure: false,
          controller: precioController,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: InputFieldArea(
          hint: "Cantidad",
          obscure: false,
          controller: cantController,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: GestureDetector(
          onTap: (){
            add();
            Navigator.pop(context);
          },
          child: GenericButton(
            title: "Añadir",
          ),
        ),
      )
    ];
    
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Agregar Producto"),
      ),

      body: Stack(
        children: <Widget>[
          Container(
            height: screenSize.height,
            width: screenSize.width,
            color: const Color.fromRGBO(162, 146, 199, 0.8),
            child: Center(
              child: ListView(
                children: fields,
              ),
            ),
          )
        ],
      ),

    );
  }  
}