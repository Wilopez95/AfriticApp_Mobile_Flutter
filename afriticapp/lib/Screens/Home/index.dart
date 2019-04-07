import 'dart:io';
import 'package:afriticapp/API_Access/Controlador.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/GenericButton.dart';
import '../../Components/MenuRoundButton.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();
}


class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Animation<double> containerGrowAnimation;
  AnimationController _screenController;
  AnimationController _buttonController;
  Animation<double> buttonGrowAnimation;
  Animation<double> listTileWidth;
  Animation<Alignment> listSlideAnimation;
  Animation<Alignment> buttonSwingAnimation;
  Animation<EdgeInsets> listSlidePosition;
  Animation<Color> fadeScreenAnimation;
  File image;
  String filename;
  var animateStatus = 0;
  bool flagadmin = false;



  @override
  void initState() {
    super.initState();

    _screenController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1500), vsync: this);

    fadeScreenAnimation = new ColorTween(
      begin: const Color.fromRGBO(247, 64, 106, 1.0),
      end: const Color.fromRGBO(247, 64, 106, 0.0),
    )
        .animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: Curves.ease,
      ),
    );
    containerGrowAnimation = new CurvedAnimation(
      parent: _screenController,
      curve: Curves.easeIn,
    );

    buttonGrowAnimation = new CurvedAnimation(
      parent: _screenController,
      curve: Curves.easeOut,
    );
    containerGrowAnimation.addListener(() {
      this.setState(() {});
    });
    containerGrowAnimation.addStatusListener((AnimationStatus status) {});

    listTileWidth = new Tween<double>(
      begin: 1000.0,
      end: 600.0,
    )
        .animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.225,
          0.600,
          curve: Curves.bounceIn,
        ),
      ),
    );

    listSlideAnimation = new AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )
        .animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.325,
          0.700,
          curve: Curves.ease,
        ),
      ),
    );
    buttonSwingAnimation = new AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
    )
        .animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.225,
          0.600,
          curve: Curves.ease,
        ),
      ),
    );
    listSlidePosition = new EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 16.0),
      end: const EdgeInsets.only(bottom: 80.0),
    )
        .animate(
      new CurvedAnimation(
        parent: _screenController,
        curve: new Interval(
          0.325,
          0.800,
          curve: Curves.ease,
        ),
      ),
    );
    _screenController.forward();
    //init
    var c = Controlador();
    flagadmin = c.UsuariosC.Logueado.Tipo_Cuenta == "A";

  }

  @override
  void dispose() {
    _screenController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  Future _getImage() async{
    var selectedImagen =await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
     image =selectedImagen;
     filename =basename(image.path); 
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.3;
    Size screenSize = MediaQuery.of(context).size;

    var c = Controlador();

    final _controller = new PageController();

    GestureDetector bMenu = new GestureDetector(
      child: MenuRoundButton(buttonGrowAnimation: buttonGrowAnimation),
      onTap: () {setState(() {
              _controller.jumpToPage(1);
            });
            },
    );

    GestureDetector bProd = new GestureDetector(
              child: 
              GenericButton(
                title: "Productos",
              ),
              onTap: (){
                Navigator.pushNamed(context, "/productos");
              } ,
          );

    GestureDetector bPedidos = new GestureDetector(
            child: 
            GenericButton(
              title: "Pedidos",
            ),
            onTap: (){
              Navigator.pushNamed(context, "/pedidos");
            },
          );

    
    GestureDetector bCambiarContrasena = new GestureDetector(
      child: GenericButton(
        title: "Cambiar contraseña",
      ),
      onTap: () {
        Navigator.pushNamed(context, "/changepass");
      },
    );

    GestureDetector bEstadisticas = new GestureDetector(
      child: GenericButton(
        title: "Estadistica",
      ),
      onTap: () {
        Navigator.pushNamed(context, "/estadisticas");
      },
    );

    GestureDetector bAdmisnitrar = new GestureDetector(
      child: GenericButton(
        title: "Administrar",
      ),
      onTap: () {
        Navigator.pushNamed(context, "/administrar");
      },
    );

      GestureDetector bSalir = new GestureDetector(
      child: GenericButton(
        title: "Salir",
      ),
      onTap: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );

    List<Widget> botonesmenuadm = <Widget>[
              Padding(
                child:bCambiarContrasena ,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: bEstadisticas,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: bAdmisnitrar,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: bSalir,
                padding: EdgeInsets.all(15),
              ),
            ];

        List<Widget> botonesmenu = <Widget>[
              Padding(
                child:bCambiarContrasena ,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: bEstadisticas,
                padding: EdgeInsets.all(15),
              ),
              Padding(
                child: bSalir,
                padding: EdgeInsets.all(15),
              ),
            ];


    AnimatedContainer mainPage = new AnimatedContainer(
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
                child:bProd ,
                padding: EdgeInsets.all(15),
              ),

              Padding(
                child: bPedidos,
                padding: EdgeInsets.all(15),
              ),
            ],

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/name.png"),
              )
            ],

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget>[
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                padding: EdgeInsets.all(15),
                child: bMenu,
              )
            ] ,
          ),
        ]
      )
    );

    var nombre = "${c.UsuariosC.Logueado.Nombre} ${c.UsuariosC.Logueado.Apellido}";

    AnimatedContainer menuPage = AnimatedContainer(
        duration: Duration(seconds: 10),
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          children: <Widget>[
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                  new GestureDetector(
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
                              c.UsuariosC.Logueado.Img_url
                                )
                        )
                    )),
                  ),
                    
                new Text(nombre,
                    textScaleFactor: 1.5)
              ],
            ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: flagadmin? botonesmenuadm:botonesmenu
            ),
          ],
        ),
      );

    

    List<Widget> _pages = <Widget>[
      mainPage,
      menuPage,
    ];

    return (new WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: new Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
          leading: new Container(),
          

        ),        
        body: Center(
          child:PageView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
                },
                ),
              )
      ),
    ));
  }
}
