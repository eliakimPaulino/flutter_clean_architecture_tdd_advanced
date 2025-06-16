import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  NextEventPlayer makeSut(String name) =>
      NextEventPlayer(id: '', name: name, isConfirmed: true);

  test('Should return the first letter of the first and last name', () {
    // sut: System Under Test
    expect(makeSut('Eliakim França').getInitials(), 'EF');

    expect(makeSut('Giulia Vasconcelos Neves Lamon').getInitials(), 'GL');

    expect(makeSut('Paulo Roberto').getInitials(), 'PR');

  });
}

class NextEventPlayer {
  final String id;
  final String name;
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
  });

  String getInitials() {
    final names = name.split(' ');
    if (names.length < 2) return names.first.isNotEmpty ? names.first[0] : '';
    return '${names.first[0]}${names.last[0]}';
  }
}
