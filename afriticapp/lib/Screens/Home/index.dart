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

    GestureDetector bSalir = new GestureDetector(
      child: GenericButton(
        title: "Salir",
      ),
      onTap: () {
        setState(() {
          _controller.jumpToPage(0);
        });
      },
    );

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

    AnimatedContainer menuPage = AnimatedContainer(
        duration: Duration(seconds: 10),
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: bSalir,
            )
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
