class Student {
  String curso;
  String email;
  String id;
  String imagem;
  String nome;
  String periodo;
  String sobrenome;

  Student({
    required this.curso,
    required this.email,
    required this.id,
    required this.imagem,
    required this.nome,
    required this.periodo,
    required this.sobrenome,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        curso: json["curso"],
        email: json["email"],
        id: json["id"],
        imagem: json["imagem"],
        nome: json["nome"],
        periodo: json["periodo"],
        sobrenome: json["sobrenome"],
      );

  Map<String, dynamic> toJson() => {
        "curso": curso,
        "email": email,
        "id": id,
        "imagem": imagem,
        "nome": nome,
        "periodo": periodo,
        "sobrenome": sobrenome,
      };
}
