import 'package:flutter/material.dart';

import 'package:afriticapp/Screens/Login/index.dart';
import 'package:afriticapp/Screens/Home/index.dart';
import 'package:afriticapp/Screens/Productos/index.dart';
import 'package:afriticapp/Screens/Pedidos/index.dart';
import 'package:afriticapp/Screens/Changepass/index.dart';
import 'package:afriticapp/Screens/Administrar/index.dart';
import 'package:afriticapp/Screens/Estadisticas/index.dart';
import 'package:afriticapp/Screens/Producto_detalle/index.dart';
import 'package:afriticapp/Screens/AgregarProducto/index.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "AfriticApp",
      debugShowCheckedModeBanner: false,
      home: new LoginScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => new LoginScreen(),
              settings: settings,
            );
          case '/home':
            return new MyCustomRoute(
              builder: (_) => new HomeScreen(),
              settings: settings,
            );
          case '/productos':
            return new MyCustomRoute(
              builder: (_) => new Productos(),
              settings: settings,
            );
          case '/pedidos':
            return new MyCustomRoute(
              builder: (_) => new Pedidos(),
              settings: settings,
            );
          case '/changepass':
            return new MyCustomRoute(
              builder: (_) => new Changepass(),
              settings: settings,
            );
          case '/estadisticas':
            return new MyCustomRoute(
              builder: (_) => new Estadisticas(),
              settings: settings,
            );
          case '/administrar':
            return new MyCustomRoute(
              builder: (_) => new Administrar(),
              settings: settings,
            );
          case '/desc_prod':
            return new MyCustomRoute(
              builder: (_) => new DetalleProducto(),
              settings: settings,
            );
          case '/add_prod':
            return new MyCustomRoute(
              builder: (_) => new AddProducto(),
              settings: settings,
            );

        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
      }
}