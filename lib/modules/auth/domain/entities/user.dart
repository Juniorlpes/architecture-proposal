import 'package:architecture_proposal/modules/auth/domain/entities/enums/type_user.dart';

class User {
  String name;
  String email;
  TypeUser typeUser;

  User({
    required this.name,
    required this.email,
    this.typeUser = TypeUser.Common,
  });

  bool get isAdmin => typeUser == TypeUser.Admin;
}
