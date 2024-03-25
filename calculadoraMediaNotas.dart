// Nome: Emanuel Spinato
// Data: 25/03/2024
// Descrição da atividade: Este programa em Dart permite aos usuários calcular a média das notas de uma lista de alunos
// e identificar quais alunos obtiveram notas iguais ou superiores à média calculada.

import 'dart:io';

// Classe Aluno para representar cada aluno
class Aluno {
  String nome;
  double nota;

  // Construtor da classe Aluno
  Aluno(this.nome, this.nota);
}

// Função para adicionar alunos à lista
List<Aluno> adicionarAlunos() {
  List<Aluno> alunos = [];
  String nome;
  double nota;

  print('Digite o nome do aluno (ou "sair" para encerrar):');
  while ((nome = stdin.readLineSync()!) != 'sair') {
    print('Digite a nota do aluno:');
    nota = double.parse(stdin.readLineSync()!);
    alunos.add(Aluno(nome, nota));
    print('Digite o nome do aluno (ou "sair" para encerrar):');
  }
  return alunos;
}

// Função para calcular a média das notas
double calcularMedia(List<Aluno> alunos) {
  double soma = alunos.map((aluno) => aluno.nota).reduce((a, b) => a + b);
  return soma / alunos.length;
}

// Função para imprimir os alunos aprovados
void imprimirAlunosAprovados(List<Aluno> alunos, double media) {
  List<Aluno> aprovados = alunos.where((aluno) => aluno.nota >= media).toList();
  print('\nMédia das notas: $media');
  print('Alunos aprovados:');
  for (var aluno in aprovados) {
    print('${aluno.nome} - ${aluno.nota}');
  }
}

void main() {
  print('Bem-vindo ao programa de cálculo de média de notas!');

  // Adicionar alunos
  List<Aluno> alunos = adicionarAlunos();

  // Calcular média
  double media = calcularMedia(alunos);

  // Imprimir alunos aprovados
  imprimirAlunosAprovados(alunos, media);
}
