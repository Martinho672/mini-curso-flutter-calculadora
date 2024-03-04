class Operador {
  static const operacoes = ['/', '+', '-', 'x', '='];
  String _operacao = '';
  bool _operacaoUso = false;
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;

  String result = '0';

  Operador() {
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

  void _addDigito(String digit) {
    if (_operacaoUso) result = '0';

    if (result.contains('.') && digit == '.') digit = '';
    if (result == '0' && digit != '.') result = '';

    result += digit;

    _buffer[_bufferIndex] = double.tryParse(result)!;
    _operacaoUso = false;
  }

  void _setOperacao(String operacao) {
    if (_operacaoUso && operacao == _operacao) return;

    if (_bufferIndex == 0) {
      _bufferIndex = 1;

      if (operacao == '=') {
        _operacao = operacao;
      }
    }
    if (operacao != '=') {
      _operacao = operacao;
    } else {
      _buffer[0] = _calcula();
    }

    result = _buffer[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    _operacaoUso = true;
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
