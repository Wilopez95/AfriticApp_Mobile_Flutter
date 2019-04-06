import 'package:afriticapp/API_Access/ProductosControlador.dart';
import 'package:afriticapp/API_Access/UsuariosControlador.dart';
import 'package:afriticapp/API_Access/PedidosControlador.dart';
import 'package:afriticapp/API_Access/AccesoApi.dart';

class Controlador{

  static final Controlador instancia = new Controlador._internal();

  Controlador._internal(){
    Acceso = new AccesoApi();
    ProductosC = new ProductosControlador();
    UsuariosC = new UsuariosControlador();
    PedidosC = new PedidosControlador();
  }

  factory Controlador()
  {
    return instancia;
  }


  AccesoApi Acceso;
  ProductosControlador ProductosC;
  UsuariosControlador UsuariosC;
  PedidosControlador PedidosC;

  Future Inventario() async {
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
    this.Acceso.getFromApi("https://afriticapp.herokuapp.com/Usuarios/").then(
      (dynamic jsonResponse){
        if(jsonResponse is int)
        {
          print("Error Usuarios");
        }
        else{
          this.UsuariosC.CargarUsuario(jsonResponse);
        }
    });
  }

  Login(usuario, pass) {
    var map = {"Correo": usuario,"Contraseña": pass};
    this.Acceso.postToApi("https://afriticapp.herokuapp.com/Login/", map).then(
      (dynamic jsonResponse){
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