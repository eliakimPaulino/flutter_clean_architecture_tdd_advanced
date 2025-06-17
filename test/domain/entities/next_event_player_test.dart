import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  String initialsOf(String name) =>
      NextEventPlayer(id: '', name: name, isConfirmed: true).initials;

  test('Should return the first letter of the first and last name', () {
    // sut: System Under Test
    expect(initialsOf('Eliakim França'), 'EF');

    expect(initialsOf('Giulia Vasconcelos Neves Lamon'), 'GL');
  });

  test('Should return the firsts two letters of the first name', () {
    // sut: System Under Test
    expect(initialsOf('Paulo'), 'PA');
  });

  test('Should return the firsts letter case Name is just one char', () {
    // sut: System Under Test
    expect(initialsOf('l'), 'L');
  });
  test('Should return - case Name is empty', () {
    // sut: System Under Test
    expect(initialsOf(''), '-');
  });
}

class NextEventPlayer {
  final String id;
  final String name;
  late final String initials;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  NextEventPlayer({
    required this.id,
    required this.name,
    this.photo,
    this.position,
    required this.isConfirmed,
    this.confirmationDate,
  }) {
    initials = getInitials();
  }

  String getInitials() {
    final names = name.toUpperCase().split(' ');
    print(names);
    final firstChar = names.first.split('').firstOrNull ?? '-';
    final lastChar =
        names.last.split('').elementAtOrNull(names.length == 1 ? 1 : 0) ?? '';
    print('$firstChar$lastChar');
    return '$firstChar$lastChar';
  }
}
