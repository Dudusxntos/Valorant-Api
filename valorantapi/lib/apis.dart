import 'dart:ffi';

class Agente {
  String nome;
  List<String> skills;
  String descricao;
  String funcao;

  Agente({
    required this.nome,
    required this.descricao,
    required this.funcao,
    required this.skills,
  });

  Map<String, dynamic> toJson() => {
        'displayName': nome,
        'habilidades': skills,
        'description': descricao,
        'funcao': funcao
      };

  void exibirDetalhes() {
    print('Name: $nome, $descricao');
    print('Função: $funcao');
    print('Habilidades: $skills');
  }
}
