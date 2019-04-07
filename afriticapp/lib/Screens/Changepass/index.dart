import 'package:flutter/material.dart';
import 'package:afriticapp/Screens/Pedidos/data.dart';
import '../../Components/GenericButton.dart';
import '../../Components/InputFields.dart';


class Changepass extends StatefulWidget
{
  const Changepass ({Key key}):super(key:key);

  @override
  ChangepassState createState() => new ChangepassState();
}

class ChangepassState extends State<Changepass> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;

        GestureDetector bchangepass = new GestureDetector(
            child: 
            GenericButton(
              title: "Cambiar Contraseña",
            ),
            onTap: (){
              //Navigator.pushNamed(context, "/pedidos");
            },
          );


          GestureDetector oldpass = GestureDetector(
            child: 
            InputFieldArea(
              hint: "Contraseña actual",
              obscure: true,
            ),
          );
          GestureDetector newpass = GestureDetector(
            child: 
            InputFieldArea(
              hint: "Nueva contraseña",
              obscure: true,
            ),
          );
          GestureDetector confirmpass = GestureDetector(
            child: 
            InputFieldArea(
              
              hint: "Confirme nueva contraseña",
              obscure: true,
            ),
          );



    AppBar appBar = new AppBar(
      title: Text("Cambiar Contraseña"),
      backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
      actions: <Widget>[
      ],
    );

    AnimatedContainer resetpass = AnimatedContainer(
      duration: Duration(seconds: 10),
      //height: screenSize.height,
      //width: screenSize.width,
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
                child: oldpass,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: newpass,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: confirmpass,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child:bchangepass ,
                padding: EdgeInsets.all(15),
              )
            ],            
          ),

        ],
      ),
    );



    List<Widget> _pages = <Widget>[
      resetpass,
    ];

    return (new WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: appBar,
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