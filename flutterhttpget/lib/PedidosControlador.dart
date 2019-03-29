class Pedido{
  final int PedidoID;
  final String Cliente;
  final String Fecha;
  final String Tipo_Estado;
  final int Precio_Total;
  final int Usuario;
 
  Pedido({this.PedidoID, this.Cliente, this.Fecha, this.Tipo_Estado, this.Precio_Total, this.Usuario});
 
  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      PedidoID: json['PedidoID'],
      Cliente: json['Cliente'],
      Fecha: json['Fecha'],
      Tipo_Estado: json['Tipo_Estado'],
      Precio_Total: json['Precio_Total'],
      Usuario: json['Usuario']
    );
  }
}

class PedidosControlador{

  List<Pedido> ListaPedidos = new List<Pedido>();

  RegistrarPedido(){
    //Código para cuando esté el post listo.
  }

  CargarPedidos(jsonResponse){
    Pedido pedido;
    for(int i = 0; i<jsonResponse.length; i++)
      {
          pedido = new Pedido.fromJson(jsonResponse[i]);
          this.ListaPedidos.add(pedido);
      }
  }

  BuscarPedidos(){

  }

  ModificarPedido(){
    //Código para cuando esté el post listo.
  }
}