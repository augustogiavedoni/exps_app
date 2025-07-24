// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:database_client/src/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$DatabaseClientException', () {
    group('$AddException', () {
      test('Can be instantiated.', () {
        expect(() => AddException('oops'), isNotNull);
      });
    });

    group('$GetException', () {
      test('Can be instantiated.', () {
        expect(() => GetException('oops'), isNotNull);
      });
    });

    group('$UpdateException', () {
      test('Can be instantiated.', () {
        expect(() => UpdateException('oops'), isNotNull);
      });
    });

    group('$DeleteException', () {
      test('Can be instantiated.', () {
        expect(() => DeleteException('oops'), isNotNull);
      });
    });
  });
}
