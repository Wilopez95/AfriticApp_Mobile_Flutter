import 'package:flutterhttpget/ProductosControlador.dart';
import 'package:flutterhttpget/UsuariosControlador.dart';
import 'package:flutterhttpget/PedidosControlador.dart';
import 'package:flutterhttpget/AccesoApi.dart';

class Controlador{
  AccesoApi Acceso = new AccesoApi();
  ProductosControlador ProductosC = new ProductosControlador();
  UsuariosControlador UsuariosC = new UsuariosControlador();
  PedidosControlador PedidosC = new PedidosControlador();

  Inventario(){
    this.Acceso.getFromApi("https://afriticapp.herokuapp.com/Productos/").then((dynamic jsonResponse){
      this.ProductosC.CargarProductos(jsonResponse);
    });
  }

  Pedidos(){
    this.Acceso.getFromApi("https://afriticapp.herokuapp.com/Pedidos/").then((dynamic jsonResponse){
      this.PedidosC.CargarPedidos(jsonResponse);
    });
  }
  
  Usuarios(){
    this.Acceso.getFromApi("https://afriticapp.herokuapp.com/Usuarios/").then((dynamic jsonResponse){
      this.UsuariosC.CargarUsuario(jsonResponse);
    });
  }

  Login(map){
    this.Acceso.postToApi("https://afriticapp.herokuapp.com/Login/", map).then((dynamic jsonResponse){
      this.UsuariosC.Login(jsonResponse);
    });
  }

  Escribir(int link, var map){
    List<String> Links = ["https://afriticapp.herokuapp.com/Registrar/",
                          "https://afriticapp.herokuapp.com/Productos/Registrar/",
                           "https://afriticapp.herokuapp.com/Pedidos/Registrar/",
                           "https://afriticapp.herokuapp.com/Usuarios/Changepass/"];
    this.Acceso.postToApi(Links[link], map);
  }

  APIparametros(int link, int id){
    List<String> Links = ["https://afriticapp.herokuapp.com/Usuarios/Eliminar/",
                          "https://afriticapp.herokuapp.com/Usuarios/Cambiar/",
                          "https://afriticapp.herokuapp.com/Usuarios/Activar/",
                          "https://afriticapp.herokuapp.com/Productos/",
                          "https://afriticapp.herokuapp.com/Pedidos/"];
    this.Acceso.getFromApi(Links[link]+id.toString()+"/");
  }

}