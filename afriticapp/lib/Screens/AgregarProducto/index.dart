import 'dart:io';

import 'package:afriticapp/API_Access/Controlador.dart';
import 'package:afriticapp/API_Access/ProductosControlador.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../Components/InputFields.dart';
import '../../Components/InputNumFields.dart';
import '../../Components/GenericButton.dart';

String dropdownValue = 'Pulsera';

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
  String dropValue;

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
      "Tipo_Producto": dropValue,
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
              title: "Añadir",
            ),
            onTap: (){
              add();
              Navigator.pop(context);
            },
          );

           InputFieldArea nombre = 
            InputFieldArea(
              hint: "Nombre",
              obscure: false,
              controller: nombreController,
            );
 
            InputFieldArea descripcion = 
            InputFieldArea(
              hint: "Descripcion",
              obscure: false,
              controller: descController,
            );

            InputNumFieldArea precio = 
            InputNumFieldArea(
              hint: "Precio",
              obscure: false,
              controller: precioController,
            );

            InputNumFieldArea cantidad = 
            InputNumFieldArea(
              hint: "Cantidad",
              obscure: false,
              controller: cantController,
            );

            AppBar appBar = new AppBar(
              title: Text("Nuevo Producto"),
              backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
              actions: <Widget>[
              ],
            );

            var dropOptVal = {
                    'Pulsera':'PU', 
                    'Collar':'CO',
                    'Camisa':'CA',
                    'Turbante':'TU',
                    'Bufanda':'BU'};
            var dropOpt = new List<DropdownMenuItem<String>>();

            dropOptVal.forEach((k,v) {
                      dropOpt.add(DropdownMenuItem<String>(
                        value: v,
                        child: Text(k),
                        )
                      );
                    });

            DropdownButton tipo_product = 
              DropdownButton<String>(
                  value: dropValue,
                  style: const TextStyle(
                  color: Color.fromRGBO(247, 64, 106, 1.0),
                  ),                  
                  onChanged: (String newValue) {
                    setState(() {
                      dropValue = newValue;
                    });
                  },
                  items: dropOpt

            );

             AnimatedContainer newproduct = AnimatedContainer(
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
                                border: new Border.all(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
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
                            child: nombre,
                            padding: EdgeInsets.all(15),
                          ),
                          Padding(
                            child: descripcion,
                            padding: EdgeInsets.all(15),
                          ),
                           Padding(
                            child: tipo_product,
                            padding: EdgeInsets.all(15),
                          ),
                          Padding(
                            child: precio,
                            padding: EdgeInsets.all(15),
                          ),                   
                          Padding(
                            child: cantidad,     
                            padding: EdgeInsets.all(15),
                          ),
                          Padding(
                            child: bsaveproduct,
                            padding: EdgeInsets.all(15),
                          )
                        ],
                      )
                    ],
                  ),
             );

       

    List<Widget> _pages = <Widget>[
      newproduct,
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
              child: ListView.builder(
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