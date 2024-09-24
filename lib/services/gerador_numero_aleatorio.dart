import 'dart:math';

class GeradorNumerosAleatorioServices {
 static int gerarNumeroAleatorio( int numeroMaximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numeroMaximo);
  }
}