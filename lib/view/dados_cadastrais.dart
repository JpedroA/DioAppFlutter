import 'package:flutter/material.dart';
import 'package:login_page/repositories/leng_repository.dart';
import 'package:login_page/repositories/nivel_repository.dart';
import 'package:login_page/shared/widgets/text_Label.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var nomeController = TextEditingController(text: "");

  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;

  var nivelRpository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";

  var linguagens = [];
  var linguagensSelecionadas = [];
  var linguagemRepository = LinguagensRepository();

  double salarioEscolhido = 0;

  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRpository.retornaNiveis();
    linguagens = linguagemRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(child: Text(i.toString()), value: i));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("meus dados"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(texto: "Nome:"),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: "Data de nascimento:"),
                  TextField(
                    controller: dataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2024, 12, 31));
                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: "Nivel de Experiência"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            title: Text(nivel.toString()),
                            selected: nivelSelecionado == nivel,
                            value: nivel.toString(),
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              setState(() {
                                nivelSelecionado = value.toString();
                              });
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Linguagens"),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            dense: true,
                            title: Text(linguagem),
                            value: linguagensSelecionadas.contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  linguagensSelecionadas.add(linguagem);
                                });
                              } else {
                                setState(() {
                                  linguagensSelecionadas.remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de Experiencia"),
                  DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretensao Salarial. R\$ ${salarioEscolhido.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      }),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          salvando = false;
                        });

                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("O nome deve ser preenchido")));
                          return;
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("A data deve ser preenchida")));
                          return;
                        }
                        if (nivelSelecionado == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione um nivel de experiencia")));
                          return;
                        }
                        if (linguagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione ao menos uma linguagem")));
                          return;
                        }
                        if (tempoExperiencia <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Deve ter ao menos um ano de experiencia")));
                          return;
                        }
                        if (salarioEscolhido <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "O salario deve ser maior que zero")));
                          return;
                        }
                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Dados enviados")));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("SALVAR"))
                ],
              ),
      ),
    );
  }
}
