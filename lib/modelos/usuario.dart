class Usuario {
  final String email;
  final String senha;

  Usuario({
    required this.email,
    required this.senha,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      email: json['email'],
      senha: json['senha'],
    );
  }
}
