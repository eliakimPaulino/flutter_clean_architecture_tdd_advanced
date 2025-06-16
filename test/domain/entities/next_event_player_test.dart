import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('Should return the first letter of the first and last name', () {
    final player = NextEventPlayer(
      id: '',
      name: 'Eliakim França',
      isConfirmed: true,
    );
    expect(player.getInitials(), 'EF');

    final player2 = NextEventPlayer(
      id: '',
      name: 'Giulia Vasconcelos Neves Lamon',
      isConfirmed: true,
    );
    expect(player2.getInitials(), 'GL');

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
