import 'package:apis/apis.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<List<dynamic>> buscarAgentesApi() async {
  final url = Uri.parse('https://valorant-api.com/v1/agents');
  final resposta = await http.get(url);

  if (resposta.statusCode == 200) {
    var dados = jsonDecode(resposta.body);
    return dados['data'];
  } else {
    throw Exception('Erro: ${resposta.statusCode}');
  }
}

Future<void> main() async {
  print('Iniciando busca na seleção de agentes...\n');
  List<Agente> catalogo = [];

  try {
    List<dynamic> listaAgente = await buscarAgentesApi();

    for (var item in listaAgente) {
      String nome = item['displayName'];
      String descricao = item['description'];
      String funcao = item['role']?['displayName'];
      List<dynamic> skills = item['abilities'];
      List<String> listaHabilidades = [];

      for (var habilidade in skills) {
        listaHabilidades.add(habilidade['displayName'].toString());
      }

      Agente novoItem = Agente(
        nome: nome,
        descricao: descricao,
        funcao: funcao,
        skills: listaHabilidades,
      );

      catalogo.add(novoItem);
    }

    print('Total de agentes carregados: ${catalogo.length}\n');

    while (true) {
      print('Menu');
      print('[1] - Listar todos Agentes \n[2] - Pesquisar \n[0] - Sair');
      stdout.write('Escolha uma opção: ');

      String? opcao = stdin.readLineSync();
      print('');

      switch (opcao) {
        case '1':
          print('Lista de Todos Agentes');
          for (var agente in catalogo) {
            agente.exibirDetalhes();
            print('');
          }
          break;

        case '2':
          stdout.write('Digite o nome do agente: ');
          String busca = (stdin.readLineSync() ?? '').trim().toLowerCase();
          print('\nResultados');
          var resultados = catalogo
              .where((a) => a.nome.toLowerCase().contains(busca))
              .toList();
          if (busca.isEmpty || resultados.isEmpty) {
            print('Nenhum agente encontrado.\n');
          } else {
            for (var agente in resultados) {
              agente.exibirDetalhes();
              print('');
            }
          }
          break;

        case '0':
          print('Saindo do programa...');
          return;

        default:
          print('Opção inválida! Tente novamente.\n');
          break;
      }
    }
  } catch (e) {
    print('Falha ao carregar: $e');
  }
}
