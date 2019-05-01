class User{
  final int UserID;
  final String Estado_Cuenta;
  final String Nombre;
  final String Apellido;
  final String Correo;
  final String Contrasenna;
  final String Img_url;
  final String Tipo_Cuenta;
 
  User(
      {this.UserID, this.Estado_Cuenta, this.Contrasenna,
      this.Nombre, this.Apellido, this.Correo, this.Img_url, this.Tipo_Cuenta});
 
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UserID: json['UserID'],
      Estado_Cuenta: json['Estado_Cuenta'],
      Nombre: json['Nombre'],
      Apellido: json['Apellido'],
      Correo: json['Correo'],
      Contrasenna: json['Contraseña'],
      Img_url: json['Img_url'],
      Tipo_Cuenta: json['Tipo_Cuenta']
    );
  }

  

}

class UsuariosControlador{
  
  List<User> ListaUsuarios= new List<User>();
  User Logueado;
  int estadoLogin = -3;

  Login(jsonResponse){
    if(jsonResponse is int)
    {
      estadoLogin = -1;
    }
    else
    {
      estadoLogin = 0;
      this.Logueado = new User.fromJson(jsonResponse);
    }
  }

  CargarUsuario(jsonResponse){
    User usuario;
    ListaUsuarios = new List<User>();
    for(int i = 0; i<jsonResponse.length; i++)
      {
          usuario = new User.fromJson(jsonResponse[i]);
          this.ListaUsuarios.add(usuario);
      }
  }

  BuscarUsuario(){
    
  }

  EliminarUsuario(){
    //Código para cuando esté el eliminar en django.
  }

  ModificarPedido(){
    //Código para cuando esté el post listo.
  }
}