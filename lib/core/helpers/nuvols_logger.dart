// ignore_for_file: public_member_api_docs, sort_constructors_first
/// Classe para centralizar as mensagens de logg do desenvolvimento
/// Utilizo o pacote logger na versão logger: ^1.3.0 para controlar o
/// visual dos logs
/// Url Pacote: https://pub.dev/packages/logger/example
/// [Exemplo de uso]
///    NuvolsLogger.instance.info("Apenas uma informação teste");
///    NuvolsLogger.instance.erro("Erro", "", StackTrace.current);
///    NuvolsLogger.instance.debug("Debug", "", StackTrace.current);
///    NuvolsLogger.instance.warning("Warning", "", StackTrace.current);
///    NuvolsLogger.instance.crash("Crash", "", StackTrace.current);
///    NuvolsLogger.instance.verbose({"chave": "valor"});
///

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Classe com métodos abstratos para gerar logs costomizados
///
/// [Exemplo de uso]
/// ```
/// NuvolsLogger.instance.info("Apenas uma informação teste");
/// ```
/// ```
/// NuvolsLogger.instance.erro("Erro", "", StackTrace);
/// ```
/// ```
/// NuvolsLogger.instance.debug("Debug", "", StackTrace.current);
/// ```
/// ```
/// NuvolsLogger.instance.warning("Warning", "", StackTrace.current);
/// ```
/// ```
/// NuvolsLogger.instance.crash("Crash", "", StackTrace);
/// ```
/// ```
/// NuvolsLogger.instance.verbose({"chave": "valor"});
/// ```

class NuvolsLogger {
  static NuvolsLogger? _instance;
  final Logger _logger = Logger();

  NuvolsLogger._();

  static NuvolsLogger get instance {
    _instance ??= NuvolsLogger._();
    return _instance!;
  }

  void erro(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) _logger.e(message, error, stackTrace);
  }

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) _logger.i(message, error, stackTrace);
  }

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) _logger.d(message, error, stackTrace);
  }

  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) _logger.w(message, error, stackTrace);
  }

  void crash(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) _logger.wtf(message, error, stackTrace);
  }

  void verbose(dynamic message) {
    if (kDebugMode) _logger.v(message);
  }
}
