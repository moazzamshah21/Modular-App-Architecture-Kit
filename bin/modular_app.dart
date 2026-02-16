#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    _printUsage();
    exit(1);
  }

  final command = arguments[0].toLowerCase();

  switch (command) {
    case 'generate':
      if (arguments.length < 3) {
        print('Usage: modular_app generate feature <name>');
        exit(1);
      }
      final sub = arguments[1].toLowerCase();
      final name = arguments[2];
      if (sub == 'feature') {
        generateFeature(name);
      } else {
        print('Unknown generate target: $sub');
        exit(1);
      }
      break;
    case 'init':
      final state = _getOption(arguments, '--state') ?? 'getx';
      init(state);
      break;
    default:
      _printUsage();
      exit(1);
  }
}

void _printUsage() {
  print('''
Modular App Architecture Kit 2026 — CLI

Usage:
  modular_app init [--state=getx|riverpod]
  modular_app generate feature <name>

Examples:
  dart run modularapparchitecture:modular_app generate feature auth
  dart run modularapparchitecture:modular_app generate feature profile
  dart run modularapparchitecture:modular_app init --state=getx
''');
}

String? _getOption(List<String> args, String flag) {
  for (final a in args) {
    if (a.startsWith('$flag=')) return a.substring(flag.length + 1);
    if (a == flag) return 'true';
  }
  return null;
}

void generateFeature(String name) {
  final root = p.current;
  final libDir = p.join(root, 'lib');
  final featuresDir = p.join(libDir, 'features');
  final featureDir = p.join(featuresDir, name);

  final dirs = [
    p.join(featureDir, 'data', 'models'),
    p.join(featureDir, 'data', 'repositories'),
    p.join(featureDir, 'data', 'datasources'),
    p.join(featureDir, 'domain', 'entities'),
    p.join(featureDir, 'domain', 'usecases'),
    p.join(featureDir, 'presentation', 'controllers'),
    p.join(featureDir, 'presentation', 'pages'),
    p.join(featureDir, 'presentation', 'widgets'),
    p.join(featureDir, 'bindings'),
  ];

  for (final d in dirs) {
    Directory(d).createSync(recursive: true);
  }

  final capName = _capitalize(name);

  _writeFile(
    p.join(featureDir, 'bindings', '${name}_binding.dart'),
    _bindingContent(name, capName),
  );
  _writeFile(
    p.join(featureDir, 'domain', 'entities', '.gitkeep'),
    '',
  );
  _writeFile(
    p.join(featureDir, 'data', 'models', '.gitkeep'),
    '',
  );

  print('Feature "$name" created at lib/features/$name/');
  print('Next: add routes and bindings in core/routes and main.dart');
}

String _capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1).toLowerCase();
}

void _writeFile(String path, String content) {
  final f = File(path);
  if (!f.existsSync()) f.writeAsStringSync(content);
}

String _bindingContent(String name, String capName) {
  return '''
import 'package:get/get.dart';

/// Bindings for $name feature.
class ${capName}Binding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => ${capName}Controller(Get.find()));
  }
}
''';
}

void init(String state) {
  print('Init with state management: $state');
  print('Project already uses GetX. See lib/core/di/app_bindings.dart');
}
