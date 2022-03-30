import 'package:architecture_proposal/features/auth/data/models/user_model.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var userModel = UserModel(name: 'Bento', email: 'bento@test.com');

  group('UserModelTests', () {
    test('UserModel is User', () {
      expect(userModel, isA<User>());
    });

    test('From Json', () {
      userModel =
          UserModel.fromJson({'email': 'bento2@test.com', 'name': 'Bento2'});

      expect(userModel, isA<User>());
      expect(userModel.name, 'Bento2');
    });

    test('To Json', () {
      userModel = UserModel(name: 'Bento3', email: 'bento3@test.com');

      final json = userModel.toJson();

      expect(json['name'], 'Bento3');
    });
  });
}
