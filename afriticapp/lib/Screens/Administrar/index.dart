import 'package:flutter/material.dart';
import '../../Components/GenericButton.dart';


class Administrar extends StatefulWidget
{
  const Administrar ({Key key}):super(key:key);

  @override
  AdministrarState createState() => new AdministrarState();
}

class AdministrarState extends State<Administrar> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;

        GestureDetector bcrearuser = new GestureDetector(
            child: 
            GenericButton(
              title: "Cuenta nueva",
            ),
            onTap: (){
              Navigator.pushNamed(context, "/new_user");
            },
          );
        GestureDetector badministrarusuarios = new GestureDetector(
            child: 
            GenericButton(
              title: "Administrar usuarios",
            ),
            onTap: (){
              Navigator.pushNamed(context, "/admin_usuarios");
            },
          );
        GestureDetector badministrarproductos = new GestureDetector(
            child: 
            GenericButton(
              title: "Administrar productos",
            ),
            onTap: (){
              Navigator.pushNamed(context, "/admin_pedidos");
            },
          );



    AppBar appBar = new AppBar(
      title: Text("Adminsitrar"),
      backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
      actions: <Widget>[
        
      ],
    );

    AnimatedContainer administrar = AnimatedContainer(
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
                child:bcrearuser ,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child:badministrarproductos ,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child:badministrarusuarios ,
                padding: EdgeInsets.all(15),
              ),

            ],            
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