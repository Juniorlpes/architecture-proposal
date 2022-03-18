import 'package:architecture_proposal/features/auth/data/models/type_user_dto.dart';
import 'package:architecture_proposal/features/auth/domain/entities/enums/type_user.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';

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
    json['typeUser'] = typeUserJsonValues[typeUser];
    return json;
  }
}
