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

  bool compare(String key){
    List<dynamic> Atributes=[this.ProductID, this.Estado_Producto, this.Nombre, this.Descripcion,
    this.Img_url, this.Tipo_Producto, this.Precio, this.Cantidad];

    for (var i = 0; i < Atributes.length; i++) {
      if (Atributes[i].toString().contains(key)){
        return true;
      }
    }
    return false;
  }

}

class ProductosControlador{

  List<Product> Inventario = new List<Product>();
  List<Product> Resultados = new List<Product>();

  CargarProductos(jsonResponse){
    Product Producto;
    Inventario = new List<Product>();
    for(int i = 0; i<jsonResponse.length; i++)
      {
          Producto = new Product.fromJson(jsonResponse[i]);
          this.Inventario.add(Producto);
      }
  }

  BuscarProductos(String key){
    for (var i = 0; i < this.Inventario.length; i++) {
      if (this.Inventario[i].compare(key)){
        Resultados.add(this.Inventario[i]);
        print(this.Inventario[i].ProductID.toString());
      }
    }
  }
  
  EliminarProducto(){
    //Código para cuando esté el eliminar en django.
  }
  ModificarProducto(){
    //Código para cuando esté el post listo.
  }
}