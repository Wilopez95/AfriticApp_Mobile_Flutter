class Product{
  final int ProductID;
  final String Estado_Producto;
  final String Nombre;
  final String Descripcion;
  final String Img_url;
  final String Tipo_Producto;
  final int Precio;
  final int Cantidad;

  Product({this.ProductID, this.Estado_Producto, this.Nombre, this.Descripcion,
  this.Img_url, this.Tipo_Producto, this.Precio, this.Cantidad});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      ProductID: json['ProductID'],
      Estado_Producto: json['Estado_Producto'],
      Nombre: json['Nombre'],
      Descripcion: json['Descripcion'],
      Img_url: json['Img_url'],
      Tipo_Producto: json['Tipo_Producto'],
      Precio: json['Precio'],
      Cantidad: json['Cantidad']
    );
  }

}

class ProductosControlador{

  List<Product> Inventario = new List<Product>();

  RegistrarProducto(){
    //Código para cuando esté el post listo.
  }

  CargarProductos(jsonResponse){
    Product Producto;
    for(int i = 0; i<jsonResponse.length; i++)
      {
          Producto = new Product.fromJson(jsonResponse[i]);
          this.Inventario.add(Producto);
      }
  }

  BuscarProductos(){

  }
  
  EliminarProducto(){
    //Código para cuando esté el post listo.
  }
  ModificarProducto(){
    //Código para cuando esté el post listo.
  }
}