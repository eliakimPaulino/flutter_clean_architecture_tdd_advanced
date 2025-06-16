import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  String initialsOf(String name) =>
      NextEventPlayer(id: '', name: name, isConfirmed: true).initials;

  test('Should return the first letter of the first and last name', () {
    // sut: System Under Test
    expect(initialsOf('Eliakim França'), 'EF');

    expect(initialsOf('Giulia Vasconcelos Neves Lamon'), 'GL');

    expect(initialsOf('Paulo Roberto'), 'PR');
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
    final names = name.split(' ');
    if (names.length < 2) return names.first.isNotEmpty ? names.first[0] : '';
    return '${names.first[0]}${names.last[0]}';
  }
}
