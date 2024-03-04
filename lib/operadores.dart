class Operando{
  static const List<String> operacoes = ['/','+','-','x', '='];
  String _operacao = '';
  bool _operacaoUso = false;
  String result = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;

  Operador(){
    _clear();
  }

  void _clear() {
    result = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operacao = '';
    _operacaoUso = false;
  }

  void aplicaComando(String comando) {
    if (comando == 'AC') {
      _clear();
    } else if (comando == 'DEL') {
      _deletaUltimoDig();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _addDigito(comando);
    }
  }

  void _deletaUltimoDig() {
    result = result.length > 1 ? result.substring(0, result.length - 1) : '0';
    _buffer[_bufferIndex] = double.tryParse(result)!;
  }
  void _setOperacao(String operacao) {
    // Verifica se a operação já está em uso e se a operação é a mesma que a atual se sim não faz nada.
    if (_operacaoUso && operacao == _operacao) return;

    // Se o índice do buffer é 0, significa que estamos no primeiro número da operação.
    if (_bufferIndex == 0) {
      _bufferIndex = 1; // Muda para o segundo número.

    }
    // Se a operação não for '=', atualiza a operação.
    if (operacao != '=') {
      _operacao = operacao;
    } else {
      _buffer[0] = _calcula(); // Realiza o cálculo e armazena o resultado no primeiro elemento do buffer.
    }
    // Converte o resultado para uma string.
    result = _buffer[0].toString();
    // Remove o '.0' se o resultado for um número inteiro.
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    _operacaoUso = true;
  }


  void _addDigito(String digit) {
    if (_operacaoUso) result = '0';

    if (result.contains('.') && digit == '.') digit = '';
    if (result == '0' && digit != '.') result = '';

    result += digit;

    _buffer[_bufferIndex] = double.tryParse(result)!;
    _operacaoUso = false;
  }

  double _calcula() {
    switch (_operacao) {
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      default:
        return 0.0;
    }
  }

}