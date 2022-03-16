import 'package:architecture_proposal/modules/auth/domain/entities/enums/type_user.dart';
import 'package:architecture_proposal/modules/auth/domain/entities/user.dart';

//This class could be called UserDto instead UserModel
//This is a single example dto. Could be improved
class UserModel extends User {
  UserModel({
    required String name,
    required String email,
    TypeUser? typeUser,
  }) : super(
          email: email,
          name: name,
          typeUser: typeUser ?? TypeUser.Common,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        email: json['email'],
        typeUser: typeUserJsonValues.entries
            .firstWhere(
              (item) => item.value == json['typeUser'],
              orElse: () => MapEntry(TypeUser.Common, 0),
            )
            .key,
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['name'] = name;
    json['email'] = email;
    json['typeUser'] = typeUser == TypeUser.Common ? 10 : 20;
    return json;
  }
}

const typeUserJsonValues = {TypeUser.Common: 10, TypeUser.Admin: 20};
