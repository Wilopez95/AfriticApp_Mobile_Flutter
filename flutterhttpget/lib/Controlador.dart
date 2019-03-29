import 'package:flutterhttpget/ProductosControlador.dart';
import 'package:flutterhttpget/UsuariosControlador.dart';
import 'package:flutterhttpget/PedidosControlador.dart';
import 'package:flutterhttpget/AccesoApi.dart';

class Controlador{
  AccesoApi Acceso = new AccesoApi();
  ProductosControlador ProductosC = new ProductosControlador();
  UsuariosControlador UsuariosC = new UsuariosControlador();
  PedidosControlador PedidosC = new PedidosControlador();

  Inventario(url){
    this.Acceso.getFromApi(url).then((dynamic jsonResponse){
      this.ProductosC.CargarProductos(jsonResponse);
    });
  }

  Pedidos(url){
    this.Acceso.getFromApi(url).then((dynamic jsonResponse){
      this.PedidosC.CargarPedidos(jsonResponse);
    });
  }
  
  Future Usuarios(url) async{
    var jsonResponse = await this.Acceso.getFromApi(url);
    this.UsuariosC.CargarUsuario(jsonResponse);
  }

}