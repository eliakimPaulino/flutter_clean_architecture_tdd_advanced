import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

void main() {

    late String groupId;
    late LoadNextEventMockRepository repo;
    late NextEventLoader sut;

  setUp(() {
    groupId = Random().nextInt(50000).toString();
    repo = LoadNextEventMockRepository();
    sut = NextEventLoader(repo: repo);
  });

  test('Should load event data from a repository.', () async {
    await sut(groupId: groupId);
    expect(repo.groupId, groupId);
  });
}

class LoadNextEventMockRepository implements LoadNextEventRepository {
  // classe mock da camada de infra.
  String? groupId;
  var callsCount = 0;

  @override
  Future<void> loadNextEvent({required String groupId}) async {
    this.groupId = groupId;
    callsCount++;
  }
}

abstract class LoadNextEventRepository {
  // classe da camada de infra.
  Future<void> loadNextEvent({required String groupId});
}

class NextEventLoader {
  // classe da camada de domínio.
  final LoadNextEventRepository repo;

  NextEventLoader({required this.repo});

  Future<void> call({required String groupId}) async {
    await repo.loadNextEvent(groupId: groupId);
  }
}
