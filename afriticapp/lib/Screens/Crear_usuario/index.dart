import 'package:afriticapp/API_Access/Controlador.dart';
import 'package:flutter/material.dart';
import '../../Components/GenericButton.dart';
import '../../Components/InputFields.dart';


class Newuser extends StatefulWidget
{
  const Newuser ({Key key}):super(key:key);

  @override
  NewuserState createState() => new NewuserState();
}

class NewuserState extends State<Newuser> {

  final nombreController = new TextEditingController();
  final apellidoController = new TextEditingController();
  final correoController = new TextEditingController();
  final passController = new TextEditingController();
  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;

      GestureDetector bnewuser = new GestureDetector(
            child: 
            GenericButton(
              title: "Guardar",
            ),
            onTap: (){
              var c = Controlador();
              var map = {
                "Nombre":nombreController.text,
                "Apellido":apellidoController.text,
                "Correo":correoController.text,
                "Contraseña":passController.text
              };

              c.Escribir(0, map);
              Navigator.pop(context);
            },
          );

          InputFieldArea nombre = 
            InputFieldArea(
              hint: "Nombre",
              obscure: false,
              controller: nombreController,
            );

          InputFieldArea apellido = 
            InputFieldArea(
              hint: "Apellido",
              obscure: false,
              controller: apellidoController,
            );

            InputFieldArea email = 
              InputFieldArea(
                hint: "Correo",
                obscure: false,
                controller: correoController,
            );


          InputFieldArea pass = 
            InputFieldArea(
              hint: "Contraseña",
              obscure: true,
              controller: passController,
            );

        
    AppBar appBar = new AppBar(
      title: Text("Nuevo usuario"),
      backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
      actions: <Widget>[
        
      ],
    );

    AnimatedContainer nuevo_usuario = AnimatedContainer(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                child: nombre,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: apellido,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: email,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: pass,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: bnewuser,
                padding: EdgeInsets.all(15),
              ),
                          ],            
          )
        ],
      ),
    );



    List<Widget> _pages = <Widget>[
       nuevo_usuario,
    ];

    return (new WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomPadding: false,
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