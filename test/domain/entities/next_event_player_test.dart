import 'package:flutter_test/flutter_test.dart';

import 'package:advanced_flutter/domain/entities/next_event_player.dart';

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
  test('Should ignore extra whitespaces', () {
    // sut: System Under Test
    expect(initialsOf('Eliakim França '), 'EF');
  });
}
