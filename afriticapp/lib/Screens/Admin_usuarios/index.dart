import 'package:flutter/material.dart';
import '../../Components/GenericButton.dart';


class Adminusers extends StatefulWidget
{
  const Adminusers ({Key key}):super(key:key);

  @override
  AdminusersState createState() => new AdminusersState();
}

class AdminusersState extends State<Adminusers> {

  

  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;

      


    AppBar appBar = new AppBar(
      title: Text("Adminsitrar Usuarios"),
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
            children: <Widget>[],            
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