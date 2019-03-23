import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/GenericButton.dart';
import '../../Components/PrototipoListaProductos.dart';
import '../../Components/MenuRoundButton.dart';
import '../../Components/FadeContainer.dart';
import 'homeAnimation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:swipedetector/swipedetector.dart';

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
  var animateStatus = 0;
  String textoPrueba = "Prueba";



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

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.3;
    Size screenSize = MediaQuery.of(context).size;

    final _controller = new PageController();

    MenuRoundButton menuButton = new MenuRoundButton(buttonGrowAnimation: buttonGrowAnimation,);

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

    RaisedButton bMenu = new RaisedButton(
            onPressed: (){
            setState(() {
              _controller.jumpToPage(0);
            });
            },
            child: const Text("Menu"),
            );

    AnimatedContainer mainPage = new AnimatedContainer(
      duration: Duration(seconds: 10),
      color: Color.fromARGB(255, 1, 1, 255),
      height: screenSize.height,
      width: screenSize.width,
      child: Column(
        children: <Widget>[
          Padding(
            child:bProd ,
            padding: EdgeInsets.all(15),
          ),

          Padding(
            child: bPedidos,
            padding: EdgeInsets.all(15),
          ),
          new PrototipoListaProductos(
            text:"Textos"
          ),
          Container(
            alignment: AlignmentDirectional.bottomEnd,
            child: menuButton,
            padding: EdgeInsets.all(15),
          ),
        ]
      )
    );

    AnimatedContainer menuPage = AnimatedContainer(
        duration: Duration(seconds: 10),
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          children: <Widget>[
            RaisedButton(
            onPressed: (){
              setState(() {
                _controller.jumpToPage(1);
              });
            },
            child: const Text("Salir"),
            ),
            RaisedButton(
            onPressed: (){},
            child: const Text("xD"),
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
        return true;
      },
      child: new Scaffold(
        appBar: AppBar(
          title: Text("AfriticApp"),
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
