import 'package:architecture_proposal/features/auth/data/models/user_model.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var userModel = UserModel(userName: 'bento@test.com');

  group('UserModelTests', () {
    test('UserModel is User', () {
      expect(userModel, isA<User>());
    });

    test('From Json', () {
      userModel = UserModel.fromJson({'userName': 'bento2@test.com'});

      expect(userModel, isA<User>());
      expect(userModel.userName, 'bento2@test.com');
    });

    test('To Json', () {
      userModel = UserModel(userName: 'bento3@test.com');

      final json = userModel.toJson();

      expect(json['userName'], 'bento3@test.com');
    });
  });
}
