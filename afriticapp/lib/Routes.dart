import 'package:afriticapp/Screens/Pedido_detalle/index.dart';
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
import 'package:afriticapp/Screens/AgregarPedido/index.dart';
import 'package:afriticapp/Screens/Admin_productos/index.dart';
import 'package:afriticapp/Screens/Admin_usuarios/index.dart';
import 'package:afriticapp/Screens/Crear_usuario/index.dart';

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
            case '/add_ped':
            return new MyCustomRoute(
              builder: (_) => new AddOrder(),
              settings: settings,
            );
            case '/desc_ped':
            return new MyCustomRoute(
              builder: (_) => new DetallePedido(),
              settings: settings,
            );
            case '/admin_pedidos':
            return new MyCustomRoute(
              builder: (_) => new Adminproductos(),
              settings: settings,
            );
            case '/admin_usuarios':
            return new MyCustomRoute(
              builder: (_) => new Adminusers(),
              settings: settings,
            );
            case '/new_user':
            return new MyCustomRoute(
              builder: (_) => new Newuser(),
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