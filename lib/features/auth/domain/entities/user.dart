import 'package:architecture_proposal/features/auth/domain/entities/enums/type_user.dart';

class User {
  String userName;
  TypeUser typeUser;

  User({
    required this.userName,
    this.typeUser = TypeUser.Common,
  });

  bool get isAdmin => typeUser == TypeUser.Admin;
}
