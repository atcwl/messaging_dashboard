import 'dart:io';

void main(List<String> arguments) {
  final msgFile = File(arguments[0]);
  final msg = msgFile.readAsStringSync().trim();

  final pattern = RegExp(
    r'^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .+',
  );

  if (!pattern.hasMatch(msg)) {
    stderr.writeln('❌ Commit message does not follow Conventional Commits.');
    stderr.writeln('Expected format: type(scope): description');
    exit(1);
  }

  stdout.writeln('✔ Commit message passes Conventional Commits');
}
