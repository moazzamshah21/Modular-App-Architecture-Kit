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
    case 'create':
      if (arguments.length < 2) {
        print('Usage: modular_app create <project_name> [--template=<name>]');
        exit(1);
      }
      final template = _getOption(arguments, '--template');
      createProject(arguments[1], template: template);
      break;
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
  modular_app create <project_name> [--template=<name>]
  modular_app init [--state=getx|riverpod]
  modular_app generate feature <name>

Templates: ecommerce | messaging | media | sleep_tracker
  (If --template is omitted, you will be prompted to select one.)

Examples:
  dart run modularapparchitecture:modular_app create my_app
  dart run modularapparchitecture:modular_app create my_shop --template=ecommerce
  dart run modularapparchitecture:modular_app generate feature auth
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

/// Package name used in template lib imports. Replaced with project name on create.
const _templatePackageName = 'modularapparchitecture';

/// Returns the package root directory (directory containing pubspec.yaml).
String _packageRoot() {
  final script = Platform.script;
  String path;
  if (script.isScheme('file')) {
    path = script.toFilePath();
  } else {
    exit(1);
  }
  var dir = File(path).parent;
  for (var i = 0; i < 10; i++) {
    if (File(p.join(dir.path, 'pubspec.yaml')).existsSync()) {
      return dir.path;
    }
    final parent = dir.parent;
    if (parent.path == dir.path) break;
    dir = parent;
  }
  print('Error: Could not find package root (pubspec.yaml).');
  exit(1);
}

void _copyDirRecursive(Directory source, Directory target,
    {String? projectPackageName}) {
  if (!target.existsSync()) target.createSync(recursive: true);
  for (final entity in source.listSync()) {
    final name = p.basename(entity.path);
    final targetPath = p.join(target.path, name);
    if (entity is File) {
      var content = entity.readAsStringSync();
      if (projectPackageName != null &&
          (name.endsWith('.dart') || name.endsWith('.yaml'))) {
        content = content.replaceAll(
          'package:$_templatePackageName/',
          'package:$projectPackageName/',
        );
      }
      File(targetPath).writeAsStringSync(content);
    } else if (entity is Directory) {
      _copyDirRecursive(entity, Directory(targetPath),
          projectPackageName: projectPackageName);
    }
  }
}

const _extraDependencies = '''
  get: ^4.6.6
  firebase_core: ^3.8.1
  firebase_auth: ^5.3.4
  cloud_firestore: ^5.5.2
  path: ^1.9.0
  dio: ^5.7.0
''';

void _mergePubspecDependencies(String projectPath) {
  final pubspec = File(p.join(projectPath, 'pubspec.yaml'));
  if (!pubspec.existsSync()) return;
  String content = pubspec.readAsStringSync();
  if (content.contains('get:')) return;
  final insert = _extraDependencies;
  final cupertinoLine = content.indexOf('cupertino_icons:');
  if (cupertinoLine == -1) return;
  final lineEnd = content.indexOf('\n', cupertinoLine);
  final insertIndex = lineEnd == -1 ? content.length : lineEnd + 1;
  content = content.substring(0, insertIndex) + insert + content.substring(insertIndex);
  pubspec.writeAsStringSync(content);
}

/// Available template keys and their display names. (Only templates from templates/ folder.)
const _templates = {
  'ecommerce': 'E-Commerce (products, cart, checkout)',
  'messaging': 'Messaging (chat list, chat screen)',
  'media': 'Music/Video (library, player, playlists)',
  'sleep_tracker': 'Sleep Tracker (logs, analytics)',
};

void _printTemplateMenu() {
  final list = _templates.entries.toList();
  stderr.writeln('');
  stderr.writeln('Choose a template:');
  for (var i = 0; i < list.length; i++) {
    stderr.writeln('  ${i + 1}) ${list[i].value}');
  }
  stderr.writeln('  Enter number (1-${list.length}) [default: 1 = E-Commerce]: ');
  stderr.flush();
}

String _selectTemplate(String? templateFlag) {
  if (templateFlag != null && templateFlag.isNotEmpty) {
    final key = templateFlag.toLowerCase().trim();
    if (_templates.containsKey(key)) return key;
    print('Unknown template: $templateFlag');
    print('Available: ${_templates.keys.join(", ")}');
    exit(1);
  }

  final list = _templates.entries.toList();
  _printTemplateMenu();

  if (!stdin.hasTerminal) {
    stderr.writeln('');
    stderr.writeln('No interactive terminal. Using E-Commerce template.');
    stderr.writeln('To use another: modular_app create <project_name> --template=<name>');
    stderr.writeln('  e.g. --template=messaging | --template=media | --template=sleep_tracker');
    stderr.flush();
    return list[0].key;
  }

  final line = stdin.readLineSync()?.trim();
  if (line == null || line.isEmpty) {
    stderr.writeln('No input. Using E-Commerce (1).');
    stderr.flush();
    return list[0].key;
  }
  final index = int.tryParse(line);
  if (index == null || index < 1 || index > list.length) {
    return list[0].key;
  }
  return list[index - 1].key;
}

void createProject(String name, {String? template}) {
  final cwd = p.current;
  final projectPath = p.join(cwd, name);

  if (Directory(projectPath).existsSync()) {
    print('Error: Directory "$name" already exists.');
    exit(1);
  }

  // Always show template selection first (so user sees it even if stderr is hidden).
  if (template == null || template.isEmpty) {
    print('');
    print('=== Choose a template ===');
    final list = _templates.entries.toList();
    for (var i = 0; i < list.length; i++) {
      print('  ${i + 1}) ${list[i].value}');
    }
    print('  Enter number (1-${list.length}) or use: --template=ecommerce');
    print('');
  }

  final templateKey = _selectTemplate(template);
  print('Using template: $templateKey');
  print('');

  print('Creating Flutter project: $name ...');
  final result = Process.runSync(
    'flutter',
    ['create', '--project-name', name, name],
    workingDirectory: cwd,
    runInShell: true,
  );
  if (result.exitCode != 0) {
    print('flutter create failed: ${result.stderr}');
    exit(1);
  }
  print('Flutter project created.');

  final packageRoot = _packageRoot();
  final templateLib = Directory(p.join(packageRoot, 'templates', templateKey, 'lib'));
  if (!templateLib.existsSync()) {
    print('Error: Template lib not found at ${templateLib.path}');
    exit(1);
  }

  final projectLib = Directory(p.join(projectPath, 'lib'));
  if (projectLib.existsSync()) {
    for (final entity in projectLib.listSync()) {
      if (entity is File) entity.deleteSync();
      if (entity is Directory) entity.deleteSync(recursive: true);
    }
  } else {
    projectLib.createSync(recursive: true);
  }

  print('Injecting template ($templateKey)...');
  _copyDirRecursive(templateLib, projectLib, projectPackageName: name);

  print('Adding dependencies to pubspec.yaml...');
  _mergePubspecDependencies(projectPath);

  print('');
  print('Done. Next steps:');
  print('  cd $name');
  print('  flutter pub get');
  print('  flutter run');
  print('');
  print('Optional: add Firebase (google-services, GoogleService-Info.plist) for auth.');
}
